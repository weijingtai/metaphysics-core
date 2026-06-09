import 'package:timezone/timezone.dart' as tz;
import '../../../models/calculation_strategy_config_logic_model.dart';
import '../../../models/chinese_date_info.dart';
import '../../../helpers/solar_lunar_datetime_helper.dart';

class DSTProcessor {
  static Future<DSTProcessResult> process({
    required DateTime standardDateTime,
    required String timezoneStr,
    required CalculationStrategyConfigLogicModel config,
  }) async {
    final location = tz.getLocation(timezoneStr);
    final tzDateTime = tz.TZDateTime.from(standardDateTime, location);

    // 检查是否处于夏令时
    final isDST = tzDateTime.timeZone.isDst;

    DateTime? removeDSTDatetime;
    ChineseDateInfo? removeDSTChineseInfo;
    DSTTransitionInfo? transitionInfo;
    Duration dstOffset = Duration.zero;

    if (isDST) {
      dstOffset = _calculateDSTOffset(location, standardDateTime);
      removeDSTDatetime = standardDateTime.subtract(dstOffset);

      // 计算移除夏令时后的中国日期信息
      removeDSTChineseInfo = SolarLunarDateTimeHelper.cacluateChineseDateInfoV2(
        removeDSTDatetime,
        config,
      );

      // 获取夏令时转换信息
      transitionInfo = _getDSTTransitionInfo(location, standardDateTime);
    }

    return DSTProcessResult(
      isDST: isDST,
      removeDSTDatetime: removeDSTDatetime,
      removeDSTChineseInfo: removeDSTChineseInfo,
      dstOffset: dstOffset,
      transitionInfo: transitionInfo,
    );
  }

  /// 获取指定时区的标准时间偏移量（非夏令时）。
  ///
  /// 通过测试不同日期，此方法找到一个不在夏令时期间的日期，并返回其UTC偏移量。
  /// 这对于计算不受夏令时影响的基准时区偏移非常有用。
  ///
  /// [location] The `tz.Location` object representing the timezone.
  /// [year] The integer value of the year for which to determine the standard offset.
  ///
  /// Returns a `Duration` representing the standard time offset from UTC for the given location.
  /// In the rare case that the entire year is in DST, it returns an estimated offset.
  static Duration _getStandardOffset(tz.Location location, int year) {
    // 尝试1月1日（通常不是夏令时）
    var testDate = DateTime(year, 1, 1);
    var tzTestDate = tz.TZDateTime.from(testDate, location);

    if (!tzTestDate.timeZone.isDst) {
      return Duration(milliseconds: tzTestDate.timeZone.offset);
    }

    // 如果1月1日是夏令时，尝试7月1日
    testDate = DateTime(year, 7, 1);
    tzTestDate = tz.TZDateTime.from(testDate, location);

    if (!tzTestDate.timeZone.isDst) {
      return Duration(milliseconds: tzTestDate.timeZone.offset);
    }

    // 如果两个日期都是夏令时，遍历每个月的1号找到非夏令时
    for (int month = 1; month <= 12; month++) {
      testDate = DateTime(year, month, 1);
      tzTestDate = tz.TZDateTime.from(testDate, location);

      if (!tzTestDate.timeZone.isDst) {
        return Duration(milliseconds: tzTestDate.timeZone.offset);
      }
    }

    // 如果整年都是夏令时（极少见情况），返回当前偏移量减去1小时作为估算
    final currentDate = DateTime(year, 6, 1);
    final currentTzDate = tz.TZDateTime.from(currentDate, location);
    return Duration(milliseconds: currentTzDate.timeZone.offset) -
        const Duration(hours: 1);
  }

  /// 计算给定日期时间的夏令时（DST）偏移量。
  ///
  /// 如果指定的日期时间不在夏令时期间，则返回`Duration.zero`。
  /// 否则，它将计算标准时间（非夏令时）偏移量与当前DST偏移量之间的差值。
  ///
  /// [location] The `tz.Location` object for the timezone.
  /// [dateTime] The `DateTime` for which to calculate the DST offset.
  ///
  /// Returns a `Duration` representing the DST offset.
  static Duration _calculateDSTOffset(tz.Location location, DateTime dateTime) {
    final tzDateTime = tz.TZDateTime.from(dateTime, location);
    if (!tzDateTime.timeZone.isDst) {
      return Duration.zero;
    }

    final standardOffset = _getStandardOffset(location, dateTime.year);
    final dstOffset =
        Duration(milliseconds: tzDateTime.timeZone.offset) - standardOffset;
    return dstOffset;
  }

  /// 获取夏令时转换信息
  static DSTTransitionInfo? _getDSTTransitionInfo(
    tz.Location location,
    DateTime dateTime,
  ) {
    try {
      final year = dateTime.year;

      // 查找该年的夏令时开始和结束时间
      DateTime? dstStart;
      DateTime? dstEnd;

      // 遍历该年的时区转换点
      for (int month = 1; month <= 12; month++) {
        final testDate = DateTime(year, month, 1);
        final tzTestDate = tz.TZDateTime.from(testDate, location);

        if (tzTestDate.timeZone.isDst && dstStart == null) {
          dstStart = _findExactTransition(location, year, month, true);
        } else if (!tzTestDate.timeZone.isDst &&
            dstStart != null &&
            dstEnd == null) {
          dstEnd = _findExactTransition(location, year, month, false);
          break;
        }
      }

      return DSTTransitionInfo(dstStart: dstStart, dstEnd: dstEnd, year: year);
    } catch (e) {
      return null;
    }
  }

  /// 精确查找夏令时转换时间点
  static DateTime? _findExactTransition(
    tz.Location location,
    int year,
    int month,
    bool isDSTStart,
  ) {
    // 简化实现，实际可以使用二分查找获得精确时间
    for (int day = 1; day <= 31; day++) {
      try {
        final testDate = DateTime(year, month, day);
        final tzTestDate = tz.TZDateTime.from(testDate, location);

        if (isDSTStart && tzTestDate.timeZone.isDst) {
          return testDate;
        } else if (!isDSTStart && !tzTestDate.timeZone.isDst) {
          return testDate;
        }
      } catch (e) {
        continue;
      }
    }
    return null;
  }
}

class DSTProcessResult {
  final bool isDST;
  final DateTime? removeDSTDatetime;
  final ChineseDateInfo? removeDSTChineseInfo;
  final Duration dstOffset;
  final DSTTransitionInfo? transitionInfo;

  DSTProcessResult({
    required this.isDST,
    this.removeDSTDatetime,
    this.removeDSTChineseInfo,
    required this.dstOffset,
    this.transitionInfo,
  });

  /// 获取夏令时偏移小时数
  double get dstOffsetHours => dstOffset.inMilliseconds / (1000 * 60 * 60);

  /// 获取处理摘要
  Map<String, dynamic> getSummary() {
    return {
      'isDST': isDST,
      'offsetHours': dstOffsetHours,
      'hasTransitionInfo': transitionInfo != null,
      'removeDSTTime': removeDSTDatetime?.toIso8601String(),
    };
  }
}

class DSTTransitionInfo {
  final DateTime? dstStart;
  final DateTime? dstEnd;
  final int year;

  DSTTransitionInfo({this.dstStart, this.dstEnd, required this.year});
}

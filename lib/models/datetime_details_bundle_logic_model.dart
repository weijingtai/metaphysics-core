import 'package:metaphysics_core/models/chinese_date_info.dart';
import 'package:metaphysics_core/models/calculation_strategy_config_logic_model.dart';
import 'package:metaphysics_core/datamodel/location.dart';
import 'package:equatable/equatable.dart';

/// 业务逻辑层：日期时间详细计算结果
///
/// 包含标准时间、UTC时间、时区、夏令时校正后时间、
/// 平太阳时、真太阳时，以及各时间对应的中国日期信息。
/// 纯业务数据，无 Flutter 依赖。
class DateTimeDetailsBundleLogicModel extends Equatable {
  /// 计算策略配置
  final CalculationStrategyConfigLogicModel calculationConfig;

  /// 标准出生时间
  final DateTime standeredDatetime;
  final ChineseDateInfo standeredChineseInfo;

  /// UTC 时间（用于国际版区分）
  final DateTime utcDatetime;
  /// 时区名称（如 "Asia/Shanghai"）
  final String timezoneStr;

  /// 夏令时相关
  final bool? isDST;
  final DateTime? removeDSTDatetime;
  final ChineseDateInfo? removeDSTChineseInfo;

  /// 平太阳时相关（需要经纬度）
  final Location? location;
  final DateTime? meanSolarDatetime;
  final ChineseDateInfo? meanSolarChineseInfo;

  /// 真太阳时相关（需要精确经纬度）
  final Coordinates? coordinates;
  final DateTime? trueSolarDatetime;
  final ChineseDateInfo? trueSolarChineseInfo;

  const DateTimeDetailsBundleLogicModel({
    required this.calculationConfig,
    required this.standeredDatetime,
    required this.standeredChineseInfo,
    required this.utcDatetime,
    required this.timezoneStr,
    this.isDST,
    this.removeDSTDatetime,
    this.removeDSTChineseInfo,
    this.location,
    this.meanSolarDatetime,
    this.meanSolarChineseInfo,
    this.coordinates,
    this.trueSolarDatetime,
    this.trueSolarChineseInfo,
  });

  @override
  List<Object?> get props => [
    calculationConfig,
    standeredDatetime,
    standeredChineseInfo,
    utcDatetime,
    timezoneStr,
    isDST,
    removeDSTDatetime,
    removeDSTChineseInfo,
    location,
    meanSolarDatetime,
    meanSolarChineseInfo,
    coordinates,
    trueSolarDatetime,
    trueSolarChineseInfo,
  ];
}

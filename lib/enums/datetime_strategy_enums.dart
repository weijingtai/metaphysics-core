import 'package:json_annotation/json_annotation.dart';

/// 子时策略枚举
@JsonEnum()
enum ZiShiStrategy {
  /// 不区分早晚：23 为界，23:00–1:00 统一按次日（日时均次日）
  @JsonValue('noDistinguishAt23')
  noDistinguishAt23,

  /// 区分早晚：0 为界，时柱五鼠遁（晚子时当日、早子时次日；时柱均按次日）
  @JsonValue('distinguishAt0FiveMouse')
  distinguishAt0FiveMouse,

  /// 区分早晚：0 为界，时柱固定壬子/癸丑
  @JsonValue('distinguishAt0Fixed')
  distinguishAt0Fixed,

  /// 以 0:00-1:59 为子时，整日两小时一支（五鼠遁起干）
  @JsonValue('bandsStartAt0')
  bandsStartAt0,

  // 兼容旧值（保留序列化兼容性）
  @JsonValue('startFrom23')
  startFrom23, // 旧：映射为 noDistinguishAt23

  @JsonValue('startFrom0')
  startFrom0, // 旧：映射为 distinguishAt0FiveMouse

  @JsonValue('splitedZi')
  splitedZi, // 旧：映射为 distinguishAt0FiveMouse
}

/// 节气类型枚举
@JsonEnum()
enum JieQiType {
  @JsonValue('leveling')
  leveling("平气法"),

  @JsonValue('stabilizing')
  stabilizing("定气法"),

  @JsonValue('trueSolar')
  trueSolar("真太阳时");

  final String name;
  const JieQiType(this.name);
}

/// 节气策略枚举
@JsonEnum()
enum JieQiStrategy {
  /// 节气的划分按照时间点所在的"日期"进行划分
  @JsonValue('day')
  day,

  /// 节气的划分按照时间点所在的"时辰"进行划分
  @JsonValue('hour')
  hour,

  /// 节气的划分按照时间点所在的"分秒"进行划分
  @JsonValue('minute')
  minute,
}

/// 物候计算策略（相对于所选节气基准）
enum PhenologyStrategy {
  /// 基于定气法节气交节时刻，物候时刻 = 交节 + n*5 天
  stabilizingBased,

  /// 基于平气法节气交节时刻，物候时刻 = 交节 + n*5 天
  levelingBased,
}

/// 交节精度
@JsonEnum()
enum JieQiEntryPrecision {
  @JsonValue("shichen")
  shichen,
  @JsonValue("hour")
  hour,
  @JsonValue("minute")
  minute,
  @JsonValue("exactMinute")
  exactMinute,
  @JsonValue("second")
  second,
}

/// 时间精度
@JsonEnum()
enum TimeAccuracy {
  @JsonValue("shichen")
  shichen,
  @JsonValue("hour")
  hour,
  @JsonValue("minute")
  minute,
  @JsonValue("exactMinute")
  exactMinute,
  @JsonValue("second")
  second,
}

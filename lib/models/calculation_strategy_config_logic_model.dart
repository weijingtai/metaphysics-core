import 'package:metaphysics_core/enums/datetime_strategy_enums.dart';
import 'package:equatable/equatable.dart';

/// 业务逻辑层：计算策略配置
///
/// 封装子时策略、节气类型、节气策略等核心业务配置。
/// 纯业务数据，无 Flutter 依赖，无存储字段。
class CalculationStrategyConfigLogicModel extends Equatable {
  /// 子时策略
  final ZiShiStrategy ziStrategy;

  /// 节气类型（平气法/定气法）
  final JieQiType jieQiType;

  /// 节气策略（按日/按时辰/按分钟）
  final JieQiStrategy jieQiStrategy;

  /// 物候计算策略
  final PhenologyStrategy phenologyStrategy;

  /// 交节精度
  final JieQiEntryPrecision jieQiEntryPrecision;

  const CalculationStrategyConfigLogicModel({
    required this.ziStrategy,
    required this.jieQiType,
    required this.jieQiStrategy,
    required this.phenologyStrategy,
    required this.jieQiEntryPrecision,
  });

  /// 默认配置
  ///
  /// [ziStrategy] 使用 [ZiShiStrategy.noDistinguishAt23]（23:00 为界，日时均次日），
  /// 这是 [ZiShiStrategy.startFrom23] 的正式语义名称。
  static const CalculationStrategyConfigLogicModel defaultConfig =
      CalculationStrategyConfigLogicModel(
        ziStrategy: ZiShiStrategy.noDistinguishAt23,
        jieQiType: JieQiType.stabilizing,
        jieQiStrategy: JieQiStrategy.day,
        phenologyStrategy: PhenologyStrategy.stabilizingBased,
        jieQiEntryPrecision: JieQiEntryPrecision.hour,
      );

  CalculationStrategyConfigLogicModel copyWith({
    ZiShiStrategy? ziStrategy,
    JieQiType? jieQiType,
    JieQiStrategy? jieQiStrategy,
    PhenologyStrategy? phenologyStrategy,
    JieQiEntryPrecision? jieQiEntryPrecision,
  }) {
    return CalculationStrategyConfigLogicModel(
      ziStrategy: ziStrategy ?? this.ziStrategy,
      jieQiType: jieQiType ?? this.jieQiType,
      jieQiStrategy: jieQiStrategy ?? this.jieQiStrategy,
      phenologyStrategy: phenologyStrategy ?? this.phenologyStrategy,
      jieQiEntryPrecision: jieQiEntryPrecision ?? this.jieQiEntryPrecision,
    );
  }

  @override
  List<Object?> get props => [
    ziStrategy,
    jieQiType,
    jieQiStrategy,
    phenologyStrategy,
    jieQiEntryPrecision,
  ];
}

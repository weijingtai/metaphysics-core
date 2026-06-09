import 'package:equatable/equatable.dart';

/// 胎元逻辑模型 — 用于规则计算的强类型字段
class TaiYuanLogicModel extends Equatable {
  final String yearGanZhi;
  final String monthGanZhi;
  final String calculationMethod;
  final DateTime birthDateTime;

  const TaiYuanLogicModel({
    required this.yearGanZhi,
    required this.monthGanZhi,
    required this.calculationMethod,
    required this.birthDateTime,
  });

  @override
  List<Object?> get props => [yearGanZhi, monthGanZhi, calculationMethod, birthDateTime];
}

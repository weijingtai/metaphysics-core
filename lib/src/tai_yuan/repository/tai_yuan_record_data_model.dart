import 'package:equatable/equatable.dart';

/// 胎元数据模型 — 面向持久化与同步的 schema-stable 字段
class TaiYuanRecordDataModel extends Equatable {
  final String uuid;
  final String divinationUuid;
  final String yearGanZhi;
  final String monthGanZhi;
  final String calculationMethod;
  final DateTime createdAt;
  final DateTime? deletedAt;

  const TaiYuanRecordDataModel({
    required this.uuid,
    required this.divinationUuid,
    required this.yearGanZhi,
    required this.monthGanZhi,
    required this.calculationMethod,
    required this.createdAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
        uuid,
        divinationUuid,
        yearGanZhi,
        monthGanZhi,
        calculationMethod,
        createdAt,
        deletedAt,
      ];
}

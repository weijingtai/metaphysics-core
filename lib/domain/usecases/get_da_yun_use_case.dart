import 'package:metaphysics_core/models/chinese_date_info.dart';
import 'package:metaphysics_core/models/da_yun_pillar.dart';
import 'package:metaphysics_core/enums.dart';
import 'package:metaphysics_core/domain/calculators/da_yun/da_yun_calculator.dart';

// Define input parameters for the use case
class GetDaYunParams {
  final ChineseDateInfo dateInfo;
  final DateTime birthDateTime;
  final Gender gender;
  final int stepDuration;
  final int pillarCount;

  GetDaYunParams({
    required this.dateInfo,
    required this.birthDateTime,
    required this.gender,
    this.stepDuration = 10,
    this.pillarCount = 8,
  });
}

class GetDaYunUseCase {
  final DaYunCalculator _calculator;

  GetDaYunUseCase(this._calculator);

  List<DaYunPillar> call(GetDaYunParams params) {
    return _calculator.calculate(
      dateInfo: params.dateInfo,
      birthDateTime: params.birthDateTime,
      gender: params.gender,
      stepDuration: params.stepDuration,
      pillarCount: params.pillarCount,
    );
  }
}

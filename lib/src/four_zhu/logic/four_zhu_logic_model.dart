/// Logic model for Four Zhu pillar derivation — strongly typed, rule-oriented.
///
/// Consumed by calculators and use cases inside metaphysics_core.
/// This model is NOT for UI rendering or repository persistence.
class FourZhuLogicModel {
  /// Creates a [FourZhuLogicModel].
  const FourZhuLogicModel({
    required this.yearPillarStem,
    required this.yearPillarBranch,
    required this.monthPillarStem,
    required this.monthPillarBranch,
    required this.dayPillarStem,
    required this.dayPillarBranch,
    required this.hourPillarStem,
    required this.hourPillarBranch,
  });

  /// Heavenly stem of the year pillar (0-9 index into 天干).
  final int yearPillarStem;

  /// Earthly branch of the year pillar (0-11 index into 地支).
  final int yearPillarBranch;

  /// Heavenly stem of the month pillar.
  final int monthPillarStem;

  /// Earthly branch of the month pillar.
  final int monthPillarBranch;

  /// Heavenly stem of the day pillar.
  final int dayPillarStem;

  /// Earthly branch of the day pillar.
  final int dayPillarBranch;

  /// Heavenly stem of the hour pillar.
  final int hourPillarStem;

  /// Earthly branch of the hour pillar.
  final int hourPillarBranch;
}

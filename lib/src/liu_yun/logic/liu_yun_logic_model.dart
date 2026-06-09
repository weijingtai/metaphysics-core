/// Logic model for Liu Yun (流运 / annual/monthly/daily luck flow) derivation.
///
/// Strongly typed, rule-oriented. Consumed by calculators inside metaphysics_core.
/// This model is NOT for UI rendering or repository persistence.
class LiuYunLogicModel {
  /// Creates a [LiuYunLogicModel].
  const LiuYunLogicModel({
    required this.targetYear,
    required this.liuNianStem,
    required this.liuNianBranch,
    this.liuYueStem,
    this.liuYueBranch,
    this.liuRiStem,
    this.liuRiBranch,
  });

  /// The target Gregorian year being analyzed.
  final int targetYear;

  /// Heavenly stem of the Liu Nian (流年 / annual flow).
  final int liuNianStem;

  /// Earthly branch of the Liu Nian.
  final int liuNianBranch;

  /// Heavenly stem of the Liu Yue (流月 / monthly flow), if resolved.
  final int? liuYueStem;

  /// Earthly branch of the Liu Yue, if resolved.
  final int? liuYueBranch;

  /// Heavenly stem of the Liu Ri (流日 / daily flow), if resolved.
  final int? liuRiStem;

  /// Earthly branch of the Liu Ri, if resolved.
  final int? liuRiBranch;
}

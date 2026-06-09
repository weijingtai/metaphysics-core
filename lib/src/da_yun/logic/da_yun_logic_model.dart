/// Logic model for Da Yun (大运 / major luck cycle) derivation.
///
/// Strongly typed, rule-oriented. Consumed by calculators inside metaphysics_core.
/// This model is NOT for UI rendering or repository persistence.
class DaYunLogicModel {
  /// Creates a [DaYunLogicModel].
  const DaYunLogicModel({
    required this.startAge,
    required this.startYear,
    required this.cycles,
  });

  /// Age at which the first Da Yun cycle begins.
  final int startAge;

  /// Gregorian year in which the first Da Yun cycle begins.
  final int startYear;

  /// Ordered list of Da Yun cycles, each represented by stem-branch pairs.
  final List<DaYunCycleLogic> cycles;
}

/// A single Da Yun cycle within [DaYunLogicModel].
class DaYunCycleLogic {
  /// Creates a [DaYunCycleLogic].
  const DaYunCycleLogic({
    required this.cycleIndex,
    required this.stem,
    required this.branch,
    required this.startAge,
    required this.endAge,
  });

  /// Zero-based index of this cycle in the sequence.
  final int cycleIndex;

  /// Heavenly stem index (0-9).
  final int stem;

  /// Earthly branch index (0-11).
  final int branch;

  /// Starting age for this cycle.
  final int startAge;

  /// Ending age for this cycle.
  final int endAge;
}

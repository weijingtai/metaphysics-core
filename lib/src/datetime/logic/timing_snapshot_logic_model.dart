/// Logic model for a resolved timing snapshot — result of datetime strategy resolution.
///
/// Holds the strongly typed fields that downstream calculation logic needs.
/// This model is NOT for UI rendering or repository persistence.
class TimingSnapshotLogicModel {
  /// Creates a [TimingSnapshotLogicModel].
  const TimingSnapshotLogicModel({
    required this.solarYear,
    required this.solarMonth,
    required this.solarDay,
    required this.solarHour,
    required this.solarMinute,
    required this.lunarYear,
    required this.lunarMonth,
    required this.lunarDay,
    required this.isLeapMonth,
    required this.jieQiName,
    required this.trueSolarHour,
    required this.trueSolarMinute,
  });

  /// Resolved Gregorian year.
  final int solarYear;

  /// Resolved Gregorian month.
  final int solarMonth;

  /// Resolved Gregorian day.
  final int solarDay;

  /// Resolved solar hour (after DST/timezone adjustment).
  final int solarHour;

  /// Resolved solar minute.
  final int solarMinute;

  /// Resolved lunar year (stem-branch encoded as int or kept as-is).
  final int lunarYear;

  /// Resolved lunar month.
  final int lunarMonth;

  /// Resolved lunar day.
  final int lunarDay;

  /// Whether the resolved lunar month is a leap month.
  final bool isLeapMonth;

  /// Name of the active Jie Qi (节气), if any.
  final String jieQiName;

  /// True solar time hour component.
  final int trueSolarHour;

  /// True solar time minute component.
  final int trueSolarMinute;
}

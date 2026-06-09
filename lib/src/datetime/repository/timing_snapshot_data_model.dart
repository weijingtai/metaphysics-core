/// Repository (data) model for a persisted timing snapshot.
///
/// Schema-stable, serialization-friendly fields for storage adapters.
/// This model is consumed by Drift tables and sync code.
/// It is NOT for UI rendering or rule calculation.
class TimingSnapshotDataModel {
  /// Creates a [TimingSnapshotDataModel].
  const TimingSnapshotDataModel({
    required this.id,
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
    required this.createdAt,
  });

  /// Unique identifier (UUID string).
  final String id;

  /// Persisted Gregorian year.
  final int solarYear;

  /// Persisted Gregorian month.
  final int solarMonth;

  /// Persisted Gregorian day.
  final int solarDay;

  /// Persisted solar hour.
  final int solarHour;

  /// Persisted solar minute.
  final int solarMinute;

  /// Persisted lunar year.
  final int lunarYear;

  /// Persisted lunar month.
  final int lunarMonth;

  /// Persisted lunar day.
  final int lunarDay;

  /// Whether the persisted lunar month is a leap month.
  final bool isLeapMonth;

  /// Jie Qi name at the time of persistence.
  final String jieQiName;

  /// True solar time hour at persistence.
  final int trueSolarHour;

  /// True solar time minute at persistence.
  final int trueSolarMinute;

  /// ISO 8601 creation timestamp.
  final String createdAt;
}

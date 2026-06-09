/// Repository (data) model for a persisted Four Zhu record.
///
/// Schema-stable, serialization-friendly fields for storage adapters.
/// This model is consumed by Drift tables and sync code.
/// It is NOT for UI rendering or rule calculation.
class FourZhuRecordDataModel {
  /// Creates a [FourZhuRecordDataModel].
  const FourZhuRecordDataModel({
    required this.id,
    required this.yearPillarStem,
    required this.yearPillarBranch,
    required this.monthPillarStem,
    required this.monthPillarBranch,
    required this.dayPillarStem,
    required this.dayPillarBranch,
    required this.hourPillarStem,
    required this.hourPillarBranch,
    required this.timingSnapshotId,
    required this.createdAt,
  });

  /// Unique identifier (UUID string).
  final String id;

  /// Persisted year pillar stem index.
  final int yearPillarStem;

  /// Persisted year pillar branch index.
  final int yearPillarBranch;

  /// Persisted month pillar stem index.
  final int monthPillarStem;

  /// Persisted month pillar branch index.
  final int monthPillarBranch;

  /// Persisted day pillar stem index.
  final int dayPillarStem;

  /// Persisted day pillar branch index.
  final int dayPillarBranch;

  /// Persisted hour pillar stem index.
  final int hourPillarStem;

  /// Persisted hour pillar branch index.
  final int hourPillarBranch;

  /// Foreign key to the associated timing snapshot.
  final String timingSnapshotId;

  /// ISO 8601 creation timestamp.
  final String createdAt;
}

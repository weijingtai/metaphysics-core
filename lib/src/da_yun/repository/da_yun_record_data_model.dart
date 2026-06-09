/// Repository (data) model for a persisted Da Yun record.
///
/// Schema-stable, serialization-friendly fields for storage adapters.
/// This model is consumed by Drift tables and sync code.
/// It is NOT for UI rendering or rule calculation.
class DaYunRecordDataModel {
  /// Creates a [DaYunRecordDataModel].
  const DaYunRecordDataModel({
    required this.id,
    required this.fourZhuRecordId,
    required this.cycleIndex,
    required this.stem,
    required this.branch,
    required this.startAge,
    required this.endAge,
    required this.createdAt,
  });

  /// Unique identifier (UUID string).
  final String id;

  /// Foreign key to the associated Four Zhu record.
  final String fourZhuRecordId;

  /// Zero-based cycle index.
  final int cycleIndex;

  /// Persisted heavenly stem index.
  final int stem;

  /// Persisted earthly branch index.
  final int branch;

  /// Persisted starting age.
  final int startAge;

  /// Persisted ending age.
  final int endAge;

  /// ISO 8601 creation timestamp.
  final String createdAt;
}

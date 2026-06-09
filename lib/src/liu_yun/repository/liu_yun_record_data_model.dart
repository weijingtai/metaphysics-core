/// Repository (data) model for a persisted Liu Yun record.
///
/// Schema-stable, serialization-friendly fields for storage adapters.
/// This model is consumed by Drift tables and sync code.
/// It is NOT for UI rendering or rule calculation.
class LiuYunRecordDataModel {
  /// Creates a [LiuYunRecordDataModel].
  const LiuYunRecordDataModel({
    required this.id,
    required this.fourZhuRecordId,
    required this.targetYear,
    required this.liuNianStem,
    required this.liuNianBranch,
    this.liuYueStem,
    this.liuYueBranch,
    this.liuRiStem,
    this.liuRiBranch,
    required this.createdAt,
  });

  /// Unique identifier (UUID string).
  final String id;

  /// Foreign key to the associated Four Zhu record.
  final String fourZhuRecordId;

  /// Persisted target year.
  final int targetYear;

  /// Persisted Liu Nian stem index.
  final int liuNianStem;

  /// Persisted Liu Nian branch index.
  final int liuNianBranch;

  /// Persisted Liu Yue stem index, null if not resolved.
  final int? liuYueStem;

  /// Persisted Liu Yue branch index, null if not resolved.
  final int? liuYueBranch;

  /// Persisted Liu Ri stem index, null if not resolved.
  final int? liuRiStem;

  /// Persisted Liu Ri branch index, null if not resolved.
  final int? liuRiBranch;

  /// ISO 8601 creation timestamp.
  final String createdAt;
}

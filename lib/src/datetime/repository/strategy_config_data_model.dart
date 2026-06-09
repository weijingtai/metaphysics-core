/// Repository (data) model for a persisted strategy configuration.
///
/// Schema-stable, serialization-friendly fields for storage adapters.
/// This model is consumed by Drift tables and sync code.
/// It is NOT for UI rendering or rule calculation.
class StrategyConfigDataModel {
  /// Creates a [StrategyConfigDataModel].
  const StrategyConfigDataModel({
    required this.id,
    required this.strategyType,
    required this.configKey,
    required this.configValue,
    required this.createdAt,
    this.updatedAt,
  });

  /// Unique identifier (UUID string).
  final String id;

  /// Strategy type identifier (e.g. "zi_hour", "jie_qi", "solar_time").
  final String strategyType;

  /// Configuration key.
  final String configKey;

  /// Configuration value (serialized as string).
  final String configValue;

  /// ISO 8601 creation timestamp.
  final String createdAt;

  /// ISO 8601 last-update timestamp, null if never updated.
  final String? updatedAt;
}

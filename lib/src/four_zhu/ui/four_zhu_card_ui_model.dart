/// UI model for the Four Zhu card — presentation-shaped, widget-friendly.
///
/// Consumed by UI packages such as xuan-four-zhu-card.
/// This model carries formatted text, color keys, and display fields.
/// It is NOT for rule calculation or repository persistence.
class FourZhuCardUiModel {
  /// Creates a [FourZhuCardUiModel].
  const FourZhuCardUiModel({
    required this.yearPillarText,
    required this.monthPillarText,
    required this.dayPillarText,
    required this.hourPillarText,
    required this.yearPillarColorKey,
    required this.monthPillarColorKey,
    required this.dayPillarColorKey,
    required this.hourPillarColorKey,
    this.yearPillarHidden,
    this.monthPillarHidden,
    this.dayPillarHidden,
    this.hourPillarHidden,
  });

  /// Display text for the year pillar (e.g. "甲子").
  final String yearPillarText;

  /// Display text for the month pillar.
  final String monthPillarText;

  /// Display text for the day pillar.
  final String dayPillarText;

  /// Display text for the hour pillar.
  final String hourPillarText;

  /// Color key for the year pillar (e.g. "wood", "fire").
  final String yearPillarColorKey;

  /// Color key for the month pillar.
  final String monthPillarColorKey;

  /// Color key for the day pillar.
  final String dayPillarColorKey;

  /// Color key for the hour pillar.
  final String hourPillarColorKey;

  /// Whether the year pillar is hidden in the card layout.
  final bool? yearPillarHidden;

  /// Whether the month pillar is hidden in the card layout.
  final bool? monthPillarHidden;

  /// Whether the day pillar is hidden in the card layout.
  final bool? dayPillarHidden;

  /// Whether the hour pillar is hidden in the card layout.
  final bool? hourPillarHidden;
}

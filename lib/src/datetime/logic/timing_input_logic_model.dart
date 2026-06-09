/// Logic model for timing input — strongly typed fields needed by rule calculation.
///
/// This model is consumed by calculators and use cases inside metaphysics_core.
/// It is NOT for UI rendering or repository persistence.
class TimingInputLogicModel {
  /// Creates a [TimingInputLogicModel].
  const TimingInputLogicModel({
    required this.year,
    required this.month,
    required this.day,
    required this.hour,
    required this.minute,
    required this.isLunar,
    required this.timezoneOffset,
    this.isLeapMonth = false,
  });

  /// Gregorian or lunar year.
  final int year;

  /// Month (1-12).
  final int month;

  /// Day (1-31).
  final int day;

  /// Hour (0-23).
  final int hour;

  /// Minute (0-59).
  final int minute;

  /// Whether the input is in lunar calendar.
  final bool isLunar;

  /// Whether the lunar month is a leap month.
  final bool isLeapMonth;

  /// UTC offset in hours (e.g. 8.0 for UTC+8).
  final double timezoneOffset;
}

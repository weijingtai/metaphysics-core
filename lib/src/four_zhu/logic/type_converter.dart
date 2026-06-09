import 'package:metaphysics_core/enums/enum_jia_zi.dart';
import 'package:metaphysics_core/enums/enum_gender.dart';
import 'package:metaphysics_core/enums/enum_datetime_type.dart';

/// Converts a [JiaZi] to a [JiaZi].
JiaZi convertCoreJiaziToCommon(JiaZi jiaZi) {
  return JiaZi.values.byName(jiaZi.name);
}

/// Converts a [Gender] to a [Gender].
Gender convertCoreGenderToCommon(Gender gender) {
  return Gender.values.byName(gender.name);
}

/// Converts a [DateTimeType] to a [DateTimeType].
DateTimeType convertCoreDateTimeTypeToCommon(DateTimeType dateTimeType) {
  return DateTimeType.values.byName(dateTimeType.name);
}

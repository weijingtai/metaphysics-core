import '../enums/enum_gender.dart';

/// 四柱文本常量
class FourZhuText {
  static const String qianZao = '乾造';
  static const String kunZao = '坤造';
  static const String riYuan = '日元';

  static String zaoLabelForGender(Gender gender) {
    switch (gender) {
      case Gender.male:
        return qianZao;
      case Gender.female:
        return kunZao;
      case Gender.unknown:
        return riYuan;
    }
  }

  static String zaoLabelOrEmptyForGender(Gender gender) {
    switch (gender) {
      case Gender.male:
        return qianZao;
      case Gender.female:
        return kunZao;
      case Gender.unknown:
        return '';
    }
  }
}

import 'package:metaphysics_core/models/chinese_date_info.dart';
import 'package:metaphysics_core/models/datetime_details_bundle_logic_model.dart';
import 'package:metaphysics_core/models/divination_datetime.dart';
import 'package:equatable/equatable.dart';

/// 业务逻辑层数据模型
///
/// 封装农历日期信息的纯业务数据，不含任何 UI 控制字段。
/// 由 core 层定义，供上层（UI、存储）转换使用。
class LunarDateInfoV2LogicModel extends Equatable {
  /// 包含详细日期和时间信息的捆绑包。
  final DateTimeDetailsBundleLogicModel bundle;

  /// 当前使用的日期时间类型（标准、真太阳时等）。
  final EnumDatetimeType inUsed;

  const LunarDateInfoV2LogicModel({required this.bundle, required this.inUsed});

  /// 根据 [inUsed] 类型解析正确的 [ChineseDateInfo]。
  ChineseDateInfo? get chineseDateInfo {
    switch (inUsed) {
      case EnumDatetimeType.standard:
        return bundle.standeredChineseInfo;
      case EnumDatetimeType.removeDST:
        return bundle.removeDSTChineseInfo;
      case EnumDatetimeType.meanSolar:
        return bundle.meanSolarChineseInfo;
      case EnumDatetimeType.trueSolar:
        return bundle.trueSolarChineseInfo;
    }
  }

  /// 根据 [inUsed] 类型解析正确的 [DateTime]。
  DateTime? get dateTime {
    switch (inUsed) {
      case EnumDatetimeType.standard:
        return bundle.standeredDatetime;
      case EnumDatetimeType.removeDST:
        return bundle.removeDSTDatetime;
      case EnumDatetimeType.meanSolar:
        return bundle.meanSolarDatetime;
      case EnumDatetimeType.trueSolar:
        return bundle.trueSolarDatetime;
    }
  }

  @override
  List<Object?> get props => [bundle, inUsed];
}

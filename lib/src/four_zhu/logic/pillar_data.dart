import 'package:metaphysics_core/enums/enum_jia_zi.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:metaphysics_core/enums/layout_template_enums.dart';

// Backward-compat re-exports preserved from the previous placeholder file.
// Do not remove without auditing downstream callers.
export 'package:metaphysics_core/models/eight_chars.dart';
export '../repository/four_zhu_record_data_model.dart';

part 'pillar_data.g.dart';

@JsonSerializable()
class PillarData extends Equatable {
  final String pillarId; // A unique ID, e.g., "year", "month", "da_yun_1"
  final PillarType pillarType;
  final String label; // The display label, e.g., "年", "月", "大运"
  final JiaZi jiaZi; // The core Stem-Branch data

  const PillarData({
    required this.pillarId,
    required this.pillarType,
    required this.label,
    required this.jiaZi,
  });

  factory PillarData.fromJson(Map<String, dynamic> json) =>
      _$PillarDataFromJson(json);

  Map<String, dynamic> toJson() => _$PillarDataToJson(this);

  @override
  List<Object?> get props => [pillarId, pillarType, label, jiaZi];
}

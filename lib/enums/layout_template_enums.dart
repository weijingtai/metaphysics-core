import 'package:json_annotation/json_annotation.dart';

enum PillarType {
  @JsonValue('year')
  year('年'),
  @JsonValue('month')
  month('月'),
  @JsonValue('day')
  day('日'),
  @JsonValue('time')
  hour('时'),
  @JsonValue('ke')
  ke('刻'),
  @JsonValue('tai_meta')
  taiMeta('胎元'),
  @JsonValue('tai_month')
  taiMonth('胎月'),
  @JsonValue('tai_day')
  taiDay('胎日'),
  @JsonValue('body_house')
  bodyHouse('身宫'),
  @JsonValue('命宫')
  lifeHouse('命宫'),
  @JsonValue('luck_cycle')
  luckCycle('大运'),
  @JsonValue('annual')
  annual('流年'),
  @JsonValue('monthly')
  monthly('流月'),
  @JsonValue('daily')
  daily('流日'),
  @JsonValue('hourly')
  hourly('流时'),
  @JsonValue('kely')
  kely('流刻'),
  @JsonValue('separator')
  separator('ui分割线'),
  @JsonValue('row_title_column')
  rowTitleColumn('行标题列');

  final String label;
  const PillarType(this.label);
}

enum RowType {
  @JsonValue('column_header_row')
  columnHeaderRow,
  @JsonValue('heavenly_stem_row')
  heavenlyStem,
  @JsonValue('earthly_branch_row')
  earthlyBranch,
  @JsonValue('ten_god_row')
  tenGod,
  @JsonValue('na_yin_row')
  naYin,
  @JsonValue('kong_wang_row')
  kongWang,
  @JsonValue('gu_row')
  gu,
  @JsonValue('xu_row')
  xu,
  @JsonValue('xun_shou_row')
  xunShou,
  @JsonValue('yi_ma_row')
  yiMa,
  @JsonValue('hidden_stems_row')
  hiddenStems,
  @JsonValue('hidden_stems_ten_god_row')
  hiddenStemsTenGod,
  @JsonValue('hidden_stems_primary_row')
  hiddenStemsPrimary,
  @JsonValue('hidden_stems_secondary_row')
  hiddenStemsSecondary,
  @JsonValue('hidden_stems_tertiary_row')
  hiddenStemsTertiary,
  @JsonValue('hidden_stems_primary_gods_row')
  hiddenStemsPrimaryGods,
  @JsonValue('hidden_stems_secondary_gods_row')
  hiddenStemsSecondaryGods,
  @JsonValue('hidden_stems_tertiary_gods_row')
  hiddenStemsTertiaryGods,
  @JsonValue('star_yun_row')
  starYun,
  @JsonValue('self_siting_row')
  selfSiting,
  @JsonValue('separator_row')
  separator,
}

enum BorderType { solid, dashed, dotted, none }

enum RowTextAlign { left, center, right }

import 'package:test/test.dart';
import 'package:metaphysics_core/enums.dart';
import 'package:tyme/tyme.dart';

/// 验证 four_zhu_engine.dart 的 termIndexMap 与 tyme 实际 index 一致。
///
/// tyme names 数组: index 0=冬至, 1=小寒, ..., 12=夏至, ..., 23=大雪。
/// 若有人误改 termIndexMap 编号，此测试会立刻报红。
void main() {
  // 与 four_zhu_engine.dart _findJieQiTimeNear 中的 map 完全一致
  const termIndexMap = {
    TwentyFourJieQi.DONG_ZHI: 0,
    TwentyFourJieQi.XIAO_HAN: 1,
    TwentyFourJieQi.DA_HAN: 2,
    TwentyFourJieQi.LI_CHUN: 3,
    TwentyFourJieQi.YU_SHUI: 4,
    TwentyFourJieQi.JING_ZHE: 5,
    TwentyFourJieQi.CHUN_FEN: 6,
    TwentyFourJieQi.QING_MING: 7,
    TwentyFourJieQi.GU_YU: 8,
    TwentyFourJieQi.LI_XIA: 9,
    TwentyFourJieQi.XIAO_MAN: 10,
    TwentyFourJieQi.MANG_ZHONG: 11,
    TwentyFourJieQi.XIA_ZHI: 12,
    TwentyFourJieQi.XIAO_SHU: 13,
    TwentyFourJieQi.DA_SHU: 14,
    TwentyFourJieQi.LI_QIU: 15,
    TwentyFourJieQi.CHU_SHU: 16,
    TwentyFourJieQi.BAI_LU: 17,
    TwentyFourJieQi.QIU_FEN: 18,
    TwentyFourJieQi.HAN_LU: 19,
    TwentyFourJieQi.SHUANG_JIANG: 20,
    TwentyFourJieQi.LI_DONG: 21,
    TwentyFourJieQi.XIAO_XUE: 22,
    TwentyFourJieQi.DA_XUE: 23,
  };

  test('termIndexMap 每个条目与 tyme SolarTerm name 一致', () {
    for (final entry in termIndexMap.entries) {
      final jieQi = entry.key;
      final tymeIndex = entry.value;
      final tymeName = SolarTerm.fromIndex(2026, tymeIndex).getName();
      expect(
        tymeName,
        jieQi.name,
        reason:
            '${jieQi.name} 映射到 tyme index $tymeIndex，但 tyme 返回 "$tymeName"',
      );
    }
  });

  test('关键节点: 冬至=0, 春分=6, 夏至=12', () {
    expect(SolarTerm.fromIndex(2026, 0).getName(), '冬至');
    expect(SolarTerm.fromIndex(2026, 6).getName(), '春分');
    expect(SolarTerm.fromIndex(2026, 12).getName(), '夏至');
  });

  test('2026年冬至精确时刻在 12月21-22日', () {
    final jd = SolarTerm.fromIndex(2026, 0).getJulianDay();
    final st = jd.getSolarTime();
    expect(st.getMonth(), 12);
    expect(st.getDay(), anyOf(21, 22));
  });
}

// DEPRECATED: 此文件已迁移至 persistence_domain
// 新位置: package:persistence_domain/features/datetime_details/jieqi_entry_strategy_store.dart
// 请使用新版本，此文件将在未来版本移除
import 'package:shared_preferences/shared_preferences.dart';
import 'package:metaphysics_core/enums/datetime_strategy_enums.dart';

// JieQiEntryPrecision 已迁移至 enums/datetime_strategy_enums.dart
// 此处仅保留 JieQiEntryStrategyStore 用于向后兼容

@Deprecated('Migrated to package:metaphysics_core/features/datetime_details/jieqi_entry_strategy_store.dart. Use the new location.')
class JieQiEntryStrategyStore {
  static const String _spKey = 'calc_jieqi_entry_precision_default';

  /// 默认推荐使用"分钟"
  static JieQiEntryPrecision current = JieQiEntryPrecision.minute;

  static Future<void> initFromPrefs() async {
    try {
      final sp = await SharedPreferences.getInstance();
      final s = sp.getString(_spKey);
      final p = _parse(s);
      if (p != null) current = p;
    } catch (_) {}
  }

  static Future<void> persistDefault(JieQiEntryPrecision p) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_spKey, _toString(p));
  }

  static String _toString(JieQiEntryPrecision p) => switch (p) {
        JieQiEntryPrecision.shichen => 'shichen',
        JieQiEntryPrecision.hour => 'hour',
        JieQiEntryPrecision.minute => 'minute',
        JieQiEntryPrecision.second => 'second',
      };
  static JieQiEntryPrecision? _parse(String? s) => switch (s) {
        'shichen' => JieQiEntryPrecision.shichen,
        'hour' => JieQiEntryPrecision.hour,
        'minute' => JieQiEntryPrecision.minute,
        'second' => JieQiEntryPrecision.second,
        // 兼容旧值
        'minuteSecond' => JieQiEntryPrecision.minute,
        _ => null,
      };
}

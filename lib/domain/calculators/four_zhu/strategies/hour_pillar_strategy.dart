import 'package:metaphysics_core/enums.dart';

/// 决定时柱干支的策略
abstract class HourPillarStrategy {
  /// 基于时间与“生效日柱”决定时柱干支
  /// dayPillar 为根据日界线策略得到的当日/次日的“日柱”
  JiaZi decideHourPillar(DateTime dt, JiaZi dayPillar);
}

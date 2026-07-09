# 任务: r0-fix-public-api-and-datamodel
负责: antigravity ｜ 分支: agent/antigravity/r0-fix-public-api-and-datamodel ｜ 开工: 2026-07-08
状态: 进行中

## 目标

修复 xuan-metaphysics-core 公共 API 缺口与 sp_location_datamodel 损坏，让 xuan-bazi/lib/src/pages/bazi_home_page.dart 中需要的 `FourZhuEngine`、`EightCharsResult`、`ZiBoundary`、`ChildHourMode`、`CalculationStrategyConfigLogicModel`、枚举（`JieQiEntryPrecision.exactMinute`、`JieQiType.trueSolar`、`TimeAccuracy`、`Location`、`Address`、`Address.formattedAddress`）全部可被 `package:metaphysics_core/metaphysics_core.dart` 直接 import。

## 计划
- [ ] 1. 调研破损现状：读 `lib/metaphysics_core.dart`（总入口）、`lib/models/sp_location_datamodel.dart`（明确缺 `AppFeatureModule` 和 `../common_logger.dart` 的影响范围）
- [ ] 2. 修复/重写 `lib/models/sp_location_datamodel.dart`：要么移除损坏引用，要么创建 `common_logger.dart` 替代品；移除 `AppFeatureModule` 引用或迁移到允许位置
- [ ] 3. 补总入口 export（按调研报告）：`four_zhu_engine.dart`、`location.dart`、`calculation_strategy_config_logic_model.dart`、`datetime_strategy_enums.dart`；以及任何 bazi_home_page 直接 import 用到的类型
- [ ] 4. 若调研报告提到的 `JieQiEntryPrecision.exactMinute` / `JieQiType.trueSolar` / `TimeAccuracy` 当前不存在，需在 `enums/datetime_strategy_enums.dart` 增补
- [ ] 5. 若 `Address.formattedAddress` 当前不存在，给 `Address` 类补 getter（基于 province/city 拼接，与 d314be7 bazi 已有的 inline 写法对齐）
- [ ] 6. 单模块触发自检：`dart pub get && dart analyze` 零 error
- [ ] 7. 写入迁移说明到 `决定记录`：哪些 API 是新建、哪些是恢复、哪些是行为变更
- [ ] 8. `git add -A && git commit` 后等 Hermes 验收 → 不要自行 merge 到 main

## 验收标准
- [ ] 单模块 `dart analyze` 零 error（info/warning 不算 error，但要在决定记录里写入）
- [ ] `package:metaphysics_core/metaphysics_core.dart` 直接 export 以下类：FourZhuEngine, EightCharsResult, ZiBoundary, ChildHourMode, CalculationStrategyConfigLogicModel, Location, Address
- [ ] `JieQiEntryPrecision.exactMinute`、`JieQiType.trueSolar`、`TimeAccuracy` 三个常量/类型能在 import metaphysics_core 后被 dart compile-time 识别
- [ ] `Address.formattedAddress` getter 在 `lib/datamodel/location.dart` 或对应类中存在并可访问
- [ ] `lib/models/sp_location_datamodel.dart` 不再报缺 `AppFeatureModule` 或缺 `../common_logger.dart` 错误
- [ ] 不自行 merge 到 main，PR 等 Hermes/人类处理

验收命令:
```bash
cd ~/Git/Public/xuan-migration/xuan-metaphysics-core/.worktrees/antigravity-r0-fix-public-api-and-datamodel
dart pub get
dart analyze
```

## 当前状态
<由 antigravity 执行 Agent 维护>
- 起步：调研报告已收到，等 Antigravity 接手执行 /wjt-resume
- 预期第一步 (1)：先读 metaphysics_core.dart 与 sp_location_datamodel.dart 摸清现状

## 决定记录
- 2026-07-08: 选 Antigravity 修：它对 metaphysics_core 跨包边界有先前经验
- 2026-07-08: R0 不向 main 直接合并 — 风险由 Hermes 评估后再推进 R1/R2/R3

## 踩坑墓地
- 2026-07-08: 上一轮 Antigravity 失误：bazi phase-1 修复时砍掉了 UI/Provider 业务降级通过编译。这次严格保留所有顶层 API 行为，不允许做阉割式修复

## 冷冻快照
(空)

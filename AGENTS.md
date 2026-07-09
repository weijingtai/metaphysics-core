# AGENTS.md(项目规则模板 — 复制到项目根目录后按需填写)

## 项目概况
- 技术栈:
- 启动命令:
- 测试命令:

## Git 安全铁律(所有 AI Agent 无条件遵守, 优先级最高)
1. 只在当前 worktree 目录内工作。严禁 git checkout/switch 切换分支,
   严禁进入或修改其他 worktree 目录。
2. 严禁执行破坏性命令(任何理由都不行, 包括"清理环境"):
   git reset --hard / git checkout -- . / git clean -f(-fd/-fdx) /
   git push --force / git stash drop|clear / git branch -D / git rebase /
   删除 .git 目录。
3. 高频小提交: 每完成一个可运行的子任务立即 git add -A && git commit。
   未提交改动不应超过30分钟工作量。
4. 合并只由人类执行。Agent 不得向 main/master 做 merge/rebase/push。
   aiwt 权限边界: Agent 可执行 new/save/when/path/list(立项与查询);
   done/drop/freeze/adopt 仅在人类明确指示的当次可执行。
5. 会话结束或接近token上限前: 提交所有改动 + 按 /wjt-handoff 更新任务纪要。

## 任务纪要铁律
6. 开工先读 tasks/ 下当前分支的任务纪要, 重点: 踩坑墓地 -> 当前状态 ->
   计划。纪要不存在则按模板补建。
7. 每次失败的尝试必须写入「踩坑墓地」(只追加)。不入墓 = 逼后任重踩。
8. 不得修改「验收标准」区和「验收命令」行。认为验收标准不合理时,
   在「决定记录」提出异议并停下等人类裁决——严禁改考题来交卷。
9. 不得修改 TASKS.md 总览板(由 aiwt sync 维护)。

## Debug 协议
10. 遇到陌生报错, 先执行 aiwt when "<报错关键词>" 检索历史病历
    (代码史+全部纪要+快照), 再开始独立排查。

## 会话启动协议
每次会话开始: AGENTS.md(本文件) -> 任务纪要 -> git log/status,
然后从计划区下一个未完成项继续, 不重做已勾选任务。

## 编码规范
<只写当前仍然成立的硬性规则, ≤20行, 过时规则及时删除>
-

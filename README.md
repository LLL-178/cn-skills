# cn-skills · 中文生产力 Agent 技能包

> 让 Claude Code / Codex / Cursor / Gemini CLI 真正懂中文工作场景:
> 小红书爆款笔记、公众号文章、抖音口播稿、简历改写、周报、会议纪要 —— 一句话直出。

**English**: A curated pack of Chinese-workflow agent skills (Agent Skills / SKILL.md standard). Say "帮我写周报" or "改简历" in any compatible coding agent and get publication-ready output. Scroll to [Skills](#-技能列表) for the list.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Agent Skills](https://img.shields.io/badge/Standard-Agent%20Skills-blue)](https://agentskills.io)
[![Skills](https://img.shields.io/badge/skills-6-orange)](#-技能列表)

<!-- TODO: 录一张 30 秒 GIF 放这里,首屏决定 star 转化率
![demo](docs/demo.gif)
在 Claude Code 里输入一句话 → 直接输出一篇可发布的小红书笔记
-->

## 为什么做这个

2026 年,Agent Skills 生态里已经有上万个技能,但几乎全部面向英文场景。而中文工作里最高频的写作任务——**周报、小红书、公众号、简历、会议纪要**——没有一份认真打磨过的开源技能包。

这个仓库补上这块:每个技能都不是"提示词合集",而是沉淀了平台规则(小红书的流量池机制、公众号的广告法雷区、ATS 的关键词筛选)的可执行工作流,带真实示例和自检清单。

## 安装

**方式一:skills CLI(推荐,一条命令)**

```bash
npx skills add LLL-178/cn-skills
```

**方式二:脚本安装**

```bash
git clone https://github.com/LLL-178/cn-skills.git
cd cn-skills

# 跨工具通用路径(~/.agents/skills,Claude Code / Codex / Cursor / Gemini CLI 均识别)
./scripts/install.sh

# 或仅 Claude Code
./scripts/install.sh ~/.claude/skills
```

Windows(PowerShell):

```powershell
git clone https://github.com/LLL-178/cn-skills.git
cd cn-skills
.\scripts\install.ps1                    # 默认装到 ~/.agents/skills
.\scripts\install.ps1 -Target "$HOME\.claude\skills"
```

**方式三:手动复制** —— 把 `skills/` 下任意技能文件夹复制到 `~/.agents/skills/` 或 `~/.claude/skills/` 即可。

安装后重启 agent 会话即可生效,无需任何配置。

## 🧰 技能列表

| 技能 | 对 agent 直接说 | 产出 |
|------|----------------|------|
| [xiaohongshu-post](skills/xiaohongshu-post/SKILL.md) | "帮我写一篇推XX的小红书笔记" | 标题×3 + 封面文案 + 正文 + 标签 |
| [小红书图文与实况图·红鸦 AI](skills/redya-xiaohongshu/SKILL.md) | “用我的商品资料做图文，直接出图” | 标题、正文、配图或实况图。生成需要红鸦 Key 和积分。[用法与成稿](skills/redya-xiaohongshu/示例.md) |
| [wechat-article](skills/wechat-article/SKILL.md) | "帮我写篇公众号文章,主题是XX" | 标题×3 + 提纲 + 全文 + 合规检查 |
| [douyin-script](skills/douyin-script/SKILL.md) | "帮我写个30秒的抖音口播" | 分镜表 + 提词稿 + 时长标注 |
| [cn-resume](skills/cn-resume/SKILL.md) | "帮我改简历,我要投这个岗" + JD | 逐条改写对照 + 全文 + 面试预测题 |
| [weekly-report](skills/weekly-report/SKILL.md) | "把这周的流水账整理成周报" | 四段式周报(结果/风险/计划/支持) |
| [meeting-notes](skills/meeting-notes/SKILL.md) | 把转写稿丢进去说"整理成会议纪要" | 结论 + 决议 + 待办表(人/时间) |

**试一下**(安装后随便挑一条发给你手边的 agent):

- 帮我写一篇小红书笔记,推我上周买的蓝牙键盘
- 把这段转写整理成会议纪要(然后粘贴任何会议录音转写文本)
- 周一开评审会,周二周三改bug,周四方案被打回,帮我写周报

## 兼容性

遵循开放的 [Agent Skills 标准](https://agentskills.io)(`SKILL.md` + YAML frontmatter),不绑定任何一家:

| Agent | 状态 |
|-------|------|
| Claude Code | ✅ 完整支持 |
| Codex CLI | ✅ |
| Cursor | ✅ |
| Gemini CLI | ✅ |
| ZCode | ✅ |

技能内容 100% 中文,`name`/目录名为 kebab-case 英文,保证跨工具安装不出问题。

## 设计原则

1. **一个技能只解决一类任务**,触发描述覆盖该任务的所有中文说法(周报/日报/复盘/述职…),不需要用户记住技能名。
2. **示例优先于规则**:每个技能都带真实输入输出示例,规则只解释"为什么",不堆 MUST。
3. **可执行的领域知识**:写的是平台机制(流量池、广告法、ATS 筛选)和经过验证的写作公式,不是泛泛的"要吸引人"。
4. **输出即成品**:所有技能的产出格式都是"复制即可用",不需要二次整理。

## 路线图

- [ ] 述职报告 / 晋升答辩材料
- [ ] 直播话术与货品脚本
- [ ] B 站/小红书视频脚本(图文转视频)
- [ ] 英文版技能(面向海外中文用户)
- [ ] 官方 Demo GIF 与逐技能演示视频

## 贡献

欢迎 PR 提交新技能。收录标准:

1. `SKILL.md` 使用标准 frontmatter(`name` 与目录名一致,`description` 写清触发场景)
2. 至少一个**真实完整的输入输出示例**
3. 带自检清单
4. 领域知识具体可执行("20字以内+5个标题公式" ✅,"要吸引人" ❌)

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=LLL-178/cn-skills&type=Date)](https://star-history.com/#LLL-178/cn-skills&Date)

## License

[MIT](LICENSE)

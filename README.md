# Dark Citrussy

Blue Topaz 打底，压一层自用美化。装法：把 `themes/Dark Citrussy` 放进 `.obsidian/themes/`，外观里选它，原来的 CSS 片段全部关掉。

## 文件

| 文件 | 作用 |
| --- | --- |
| `themes/Dark Citrussy/theme.css` | 成品。1–31190 行是 Blue Topaz 原文，31191 行起是个人层 |
| `themes/Dark Citrussy/manifest.json` | 主题元数据，`name` 必须和文件夹同名 |
| `overrides.css` | 个人层的源文件，改这个，再重拼 |

## 改哪里

行号对应 1.0.0。重拼或 Blue Topaz 升级后会变，用段落横幅（`/* ==== Tweaks · ... ==== */`）grep 定位，别硬记数字。

| 段落 | theme.css | overrides.css | 管什么 |
| --- | --- | --- | --- |
| Tweaks | 31199–31251 | 10–62 | 斜体转正、转义符、标签胶囊、当前行底纹 |
| List | 31252–31336 | 63–147 | 六色圆点、勾选框尺寸、已完成任务 |
| Heading | 31337–31456 | 148–267 | 六级标题字号与配色 |
| IndentGuide | 31457–31497 | 268–308 | 缩进引导线 |
| Callout | 31498–31565 | 309–376 | 公式排版、整卡底色 |
| ListGap | 31566–31597 | 377–408 | 圆点/序号与文字的间距 |
| HideFolders | 31598–31616 | 409–427 | 隐藏 fonts、accessary |
| CodeBlock | 31617–31948 | 428–759 | Mac 标题栏、GitHub Dark 配色 |

常用旋钮：

| 想改什么 | theme.css | overrides.css | 改哪个值 |
| --- | --- | --- | --- |
| 斜体显示成正体 | 31206 | 17 | 整条 `em { font-style: normal }` 删掉即恢复斜体 |
| 标题字号 | 31343 | 154 | `--lb-h1-size: 2.13em` |
| 标题级差 | 31344 | 155 | `--lb-h-step`，每级递减量 |
| 笔记标题字号 | 31351 | 162 | `--lb-title-size` = H1 + 级差 |
| 六色色板 | 31261 | 72 | `--lb-1`…`--lb-6`、`--lb-ol` |
| 标签胶囊 | 31221 | 32 | `--tag-size` 等 `--tag-*` |
| 当前行底纹 | 31237 | 48 | `--activeline-background: transparent` |
| 缩进宽度 | 31465 | 276 | `--list-indent: 1.65em` |
| 引导线颜色 | 31469 | 280 | `rgba(214, 206, 250, …)` |
| 勾选框大小 | 31273 | 84 | `--checkbox-size` |
| 已完成任务变淡 | 31320 | 131 | `opacity` |
| 公式撑破卡片 | 31509 | 320 | `.cm-callout:has(.math)` 那组 overflow |
| 整卡底色浓度 | 31558 | 369 | `color-mix(in oklch, var(--callout-color) 10%, …)` 里的 10% |
| 圆点与文字间距 | 31573 | 384 | `--lg-pull` `--lg-bullet` `--lg-number` |
| 隐藏哪些文件夹 | 31605 | 416 | `[data-path="fonts"]` 改成自己的路径 |
| 代码块标题栏 | 31625 | 436 | `--mac-cb-*` 一组 |
| 代码 token 配色 | 31647 | 458 | `--vc-keyword` 等 20 个变量 |

## 改完怎么生效

1. 改 `overrides.css`（推荐）或直接改 theme.css 末尾那段
2. 重拼（cmd，二进制拼接，不乱编码）：

```cmd
copy /b "D:\Obsidian\.obsidian\themes\Blue Topaz\theme.css"+"D:\AgentProjects\美化主题_发布Citrussy\overrides.css" "D:\AgentProjects\美化主题_发布Citrussy\themes\Dark Citrussy\theme.css"
```

3. 覆盖到库里：`copy /b "…\themes\Dark Citrussy\theme.css" "D:\Obsidian\.obsidian\themes\Dark Citrussy\theme.css"`
4. Obsidian 里 Ctrl+P → `Reload app without saving`

只改 theme.css 不重拼也行，但 overrides.css 就落后了，下次重拼会把改动冲掉。

## 规矩

- **1–31190 行别动**。那是 Blue Topaz 本体，主题升级会整份替换。
- 个人层的 `!important` 是故意的：这些规则在跟 Blue Topaz 抢同一批属性，去掉就退回主题默认样式。
- 段落顺序不能调（Tweaks → List → … → CodeBlock）。body 上的 `--tag-size`、`--checkbox-size`、`--list-indent`、`--lg-*` 会互相覆盖，顺序变了结果就变。
- 主题名 `Dark Citrussy` 写在 manifest.json 和文件夹名两处，改一处就得改另一处。

## 已经删掉的死代码（别加回来）

- `.cm-cursor`：Obsidian 1.14 用原生光标，这个元素不存在了，光标由 cursor-jump 插件画
- `.token.sql-*`：依赖没装的 php-sql-highlight
- `var(--color-green)` 改成了 `var(--green, #7ee787)`：Blue Topaz 从来没定义过 `--color-green`，原规则一直是失效的

## 不归这个主题管

- 字体：local-fonts 插件把 fonts/ 里的 SF Mono 注册进四个角色
- 光标滑动动画：cursor-jump 插件的 styles.css + JS
- 缩放倍数：ctrl-scroll-zoom 插件的 settings
- 公式 DOM 修补：callout-math-fix 插件
- 导出图样式：screenshot-selection 插件

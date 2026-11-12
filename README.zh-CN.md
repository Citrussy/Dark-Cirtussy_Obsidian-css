# Dark Citrussy

[English](README.md)

Dark Citrussy 是我的自用 Obsidian 暗色主题，基于 [Blue Topaz](https://github.com/PKM-er/Blue-Topaz_Obsidian-css) 制作，并在此基础上做了若干调整。这些调整原先以八个 CSS 片段的形式存在，每台设备、每次切换主题后都需要重新启用；现已合并为一个完整主题，安装后即可直接使用。

![Dark Citrussy](screenshot.png)

## 修改内容

- 取消当前行底纹。
- 斜体改为正体，颜色取 H6 绿色；转义符保持正文颜色。
- 标签改为圆角胶囊样式。
- 无序列表圆点分六级、六级六色，层级越深圆点越小；有序列表序号使用同一套颜色。
- 任务复选框尺寸改为 16px，已完成任务降低透明度。
- 标题采用六级六色：H1 为 2.13em，每级递减 0.21em，笔记标题为 2.34em。
- 列表缩进改为 1.65em，并添加贯穿行间的紫色引导线。
- Callout 整卡叠加 10% 主色，引用块使用主题绿色。
- 块级公式超出宽度时在卡片内横向滚动，不再撑破卡片。
- 代码块增加 macOS 三圆点标题栏，语法配色采用 GitHub Dark。

## 安装

Dark Citrussy 已收录于[社区主题库](https://community.obsidian.md/themes/dark-citrussy)。在 Obsidian 中依次打开「设置 → 外观 → 管理主题 → 浏览」，搜索 **Dark Citrussy**，安装后启用。

手动安装：从 [Releases](https://github.com/Citrussy/Dark-Cirtussy_Obsidian-css/releases/latest) 下载 `theme.css` 与 `manifest.json`，放入 `.obsidian/themes/Dark Citrussy/` 目录。

最低要求 Obsidian 1.13。本主题仅适配暗色模式：配色按暗色方案设计，切换至浅色模式后部分样式不会跟随。

## 仓库结构

| 文件 | 说明 |
| --- | --- |
| `theme.css` | 拼接后的成品，约 31,900 行。前段为 Blue Topaz 原文，后段为个人调整。 |
| `overrides.css` | 个人调整的源文件，修改时以此为准。 |
| `manifest.json` | 主题元数据。 |
| `screenshot.png` | 上方截图。 |

修改 `overrides.css` 后需重新拼接：将其追加到 Blue Topaz 的 `theme.css` 末尾，再把结果复制到库中对应目录。

```cmd
copy /b "path\to\Blue Topaz\theme.css"+"overrides.css" theme.css
```

随后在命令面板执行 `Reload app without saving`。

## 维护说明

- `Tweaks` 之前的 Blue Topaz 原文仅修改两处：第 26,744 行打印样式中多余的引号改回单个；第 25,489 行的外链 Dribbble 动图背景改为 `none`。基座升级时该段整体替换。
- 段落顺序固定。`--tag-size`、`--checkbox-size`、`--list-indent`、`--lg-*` 等变量定义在 `body` 上，后出现的段落会覆盖先前的段落，调整顺序将改变最终样式。
- `!important` 用于覆盖 Blue Topaz 的同名属性，删除后对应样式会回退到基座默认值。
- 代码块底色 `#21252b`、标题六色与紫色引导线均为固定值，不随浅色模式变化。
- 文件浏览器中隐藏 `fonts` 与 `accessary` 两个文件夹，该规则仅匹配这两个名称，在其他库中不生效。
- 个人调整依赖 Blue Topaz 的 `--activeline-background`、`--list-indent`、`--callout-color` 变量，更换基座后这些调整将失效。

## 许可

本项目使用 MIT 许可证，见 [LICENSE](LICENSE)。基座 Blue Topaz 同为 MIT 许可，Copyright (c) 2020 WhyI & Pkmer。分发或摘录 `theme.css` 时需保留文件头部的许可声明。

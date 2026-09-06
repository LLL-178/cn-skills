#!/usr/bin/env bash
# cn-skills 安装脚本
# 用法:
#   ./scripts/install.sh                    安装全部技能到 ~/.agents/skills(跨工具通用)
#   ./scripts/install.sh ~/.claude/skills   安装到指定目录(如 Claude Code)
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/../skills"
TARGET="${1:-$HOME/.agents/skills}"

if [ ! -d "$SOURCE_DIR" ]; then
  echo "错误:未找到技能目录 $SOURCE_DIR,请在仓库根目录下运行。" >&2
  exit 1
fi

mkdir -p "$TARGET"

count=0
for skill_dir in "$SOURCE_DIR"/*/; do
  name="$(basename "$skill_dir")"
  if [ -f "$skill_dir/SKILL.md" ]; then
    rm -rf "$TARGET/$name"
    cp -r "$skill_dir" "$TARGET/$name"
    echo "已安装: $name -> $TARGET/$name"
    count=$((count + 1))
  fi
done

echo
echo "完成,共安装 $count 个技能。重启 agent 会话后生效。"

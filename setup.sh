#!/usr/bin/env bash
# filename: setup.sh

# 遇到错误立即退出
set -e

# 定义虚拟环境和依赖文件名称
VENV_NAME=".venv"
DEPS_FILE="requirements.txt"

echo "--- 开始项目环境设置 ---"

# 检查是否存在虚拟环境，如果不存在则创建
if [ ! -d "$VENV_NAME" ]; then
  echo "📦 正在创建虚拟环境 $VENV_NAME..."
  # 你可以在这里指定 Python 版本，例如: uv venv --python 3.11
  uv venv
else
  echo "✅ 虚拟环境 $VENV_NAME 已存在。"
fi

# 检查是否存在依赖文件，并安装依赖
if [ -f "$DEPS_FILE" ]; then
  echo "📥 正在从 $DEPS_FILE 安装依赖..."
  # 使用 uv pip 安装，速度快
  uv pip install -r "$DEPS_FILE"
else
  echo "⚠️  未找到依赖文件 $DEPS_FILE，跳过依赖安装。"
fi

echo "--- 🎉 环境设置完成！ ---"
echo ""
echo "📌 后续使用指南:"
echo "   - 运行脚本:   uv run python your_script.py"
echo "   - 进入交互:   uv run python"
echo "   - 安装新包:   uv add some-package"
echo "   - 无需手动激活虚拟环境！"


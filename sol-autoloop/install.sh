#!/bin/bash

# Sol AutoLoop Skill Installer
# Usage: bash install.sh --project (current dir) or bash install.sh --global (all projects)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "\033[0;36m╔═══════════════════════════════════════════════╗\033[0m"
echo -e "\033[0;36m║       SOL AUTOLOOP SKILL INSTALLER            ║\033[0m"
echo -e "\033[0;36m║   Autonomous Improvement Loop (Karpathy)      ║\033[0m"
echo -e "\033[0;36m╚═══════════════════════════════════════════════╝\033[0m"

SCOPE="project"
INSTALL_PATH=".claude"

if [[ "$1" == "--global" ]]; then
    SCOPE="global"
    INSTALL_PATH="$HOME/.claude"
elif [[ "$1" == "--project" ]]; then
    SCOPE="project"
    INSTALL_PATH=".claude"
elif [[ -n "$1" ]]; then
    echo "Usage: bash install.sh [--project|--global]"
    exit 1
fi

echo -e "\033[0;34mInstall scope: $SCOPE\033[0m"
echo -e "\033[0;34mInstall path:  $INSTALL_PATH\033[0m"
echo ""

mkdir -p "$INSTALL_PATH/commands"
mkdir -p "$INSTALL_PATH/agents"

echo -e "\033[1;33mInstalling commands...\033[0m"
for file in "$SCRIPT_DIR/.claude/commands"/sol-autoloop*.md; do
    fname=$(basename "$file")
    cp "$file" "$INSTALL_PATH/commands/$fname"
    echo -e "  \033[0;32m+\033[0m commands/$fname"
done

echo -e "\033[1;33mInstalling agents...\033[0m"
for file in "$SCRIPT_DIR/.claude/agents"/sol-*.md; do
    fname=$(basename "$file")
    cp "$file" "$INSTALL_PATH/agents/$fname"
    echo -e "  \033[0;32m+\033[0m agents/$fname"
done

CMD_COUNT=$(ls "$INSTALL_PATH/commands"/sol-autoloop*.md 2>/dev/null | wc -l)
AGENT_COUNT=$(ls "$INSTALL_PATH/agents"/sol-*.md 2>/dev/null | wc -l)

echo ""
echo -e "\033[0;32mInstallation complete!\033[0m"
echo ""
echo "  Commands installed: \033[0;36m$CMD_COUNT\033[0m"
echo "  Agents installed:   \033[0;36m$AGENT_COUNT\033[0m"
echo ""
echo -e "\033[0;36mAvailable commands:\033[0m"
echo ""
echo '  /project:sol-autoloop "skill:solithink"         — Improve a skill autonomously'
echo '  /project:sol-autoloop "skill:bmad-ralph iterations:10"  — 10 improvement iterations'
echo '  /project:sol-autoloop-score "skill:solithink"    — Score without modifying'
echo '  /project:sol-autoloop-status                     — Show loop progress'
echo ""
echo -e "\033[1;33mThe loop:\033[0m"
echo '  Analyze → Change ONE thing → Score → Keep or Revert → Repeat'
echo '  Git commits every experiment. Reverts preserve history.'
echo '  You sleep, your skills get better.'

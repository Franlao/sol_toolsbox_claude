#!/bin/bash

# soliThink Skill Installer
# Usage: bash install.sh --project (current dir) or bash install.sh --global (all projects)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "\033[0;36m╔═══════════════════════════════════════════════╗\033[0m"
echo -e "\033[0;36m║         soliThink SKILL INSTALLER             ║\033[0m"
echo -e "\033[0;36m║   Multi-Expert Thinking + Plan Generation     ║\033[0m"
echo -e "\033[0;36m╚═══════════════════════════════════════════════╝\033[0m"

# Parse arguments
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

# Create directories
echo -e "\033[1;33mCreating directories...\033[0m"
mkdir -p "$INSTALL_PATH/commands"
mkdir -p "$INSTALL_PATH/agents"

# Install commands
echo -e "\033[1;33mInstalling commands...\033[0m"
for file in "$SCRIPT_DIR/.claude/commands"/st*.md "$SCRIPT_DIR/.claude/commands"/sol-update.md; do
    [ -f "$file" ] || continue
    fname=$(basename "$file")
    cp "$file" "$INSTALL_PATH/commands/$fname"
    echo -e "  \033[0;32m+\033[0m commands/$fname"
done

# Install agents
echo -e "\033[1;33mInstalling agents...\033[0m"
for file in "$SCRIPT_DIR/.claude/agents"/st*.md; do
    fname=$(basename "$file")
    cp "$file" "$INSTALL_PATH/agents/$fname"
    echo -e "  \033[0;32m+\033[0m agents/$fname"
done

# Count installed files
CMD_COUNT=$(ls "$INSTALL_PATH/commands"/st*.md 2>/dev/null | wc -l)
AGENT_COUNT=$(ls "$INSTALL_PATH/agents"/st*.md 2>/dev/null | wc -l)

echo ""
echo -e "\033[0;32mInstallation complete!\033[0m"
echo ""
echo "  Commands installed: \033[0;36m$CMD_COUNT\033[0m"
echo "  Agents installed:   \033[0;36m$AGENT_COUNT\033[0m"
echo ""
echo -e "\033[0;36mAvailable commands:\033[0m"
echo ""
echo -e "  \033[1;33mMain workflow:\033[0m"
echo '  /project:st "your idea"        — Start thinking about an idea'
echo "  /project:st-think               — Launch expert panel analysis"
echo "  /project:st-debate              — Resolve contradictions between experts"
echo "  /project:st-plan                — Generate final actionable plan"
echo ""
echo -e "  \033[1;33mUtilities:\033[0m"
echo "  /project:st-expert <name>       — Deep-dive with a specific expert"
echo "  /project:st-to-bmad             — Export plan to BMAD-Ralph project"
echo ""
echo -e "  \033[1;33mExperts available:\033[0m"
echo "  product, architect, frontend, backend, devops, security, qa, ai"
echo ""
echo -e "\033[1;33mQuick start:\033[0m"
echo '  1. cd your-project/'
echo '  2. claude'
echo '  3. /project:st "Build a SaaS for drone fleet monitoring with real-time alerts"'
echo '  4. Wait for experts to analyze, debate, and produce a plan'
echo '  5. /project:st-to-bmad   (optional: convert to BMAD-Ralph and start building)'

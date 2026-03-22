---
name: sol-update
description: "Update Sol Toolsbox — pull latest and re-install all skills"
---

# Sol Toolsbox Updater

Update all Sol skills to the latest version from GitHub.

## Arguments

- `$ARGUMENTS` empty → update and re-install all skills
- `$ARGUMENTS` = `check` → only check if updates are available
- `$ARGUMENTS` = `changelog` → show what changed since last update
- `$ARGUMENTS` = `autoloop` → update only sol-autoloop
- `$ARGUMENTS` = `solithink` → update only soliThink
- `$ARGUMENTS` = `bmad` → update only BMAD-Ralph

## Locate Toolbox Repository

Check in order:
1. `~/sol_toolsbox_claude/` (default clone location)
2. `~/PycharmProjects/sol_toolsbox_claude/`
3. If not found, ask the user: "Where is your sol_toolsbox_claude repo?"

## Check for Updates

```bash
cd <toolbox_path>
git fetch origin master
git log HEAD..origin/master --oneline
```

If no new commits:
```
Sol Toolsbox is up to date.
Current version: <hash> (<date>)
```

If new commits exist, show them and proceed to update.

## Update

1. Pull latest:
   ```bash
   cd <toolbox_path> && git pull origin master
   ```

2. Detect which skills are installed in the current project:
   - `.claude/commands/sol-autoloop.md` exists → sol-autoloop installed
   - `.claude/commands/st.md` exists → soliThink installed
   - `.claude/commands/br.md` exists → BMAD-Ralph installed

3. Re-install only the skills that are already installed (unless a specific skill was requested):

   ```bash
   # Only if sol-autoloop was installed
   bash <toolbox_path>/sol-autoloop/install.sh --project

   # Only if soliThink was installed
   bash <toolbox_path>/solithink/install.sh --project

   # Only if BMAD-Ralph was installed
   bash <toolbox_path>/bmad-ralph/install.sh --project
   ```

4. Show summary:
   ```
   SOL TOOLSBOX UPDATED
   ═══════════════════════════════════════════

     Updated: <old hash> → <new hash>

     Skills refreshed:
       + sol-autoloop  (3 commands, 2 agents)
       + solithink     (6 commands, 8 agents)
       + bmad-ralph    (22 commands, 2 agents)

     Your project data (.solithink/, .bmad-ralph/, .autoloop/) is untouched.
   ```

## Show Changelog

When `$ARGUMENTS` = `changelog`:

```bash
cd <toolbox_path> && git log --oneline -20
```

Display formatted with dates and descriptions.

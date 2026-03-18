# Sol Toolsbox Claude

Collection de skills, agents et outils pour Claude Code.

Chaque dossier est un skill independant avec son propre installeur.

---

## Skills disponibles

| Skill | Description | Commandes |
|-------|------------|-----------|
| [bmad-ralph](./bmad-ralph/) | Build entire projects A-Z — planification structuree + execution autonome | `/project:br-*` |
| [solithink](./solithink/) | Multi-expert thinking — 8 experts analysent, debattent, planifient | `/project:st-*` |

## Installation

### Un skill specifique

```bash
git clone https://github.com/Franlao/sol_toolsbox_claude.git ~/sol_toolsbox_claude

# Installer soliThink dans ton projet
cd ton-projet/
bash ~/sol_toolsbox_claude/solithink/install.sh --project

# Installer BMAD-Ralph dans ton projet
bash ~/sol_toolsbox_claude/bmad-ralph/install.sh --project

# Ou les deux
bash ~/sol_toolsbox_claude/solithink/install.sh --project && bash ~/sol_toolsbox_claude/bmad-ralph/install.sh --project
```

### Installation globale (tous les projets)

```bash
bash ~/sol_toolsbox_claude/solithink/install.sh --global
bash ~/sol_toolsbox_claude/bmad-ralph/install.sh --global
```

## Workflow recommande

```
soliThink pense → BMAD-Ralph construit

/project:st "Mon idee"       → Plan expert-driven (8 experts)
/project:st-to-bmad          → Conversion automatique
/project:br-architect         → Architecture detaillee
/project:br-build auto        → Construction autonome
```

## Ajouter un nouveau skill

Chaque skill suit la meme structure :

```
nom-du-skill/
  .claude/
    commands/     ← Slash commands
    agents/       ← Agents specialises
    hooks/        ← Hooks optionnels
  install.sh      ← Installeur
  README.md       ← Documentation
```

# Sol AutoLoop

**Boucle d'amelioration autonome — inspire de Karpathy's autoresearch.**

Tu definis une cible (skill, code, prompts), l'agent tourne en boucle : analyse, fait UN changement, score, garde ou revert, recommence. Tu dors, tes skills s'ameliorent.

---

## Comment ca marche

```
LOOP:
  1. Lire les fichiers + historique des essais
  2. Identifier le point le plus faible (scoring rubric)
  3. Faire UN changement atomique
  4. Git commit
  5. Scorer mecaniquement (rubric 0-100)
  6. Score monte → KEEP. Score baisse → REVERT.
  7. Logger le resultat
  8. Recommencer
```

Chaque experience est committee. Les reverts preservent l'historique.
Git est la memoire.

## La rubric de scoring (skills/prompts)

| Critere | Points |
|---------|--------|
| Context Gathering | /10 |
| Self-Critique | /10 |
| Error Reasoning | /10 |
| No Assumptions | /10 |
| Minimal Scope | /10 |
| Autonomous Execution Clarity | /10 |
| Verification | /10 |
| Parallelism | /10 |
| Observability | /10 |
| User Intent Fidelity | /10 |
| **Total** | **/100** |

Rubric construite a partir des patterns de Devin, Manus, Windsurf, Lovable et Cursor.

## Installation

```bash
cd ton-projet/
bash ~/sol_toolsbox_claude/sol-autoloop/install.sh --project
```

## Utilisation

```bash
# Ameliorer un skill automatiquement
/project:sol-autoloop "skill:solithink"

# Limiter a 10 iterations
/project:sol-autoloop "skill:bmad-ralph iterations:10"

# Juste scorer sans modifier
/project:sol-autoloop-score "skill:bmad-ralph"

# Voir le progres
/project:sol-autoloop-status
```

## Modes de scoring

| Mode | Metrique | Usage |
|------|---------|-------|
| Skill Quality Rubric | Score /100 | Skills et prompts |
| Test Coverage | % couverture | Code avec tests |
| Lint Errors | 100 - erreurs | Code avec linter |
| Custom | Commande user | N'importe quoi de mesurable |

## Combo avec soliThink + BMAD-Ralph

```
soliThink pense → BMAD-Ralph construit → AutoLoop ameliore

/project:st "Mon idee"                      → Plan expert
/project:st-to-bmad                         → Export vers BMAD
/project:br-build auto                      → Construction
/project:sol-autoloop "skill:bmad-ralph"    → Amelioration continue
```

# soliThink

**Give an idea, get an expert-driven plan.**

soliThink est un skill pour Claude Code qui orchestre un panel de 8 experts specialises. Chaque expert maitrise son domaine (enrichi par roadmap.sh), analyse ton idee depuis son angle, puis ils debattent entre eux pour produire un plan solide, teste par la confrontation.

---

## Comment ca marche

```
Ton idee
   |
   v
THINK ──── 8 experts analysent en parallele
   |          Product, Architect, Frontend, Backend,
   |          DevOps, Security, QA, AI
   v
DEBATE ─── Les experts confrontent leurs analyses
   |          Contradictions resolues
   |          Compromis identifies
   v
PLAN ───── Livrable final actionnable
   |          Vision, stack, architecture, roadmap,
   |          risques, estimations
   v
(optionnel) EXPORT → BMAD-Ralph pour builder
```

## Installation

```bash
git clone https://github.com/Franlao/solithink-skill.git ~/solithink-skill
cd ton-projet/
bash ~/solithink-skill/install.sh --project
```

Ou global (tous les projets) :

```bash
bash ~/solithink-skill/install.sh --global
```

## Utilisation

```bash
# Lancer soliThink avec une idee
/project:st "Application de gestion de flotte de drones avec alertes temps reel"

# Le panel d'experts analyse, debat, et produit un plan

# Deep-dive sur un domaine specifique
/project:st-expert security

# Exporter vers BMAD-Ralph pour construire
/project:st-to-bmad
```

## Les 8 experts

| Expert | Domaine | Ce qu'il analyse |
|--------|---------|-----------------|
| Product Thinker | Produit/marche | Users, MVP scope, features, metriques |
| Software Architect | Architecture | Stack, patterns, data model, scalabilite |
| Frontend Expert | UI/UX | Framework, composants, performance, accessibilite |
| Backend Expert | API/serveur | Endpoints, auth, base de donnees, integrations |
| DevOps Expert | Infrastructure | Deploiement, CI/CD, monitoring, couts |
| Security Expert | Securite | OWASP, auth, protection donnees, compliance |
| QA Expert | Qualite | Strategie tests, coverage, edge cases |
| AI Expert | Intelligence artificielle | LLM, RAG, couts IA, pertinence |

## Combo avec BMAD-Ralph

soliThink pense. BMAD-Ralph construit.

```
/project:st "Mon idee"           → Plan expert-driven
/project:st-to-bmad              → Conversion automatique
/project:br-architect            → Architecture detaillee
/project:br-sprint               → Stories pour Ralph
/project:br-build auto           → Construction autonome
```

soliThink remplace les phases DISCOVER et PLAN de BMAD-Ralph avec une analyse superieure (8 experts vs 4 agents generiques).

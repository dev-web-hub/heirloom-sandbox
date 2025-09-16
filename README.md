# Heirloom Sandbox

A modular, AI-assisted system for building, automating, and scaling projects.  
The system is organized into **capsules** — each a self-contained workflow unit (e.g., `MOTHER`, `SCRIPT`, `ADS`).  

---

## 📦 Capsule Anatomy

Each capsule has:
- **Heirloom Seed** → machine-facing seed prompt (cryptographic-style).
- **Runway Prompt** → human-facing natural language scaffold.
- **State Folder** → external “brain” storage for persistence.

Capsules are orchestrated by **Mother** (the planner/orchestrator) and her clones.

---

## 📂 Directory Structure
heirloom-sandbox/
├── capsules/           # working capsules
│   ├── MOTHER/
│   ├── MOTHER_CLONE/
│   ├── SOCIALS/
│   ├── ADS/
│   ├── SCRIPT/
│   ├── ANALYTICS/
│   ├── AUTOM8/
│   ├── BOOK/
│   ├── COMMUNITY/
│   ├── COURSE/
│   ├── MENTOR/
│   └── PIPELINE/
├── heirloom-seeds/     # encrypted/structured seed prompts
│   └── {CAPSULE}-seed.txt
├── runways/            # natural-language scaffolds
│   └── {CAPSULE}-runway.md
├── .env                # contains API keys (ignored by git)
├── .gitignore          # ignores .env + build artifacts
└── README.md           # this file
---

## ✅ Completed Setup

1. **Repo Bootstrapping**
   - Git repo initialized and linked to GitHub.
   - `.gitignore` configured to exclude `.env` and build outputs.

2. **Environment Prep**
   - Conda/Python environment bootstrapped.
   - Base folders created: `capsules/`, `heirloom-seeds/`, `runways/`.

3. **Capsule Stubs**
   - Directories + empty seeds/runways created for:  
     `MOTHER, MOTHER_CLONE, SOCIALS, ADS, SCRIPT, ANALYTICS, AUTOM8, BOOK, COMMUNITY, COURSE, MENTOR, PIPELINE`.

4. **API Keys**
   - 12 OpenAI API keys generated (1 per capsule).
   - Stored in `.env` as:
     ```
     OPENAI_API_KEY_MOTHER=
     OPENAI_API_KEY_MOTHER_CLONE=
     ...
     OPENAI_API_KEY_PIPELINE=
     ```
   - Verified connectivity with curl requests.

5. **Newsletter Capsule (SCRIPT)**
   - Issues scaffolded (`issue-1.md` → `issue-4.md`) with near-finished content.
   - Manifesto anchored into `manifesto.md`.
   - Backlog system for blurbs/tools set up.
   - Publishing stub via Postmark API added.

---
## Daily Commands

When working in this repo, these are the key commands to stay consistent:

- **Check repo health**  
  ./verify.sh

- **Sync with GitHub**  
  git add .  
  git commit -m "update"  
  git push origin main  

- **Refresh seed labels (adds human-readable titles at top of seed files)**  
  ./label_seeds.sh

- **Test API keys**  
  ./test_keys.sh

## 🔍 Verification Commands

- Check seeds/runways exist:
  ```bash
  tree -L 2 heirloom-sandbox

	•	Check .env contains 12 keys:
grep OPENAI_API_KEY_ .env

	•	Test API key connectivity:
export $(grep OPENAI_API_KEY_SCRIPT .env)
curl https://api.openai.com/v1/models \
  -H "Authorization: Bearer $OPENAI_API_KEY_SCRIPT"

🧭 Next Steps
	•	Generate ScriptCat Issues 5–12 (3 months runway).
	•	Wire up Analytics capsule for open/click tracking.
	•	Expand Ads capsule to 24 creatives with tracking hooks.
	•	Autom8 capsule: add GitHub Actions CI/CD pipeline.
	•	Community capsule: audience growth + segmentation.
	•	Mother Clone orchestration upgrades.

⚠️ Notes
	•	.env is critical → never commit it to GitHub.
	•	Iteration is incremental: 12 steps per cycle.
	•	README.md will be updated at the end of each cycle to stay in sync.

---

👉 Do you want me to also generate a `verify.sh` script (so you can just run `./verify.sh` and it automatically checks the tree, `.env`, and API connections in one go)? That way you don’t have to type commands one by one.

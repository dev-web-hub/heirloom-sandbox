git add runways/SOCIALS-runway.md
git commit -m "chore: add command-mode rules to SOCIALS runway"
git pushgit add runways/SOCIALS-runway.md
git commit -m "chore: add command-mode rules to SOCIALS runway"
git push# SOCIALS Runway v1.0

## Goal
Spin up MVP lead-gen pipeline by automating posting to 3 platforms:
1. Telegram (via @BotFather + token)
2. Discord (via webhook)
3. Nostr (via local keypair)

## Inputs
- `sidebiz/socials/prospects.csv`: holds lead emails + handles
- `.env/telegram.env`, `.env/discord.env`, `.env/nostr.env`: credentials

## Outputs
- `sidebiz/socials/posts.log`: logs each post (timestamp, platform, status)
- console echo: `SOCIALS — ready`

## Rituals
- verify.sh confirms adapters + .env keys exist
- posts logged per platform with ✅/❌ status
- proof: tail -n 5 posts.log shows latest output

## Modes
- **/build-mvp** → output full 44-pack scaffold (batched, safe, fast)  
- **/nat** → switch to natural language for explanations / flowcharts  
- Default mode = **command mode** (fast, batched outputs)  

## Expansion Path
- bump seedv to 1.1 for Bluesky + Mastodon
- later: extend to Reddit, Zulip, Matrix


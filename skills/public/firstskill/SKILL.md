---
name: firstskill
description: "Learn and practice using Codex Skills end-to-end: initialize, edit, validate, package, and install. Use when demoing skill workflow or when the user mentions firstskill or $firstskill."
---

# Firstskill

## Overview

Demonstrate the skill lifecycle with minimal, practical artifacts. Use the Quick Start to validate and package; run the demo script to confirm resources execute correctly.

## Quick Start

- Validate: `python3 ~/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/public/firstskill`
- Run demo: `python3 skills/public/firstskill/scripts/demo_echo.py "hello skills"`
- Package: `python3 ~/.codex/skills/.system/skill-creator/scripts/package_skill.py skills/public/firstskill ./dist`
- Install locally: `mkdir -p ~/.codex/skills && cp -r skills/public/firstskill ~/.codex/skills/firstskill` and then restart Codex to pick up new skills.

See `skills/public/firstskill/references/quickstart.md` for concise command examples.

## Contents

- `scripts/demo_echo.py`: Minimal script echoing input to verify executable resources.
- `references/quickstart.md`: Copy-paste ready commands for validation and packaging.
- `assets/` (optional): Empty by default; add templates/icons if needed.

## Notes

- Keep the description precise; triggers rely on name/description.
- Prefer minimal resources; only add files that directly support learning the workflow.

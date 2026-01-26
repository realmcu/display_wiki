# Firstskill Quickstart

Validate

```
python3 ~/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/public/firstskill
```

Run demo script

```
python3 skills/public/firstskill/scripts/demo_echo.py "hello skills"
```

Package

```
python3 ~/.codex/skills/.system/skill-creator/scripts/package_skill.py skills/public/firstskill ./dist
```

Install locally

```
mkdir -p ~/.codex/skills
cp -r skills/public/firstskill ~/.codex/skills/firstskill
```

Restart Codex to pick up new skills.

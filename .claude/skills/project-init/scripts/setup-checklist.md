#!/bin/bash
# Usage: bash setup-checklist.sh
# Checks which template items still need customization.

echo "=== Project Setup Checklist ==="
echo ""

# Check CLAUDE.md TODOs
if grep -q "TODO" CLAUDE.md 2>/dev/null; then
  echo "❌ CLAUDE.md still has TODO items — needs customization"
  grep -n "TODO" CLAUDE.md | sed 's/^/   /'
else
  echo "✅ CLAUDE.md configured"
fi
echo ""

# Check Commands section
if grep -q "fill in after project init" CLAUDE.md 2>/dev/null; then
  echo "❌ CLAUDE.md Commands section is still placeholder"
else
  echo "✅ Commands section filled in"
fi
echo ""

# Check which rules exist
echo "--- Active Rules ---"
for f in .claude/rules/*.md; do
  [ -f "$f" ] && echo "  📄 $(basename "$f")"
done
echo ""

# Check .env
if [ -f ".env.example" ]; then
  echo "✅ .env.example exists"
else
  echo "❌ .env.example missing — create it"
fi

if [ -f ".env" ]; then
  echo "✅ .env exists"
else
  echo "⚠️  .env missing — copy from .env.example"
fi
echo ""

# Check .gitignore
if [ -f ".gitignore" ]; then
  for pattern in ".env" ".env.local" "node_modules"; do
    if grep -q "$pattern" .gitignore 2>/dev/null; then
      echo "✅ .gitignore includes $pattern"
    else
      echo "❌ .gitignore missing $pattern"
    fi
  done
else
  echo "❌ .gitignore missing"
fi

echo ""
echo "=== Done ==="

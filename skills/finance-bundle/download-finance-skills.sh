#!/usr/bin/env bash
# Downloads 5 finance-oriented Claude.ai skills and packages each as a .zip
# ready to upload at: Claude.ai -> Settings -> Capabilities -> Skills -> Upload skill
#
# Usage:  bash download-finance-skills.sh
# Output: ./out/<skill-name>.zip (5 files)

set -euo pipefail

OUT_DIR="${OUT_DIR:-$(pwd)/out}"
WORK_DIR="$(mktemp -d)"
trap 'rm -rf "$WORK_DIR"' EXIT

mkdir -p "$OUT_DIR"
cd "$WORK_DIR"

echo "==> Cloning source repos..."
git clone --depth=1 -q https://github.com/anthropics/skills.git anthropics
git clone --depth=1 -q https://github.com/coffeefuelbump/csv-data-summarizer-claude-skill.git csv
git clone --depth=1 -q https://github.com/ComposioHQ/awesome-claude-skills.git composio

zip_skill() {
  local name="$1" src="$2"
  echo "==> Packaging $name"
  local stage="$WORK_DIR/stage/$name"
  mkdir -p "$stage"
  cp -R "$src"/. "$stage"/
  # Drop git metadata if any
  rm -rf "$stage/.git" "$stage/.gitignore"
  (cd "$WORK_DIR/stage" && zip -qr "$OUT_DIR/$name.zip" "$name")
}

zip_skill xlsx                  anthropics/skills/xlsx
zip_skill pdf                   anthropics/skills/pdf
zip_skill docx                  anthropics/skills/docx
zip_skill csv-data-summarizer   csv
zip_skill invoice-organizer     composio/invoice-organizer

echo
echo "Done. 5 zips in: $OUT_DIR"
ls -1 "$OUT_DIR"
echo
echo "Next: upload each .zip at Claude.ai -> Settings -> Capabilities -> Skills -> Upload skill"

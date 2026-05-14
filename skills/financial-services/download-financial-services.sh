#!/usr/bin/env bash
# Bundles all unique Claude skills from anthropics/financial-services as
# individual .zip files ready to upload to Claude.ai
# (Settings -> Capabilities -> Skills -> Upload skill).
#
# Output: ./out/<skill-name>.zip  (66 zips)
#
# NOTE: Claude.ai has a per-account limit on active custom skills
# (typically 8-10). Start with the "top 8 for finance" listed in README.md
# of this folder and add/swap others later.

set -euo pipefail

OUT_DIR="${OUT_DIR:-$(pwd)/out}"
WORK_DIR="$(mktemp -d)"
trap 'rm -rf "$WORK_DIR"' EXIT

mkdir -p "$OUT_DIR"
cd "$WORK_DIR"

echo "==> Cloning anthropics/financial-services..."
git clone --depth=1 -q https://github.com/anthropics/financial-services.git src

cd src

declare -A SEEN
count=0

while IFS= read -r skill_md; do
  skill_dir="$(dirname "$skill_md")"
  name="$(basename "$skill_dir")"

  if [[ -n "${SEEN[$name]:-}" ]]; then
    continue
  fi
  SEEN[$name]=1

  stage="$WORK_DIR/stage/$name"
  mkdir -p "$stage"
  cp -R "$skill_dir"/. "$stage"/
  rm -rf "$stage/.git"
  (cd "$WORK_DIR/stage" && zip -qr "$OUT_DIR/$name.zip" "$name")
  count=$((count + 1))
  printf '  [%2d] %s\n' "$count" "$name"
done < <(find plugins -name SKILL.md | sort)

echo
echo "Done. $count zips in: $OUT_DIR"
echo
echo "Recommended top 8 to upload first:"
echo "  xlsx-author, pptx-author, dcf-model, comps-analysis,"
echo "  3-statement-model, audit-xls, morning-note, ic-memo"

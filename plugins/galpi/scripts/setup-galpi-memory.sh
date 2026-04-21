#!/usr/bin/env bash
# setup-galpi-memory.sh — 친구용 galpi-memory 리포 초기 세팅
#
# 사용:
#   bash setup-galpi-memory.sh <내-github-id>
#
# 동작:
#   1. gh CLI로 {github-id}/galpi-memory private 리포 생성 (이미 있으면 skip)
#   2. ~/.claude/galpi-memory/ 에 clone
#   3. 시드 템플릿(빈 4개 파일) 복사
#   4. 초기 커밋 + push

set -e

GITHUB_ID="${1:-}"
if [ -z "$GITHUB_ID" ]; then
    echo "사용법: bash setup-galpi-memory.sh <내-github-id>"
    echo "예:    bash setup-galpi-memory.sh KimMoonGi"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATE_DIR="$PLUGIN_ROOT/memory-template"
TARGET_DIR="$HOME/.claude/galpi-memory"
REPO="${GITHUB_ID}/galpi-memory"

if [ ! -d "$TEMPLATE_DIR" ]; then
    echo "[ERROR] 시드 템플릿을 찾을 수 없습니다: $TEMPLATE_DIR"
    exit 1
fi

if ! command -v gh &>/dev/null; then
    echo "[ERROR] gh CLI가 설치되지 않았습니다. https://cli.github.com"
    exit 1
fi

if ! gh auth status &>/dev/null; then
    echo "[ERROR] gh CLI 인증 필요: gh auth login"
    exit 1
fi

if [ -d "$TARGET_DIR" ]; then
    echo "[INFO] 이미 존재: $TARGET_DIR"
    echo "       삭제 후 재시도하거나, 수동 확인 요망."
    exit 1
fi

echo "── 1. GitHub 리포 확인/생성: $REPO"
if gh repo view "$REPO" &>/dev/null; then
    echo "     이미 존재 — clone만 수행합니다."
else
    gh repo create "$REPO" --private --description "갈피 축적 데이터 (개인용 — 공개 금지)"
fi

echo "── 2. Clone: $TARGET_DIR"
git clone "https://github.com/$REPO.git" "$TARGET_DIR"

echo "── 3. 시드 템플릿 복사"
cp "$TEMPLATE_DIR"/_galpi_*.md "$TARGET_DIR/"
cat > "$TARGET_DIR/.gitignore" <<EOF
.DS_Store
Thumbs.db
EOF
cat > "$TARGET_DIR/README.md" <<EOF
# galpi-memory (개인)

갈피 플러그인(KimMoonGi/galpi)의 축적 데이터 저장소.
- 세션 회고·캘리브레이션·측정 로그·프로젝트별 회고가 여기에 쌓인다.
- 갈피 P3.5 완료 시 자동 commit+push.
- \`/plugin update\`에 영향받지 않는 별도 리포.

**절대 public으로 전환하지 말 것** — 개인 상담 기록이 포함됩니다.
EOF

echo "── 4. 초기 커밋 + push"
cd "$TARGET_DIR"
git add -A
git commit -m "초기 시드 — 갈피 memory 세팅"
git branch -M main
git push -u origin main

echo ""
echo "✅ 완료. Claude Code에서 이어서 실행하세요:"
echo "   /plugin marketplace add KimMoonGi/galpi"
echo "   /plugin install galpi@galpi-marketplace"

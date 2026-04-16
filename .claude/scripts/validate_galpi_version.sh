#!/bin/bash
# 갈피 버전업 후 일관성 검증 스크립트 v2 (범용 패키지)
# 사용: bash .claude/scripts/validate_galpi_version.sh
# FAIL 발견 시 구체적 수정 지시 출력.

# --- 경로 자동 탐지 ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE="$(cd "$SCRIPT_DIR/.." && pwd)"

ERRORS=0
WARNINGS=0

# 코어 프롬프트에서 버전 추출
CORE_FILE="$BASE/commands/galpi.md"
if [ ! -f "$CORE_FILE" ]; then
    echo "[ERROR] 코어 프롬프트를 찾을 수 없습니다: $CORE_FILE"
    exit 1
fi

CORE_VERSION=$(head -10 "$CORE_FILE" | grep -oP 'v\d+\.\d+' | head -1)
if [ -z "$CORE_VERSION" ]; then
    echo "[ERROR] 코어 프롬프트에서 버전을 추출할 수 없습니다"
    exit 1
fi

echo "=== 갈피 $CORE_VERSION 일관성 검증 ==="
echo ""

# --- PART 1: 존재 검증 (필수 파일에 현재 버전이 있는가) ---
echo "── 1. 파일별 버전 존재 ──"

FILES=(
    "commands/galpi.md|코어 프롬프트"
    "galpi_data/_galpi_state.md|상태 파일"
)

# 선택적 파일 (있으면 검증, 없으면 건너뜀)
OPTIONAL_FILES=(
    "etc/_galpi_patch_notes.md|패치노트"
    "etc/_galpi_evolution.md|진화 기록"
    "etc/_galpi_benchmark_report.md|벤치마크"
    "etc/_galpi_journal_fictional.md|저널(창작)"
    "galpi_data/_galpi_retrospectives.md|회고"
)

for entry in "${FILES[@]}"; do
    IFS='|' read -r filepath label <<< "$entry"
    if grep -q "$CORE_VERSION" "$BASE/$filepath" 2>/dev/null; then
        echo "  [PASS] $label"
    else
        echo "  [FAIL] $label — $CORE_VERSION 미발견"
        ((ERRORS++))
    fi
done

for entry in "${OPTIONAL_FILES[@]}"; do
    IFS='|' read -r filepath label <<< "$entry"
    if [ -f "$BASE/$filepath" ]; then
        if grep -q "$CORE_VERSION" "$BASE/$filepath" 2>/dev/null; then
            echo "  [PASS] $label"
        else
            echo "  [FAIL] $label — $CORE_VERSION 미발견"
            ((ERRORS++))
        fi
    else
        echo "  [SKIP] $label — 파일 없음 (선택적)"
    fi
done

# --- PART 2: 벤치마크 섹션별 검증 (파일이 있을 때만) ---
BMK="$BASE/etc/_galpi_benchmark_report.md"
if [ -f "$BMK" ]; then
    echo ""
    echo "── 2. 벤치마크 섹션별 검증 ──"

    # 헤더
    HEADER=$(head -5 "$BMK")
    if echo "$HEADER" | grep -q "$CORE_VERSION"; then
        echo "  [PASS] 헤더 (대상 버전)"
    else
        echo "  [FAIL] 헤더 — 아직 과거 버전 표기"
        ((ERRORS++))
    fi

    # §2.2
    SEC22=$(sed -n '/### 2.2/,/^## 3/p' "$BMK")
    if echo "$SEC22" | grep -q "$CORE_VERSION"; then
        echo "  [PASS] §2.2 비교 대상"
    else
        echo "  [FAIL] §2.2 비교 대상 — $CORE_VERSION 행 없음"
        ((ERRORS++))
    fi

    # §3.2
    SEC32=$(sed -n '/### 3.2/,/### 3.3/p' "$BMK")
    if echo "$SEC32" | grep -q "$CORE_VERSION"; then
        echo "  [PASS] §3.2 RSI-10 테이블"
    else
        echo "  [FAIL] §3.2 RSI-10 테이블 — $CORE_VERSION 행 없음"
        ((ERRORS++))
    fi

    # §3.3
    RANK1=$(grep "| \*\*1\*\*" "$BMK" | head -1)
    if echo "$RANK1" | grep -q "$CORE_VERSION"; then
        echo "  [PASS] §3.3 순위표 1위"
    else
        echo "  [FAIL] §3.3 순위표 — 1위에 $CORE_VERSION 미포함"
        ((ERRORS++))
    fi

    # §5
    SEC5=$(sed -n '/^## 5\./,/^## 6/p' "$BMK")
    if echo "$SEC5" | grep -q "$CORE_VERSION"; then
        echo "  [PASS] §5 차원별 비교"
    else
        echo "  [FAIL] §5 차원별 비교 — 과거 버전 기준"
        ((ERRORS++))
    fi

    # 잔류 탐지
    echo ""
    echo "── 3. 잔류 과거 버전 탐지 ──"
    STALE_IN_SECTIONS=$(sed -n '/^## [5-8]\./,/^## 9\./p' "$BMK" | grep -nP "갈피 v\d+\.\d+" | grep -v "$CORE_VERSION" | grep -v "v2\.0\b" | head -10 || true)
    if [ -z "$STALE_IN_SECTIONS" ]; then
        echo "  [PASS] §5~§8에 과거 버전 잔류 없음"
    else
        echo "  [WARN] §5~§8에 과거 버전 잔류 발견:"
        echo "$STALE_IN_SECTIONS" | while read line; do echo "    $line"; done
        ((WARNINGS++))
    fi
else
    echo ""
    echo "── 2. 벤치마크 [SKIP] — 파일 없음 ──"
fi

# --- PART 3: 지표 일관성 ---
echo ""
echo "── 4. 지표 일관성 ──"

STATE_RSI=$(grep -oP "RSI-10[:\s]*\d+" "$BASE/galpi_data/_galpi_state.md" 2>/dev/null | grep -oP "\d+$" | tail -1)
if [ -n "$STATE_RSI" ]; then
    PATCH_RSI=$(grep -oP "RSI-10[:\s]*\d+" "$BASE/etc/_galpi_patch_notes.md" 2>/dev/null | grep -oP "\d+$" | head -1)
    if [ -n "$PATCH_RSI" ]; then
        if [ "$STATE_RSI" = "$PATCH_RSI" ]; then
            echo "  [PASS] RSI-10 일치 (상태=$STATE_RSI, 패치=$PATCH_RSI)"
        else
            echo "  [FAIL] RSI-10 불일치 (상태=$STATE_RSI, 패치=$PATCH_RSI)"
            ((ERRORS++))
        fi
    else
        echo "  [SKIP] RSI-10 — 패치노트 없음"
    fi
else
    echo "  [SKIP] RSI-10 — 상태 파일에 값 없음 (초기 상태)"
fi

# --- PART 4: 프롬프트 크기 ---
echo ""
echo "── 5. 프롬프트 크기 ──"
LINES=$(wc -l < "$CORE_FILE")
BYTES=$(wc -c < "$CORE_FILE")
echo "  줄: $LINES | 바이트: $BYTES"

# --- 결과 ---
echo ""
echo "================================"
if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo "결과: ALL PASS ($CORE_VERSION)"
elif [ $ERRORS -eq 0 ]; then
    echo "결과: PASS ($WARNINGS warning(s)) — 과거 참조 잔류 확인 필요"
else
    echo "결과: $ERRORS FAIL(s), $WARNINGS warning(s) — 수정 필요"
fi
echo "================================"

exit $ERRORS

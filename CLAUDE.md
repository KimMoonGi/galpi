# 갈피 (galpi)

정답 없는 고민의 갈피를 잡아주는 AI 상담·컨설턴트. **Claude Code 플러그인**으로 배포된다.

## 구조 (두 리포 분리)

| 리포 | 성격 | 내용 |
|---|---|---|
| **`KimMoonGi/galpi`** (이 리포, public) | 플러그인 코드 | 프로토콜·정적 참조·템플릿·시드·스크립트 |
| **`{사용자}/galpi-memory`** (private) | 각 사용자의 축적 데이터 | 회고·캘리브레이션·측정 로그·상태 |

플러그인과 축적 데이터를 분리한 이유: `/plugin update` 시 개인 데이터 유실 방지.

## 이 리포의 디렉토리

```
.claude-plugin/marketplace.json         ← 마켓플레이스 매니페스트 (name: moongstory-marketplace)
plugins/moongstory-tools/
  .claude-plugin/plugin.json            ← 플러그인 매니페스트 (name: moongstory-tools, version)
  commands/galpi.md                     ← 메인 프로토콜 (v0.11.0). 호출: /moongstory-tools:galpi
  galpi_data/                           ← 정적 참조 (_ref_*.md 7종)
  reports/galpi_report_template.html    ← 리포트 브랜드 템플릿
  memory-template/                      ← 신규 사용자용 시드 (빈 초기 파일 4종)
  scripts/
    setup-galpi-memory.sh               ← 신규 사용자 자동 세팅
    validate_galpi_version.sh           ← 버전 일관성 검증
INSTALL.md                              ← 사용자용 설치 가이드 (친구 대상)
```

## 설치 (신규 사용자)

[INSTALL.md](INSTALL.md)의 자동 스크립트 또는 수동 절차 참조.

## 개발 (유지보수자용)

### 플러그인 수정 흐름
1. `plugins/moongstory-tools/commands/galpi.md` 등 수정
2. `plugins/moongstory-tools/.claude-plugin/plugin.json`과 `.claude-plugin/marketplace.json`의 `version` 올리기
3. git commit + push
4. 사용자는 `/plugin marketplace update moongstory-marketplace` → `/plugin update moongstory-tools@moongstory-marketplace`

### 버전 규칙
- `_galpi_ref_version_checklist.md` 기준. "재학습 없이 쓸 수 있으면 Minor", 프로토콜 의미 변경은 Major.
- 현재: v0.11.0 (플러그인 이름 galpi → moongstory-tools, 마켓 이름 galpi-marketplace → moongstory-marketplace. 기존 설치자는 uninstall 후 재설치 필요)

### 경로 해석 규칙 (galpi.md 내부)

| 참조 | 실제 경로 | 쓰기 |
|---|---|---|
| `${CLAUDE_PLUGIN_ROOT}/galpi_data/_ref_*.md` | 플러그인 캐시 | ❌ 읽기만 |
| `~/.claude/galpi-memory/...` | 사용자 홈 별도 리포 | ✅ 자동 push |
| `GalpiReports/...` | 현재 작업 디렉토리 | ✅ 각 프로젝트 |

## 브랜드

- 먹 `#1B2838` · 단 `#E8985E` · 청 `#3D5A6E` · 지 `#FDF8F4`
- 폰트: MaruBuri (제목) + Noto Sans KR (본문)
- 톤: 개인=따뜻 / 업무=프로페셔널

## 배포 원칙

- 이 리포는 **public** — 누구나 갈피 플러그인 설치 가능
- 각 사용자의 `galpi-memory`는 **반드시 private** — 개인 고민 기록이 들어감
- legacy `install-galpi.bat`는 플러그인 전환 이전 방식. 신규 설치엔 사용 금지.

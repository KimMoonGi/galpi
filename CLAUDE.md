# 갈피 (galpi)

정답 없는 고민의 갈피를 잡아주는 AI 상담·컨설턴트.
**두 리포로 분리된 Claude Code 플러그인 시스템**:

- **`KimMoonGi/galpi`** — 플러그인 (이 리포). 코드·정적 참조·템플릿. `/plugin update`로 갱신.
- **`KimMoonGi/galpi-memory`** — 축적 데이터 (private). 회고·캘리브레이션·측정 로그·상태. 갈피 세션이 자동 push.

## 구조 (이 리포)

- `.claude-plugin/marketplace.json` — 마켓플레이스 매니페스트
- `plugins/galpi/` — 갈피 플러그인 루트
  - `.claude-plugin/plugin.json` — 플러그인 매니페스트
  - `commands/galpi.md` — 메인 프로토콜 (v0.10.0)
  - `galpi_data/` — 정적 참조 파일 (`_ref_*.md`)
  - `reports/galpi_report_template.html` — 리포트 브랜드 템플릿
  - `scripts/validate_galpi_version.sh` — 버전 일관성 검증
- `GalpiReports/` — 생성된 리포트 아카이브 (.gitignore, 각 작업 디렉토리 기준)
- `install-galpi.bat` — legacy 설치 스크립트 (플러그인 전환 이전)

## 설치 (신규 기기, 최초 1회)

```bash
# 1. 축적 데이터 리포 clone
git clone https://github.com/KimMoonGi/galpi-memory.git ~/.claude/galpi-memory
# Windows: C:\Users\{사용자}\.claude\galpi-memory\

# 2. Claude Code에서 플러그인 마켓 등록 + 설치
/plugin marketplace add KimMoonGi/galpi
/plugin install galpi@galpi-marketplace
```

## 사용

```
/갈피
```

## 업데이트

**플러그인 코드 변경 시**: `plugin.json`·`marketplace.json`의 `version` 올리고 push. 사용자는:
```
/plugin marketplace update galpi-marketplace
/plugin update galpi@galpi-marketplace
```

**축적 데이터**: 갈피 세션 P3.5 완료 시점에 `~/.claude/galpi-memory/`에서 자동으로 `git add && commit && push` 실행. 기기 간 동기화는 세션 시작 시 `git pull`(수동, 필요시).

## 데이터 영속성 설계

| 성격 | 위치 | 업데이트 시 |
|---|---|---|
| 정적 자산 (읽기만) | `${CLAUDE_PLUGIN_ROOT}/galpi_data/_ref_*.md` | 플러그인 업데이트로 갱신 |
| 축적 데이터 (쓰기) | `~/.claude/galpi-memory/` | `/plugin update` 영향 **없음** |
| 런타임 리포트 | `{cwd}/GalpiReports/` | 각 프로젝트 디렉토리 |

## 브랜드

- 먹 `#1B2838` · 단 `#E8985E` · 청 `#3D5A6E` · 지 `#FDF8F4`
- 폰트: MaruBuri (제목) + Noto Sans KR (본문)
- 톤: 개인=따뜻 / 업무=프로페셔널

## 브랜드

- 먹 `#1B2838` · 단 `#E8985E` · 청 `#3D5A6E` · 지 `#FDF8F4`
- 폰트: MaruBuri (제목) + Noto Sans KR (본문)
- 톤: 개인=따뜻 / 업무=프로페셔널

# 갈피 (galpi)

정답 없는 고민의 갈피를 잡아주는 AI 상담·컨설턴트.
**Claude Code 플러그인 마켓플레이스**로 배포된다.

## 구조

- `.claude-plugin/marketplace.json` — 마켓플레이스 매니페스트
- `plugins/galpi/` — 갈피 플러그인 루트
  - `.claude-plugin/plugin.json` — 플러그인 매니페스트
  - `commands/galpi.md` — 메인 프로토콜 (v0.9.2)
  - `galpi_data/` — 참조 파일, 측정 데이터, 회고 (`${CLAUDE_PLUGIN_ROOT}/galpi_data/`로 접근)
  - `reports/galpi_report_template.html` — 리포트 브랜드 템플릿
  - `scripts/validate_galpi_version.sh` — 버전 일관성 검증
- `GalpiReports/` — 생성된 리포트 아카이브 (.gitignore, 각 작업 디렉토리 기준)
- `install-galpi.bat` — legacy 설치 스크립트 (플러그인 전환 이전)

## 설치 (최초 1회)

```
/plugin marketplace add KimMoonGi/galpi
/plugin install galpi@galpi-marketplace
```

## 사용

```
/갈피
```

## 업데이트

로컬에서 `plugin.json`·`marketplace.json`의 `version` 올리고 push. 사용자는:
```
/plugin marketplace update galpi-marketplace
/plugin update galpi@galpi-marketplace
```

## 데이터 영속성 주의

플러그인 캐시(`~/.claude/plugins/cache/`)는 업데이트 시 GitHub 원본으로 덮어씌워질 수 있다.
회고(`_galpi_retrospectives.md`)·캘리브레이션(`_galpi_calibration.md`)·측정 로그(`_galpi_measurement_log.md`)의 축적본은 정기적으로 GitHub에 push해야 유실되지 않는다.

## 브랜드

- 먹 `#1B2838` · 단 `#E8985E` · 청 `#3D5A6E` · 지 `#FDF8F4`
- 폰트: MaruBuri (제목) + Noto Sans KR (본문)
- 톤: 개인=따뜻 / 업무=프로페셔널

# 갈피 (galpi)

> 정답 없는 고민의 갈피를 잡아주는 AI 상담·컨설턴트.
> Claude Code 플러그인 · v0.9.1

진짜 원하는 것을 확인하고, 생각 못한 선택지를 펼치고, 반론을 이겨낸 결론을 만듭니다. 개인에게는 상담사처럼(이직·관계·인생), 조직에게는 컨설턴트처럼(전략·채용·방향전환).

## 설치

### Claude Code 플러그인으로 설치 (권장)

```
/plugin marketplace add KimMoonGi/galpi
/plugin install galpi@galpi
```

설치 후 어디서든 `/갈피`로 호출.

### 수동 설치 (참고용)

리포 clone 후 `commands/galpi.md`를 프로젝트의 `.claude/commands/`로 복사, `data/ref/*.md`를 `.claude/galpi_data/`로 복사.

## 사용

```
/갈피
```

또는 고민을 함께 입력:

```
/갈피 이직을 할까 말까 고민이야
```

## 구조

```
galpi/
├── .claude-plugin/plugin.json       # 플러그인 메타데이터
├── commands/galpi.md                # 메인 프로토콜 (슬래시 명령 진입점)
├── data/
│   ├── ref/                         # 읽기 전용 참조 (7개)
│   │   ├── _ref_domain.md           # 도메인 어댑터 + 사용자 대면 언어
│   │   ├── _ref_retro.md            # 회고 형식
│   │   ├── _ref_antipatterns.md     # 실패 패턴
│   │   ├── _ref_sources.md          # 외부 소스
│   │   ├── _ref_measurement.md      # 4-Layer 측정 프레임워크
│   │   ├── _ref_audit_checklist.md  # L3 감사 체크리스트
│   │   └── _ref_version_checklist.md # 버전업 체크리스트
│   └── templates/                   # 프로젝트 설치 시 초기화용 (4개)
├── reports/galpi_report_template.html  # HTML 리포트 브랜드 템플릿
├── scripts/validate_galpi_version.sh   # 버전 일관성 검증
└── CLAUDE.md                        # 프로젝트 지침
```

프로젝트별 쓰기 데이터(`.claude/galpi_data/_galpi_*.md`, `GalpiReports/`)는 **각 프로젝트 로컬**에 생성되며 플러그인 배포본에 포함되지 않습니다.

## 브랜드

- 먹 `#1B2838` · 단 `#E8985E` · 청 `#3D5A6E` · 지 `#FDF8F4`
- 폰트: MaruBuri (제목) + Noto Sans KR (본문)
- 마크: 책갈피 리본
- 톤: 개인=따뜻 · 업무=프로페셔널

## 철학

- **진짜 원하는 것 확정** — 체크인으로 의도·모드·기준을 맞춤
- **선택지 발산** — 시드 생성 후 클러스터링·정밀평가
- **반론 선제** — 결론을 먼저 공격하고 살아남은 것만 제시
- **4-Layer 측정** — 프로세스·지각·감사·결과를 교차검증

## 면책

AI 생성 의사결정 참고 자료이며, 의료·법률·재정·정신건강 등 전문 자문을 대체하지 않습니다. 사용 결과는 사용자 본인 책임입니다.

## 라이선스

MIT

## Author

moongstory (happymoongi@gmail.com)

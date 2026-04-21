# 갈피 (galpi)

> 정답 없는 고민의 갈피를 잡아주는 AI 상담·컨설턴트.
> Claude Code 플러그인 · **v0.11.0**

진짜 원하는 것을 확인하고, 생각 못한 선택지를 펼치고, 반론을 이겨낸 결론을 만듭니다.
개인에게는 상담사처럼(이직·관계·인생), 조직에게는 컨설턴트처럼(전략·채용·방향전환).

---

## 빠른 설치

### 사전 준비

- [Claude Code](https://claude.com/claude-code) 설치
- [GitHub CLI](https://cli.github.com) 설치 + `gh auth login` 인증
- Git (Windows는 Git Bash)

### 1. 개인 축적 데이터 리포 세팅 (자동 스크립트)

본인의 GitHub ID를 넣어 터미널에서 실행:

```bash
curl -fsSL https://raw.githubusercontent.com/KimMoonGi/galpi/main/plugins/galpi/scripts/setup-galpi-memory.sh \
  -o /tmp/setup-galpi-memory.sh
bash /tmp/setup-galpi-memory.sh <본인-github-id>
```

스크립트가 수행:
1. `<본인-id>/galpi-memory` **private** 리포 생성 (회고·캘리브레이션 저장소)
2. `~/.claude/galpi-memory/`에 clone
3. 빈 시드 템플릿 복사 + 초기 커밋/푸시

### 2. Claude Code에서 플러그인 설치

```
/plugin marketplace add KimMoonGi/galpi
/plugin install moongstory-tools@moongstory-marketplace
```

설치 범위: **"Install for you (user scope)"** 선택 (어느 디렉토리에서든 사용 가능)

자세한 가이드(수동 경로·문제 해결 포함) → **[INSTALL.md](INSTALL.md)**

---

## 사용

어느 디렉토리에서든 Claude Code에서:

```
/moongstory-tools:galpi
```
(입력창에서 `/galpi`까지만 쳐도 자동완성됩니다.)

고민을 그대로 적어 주세요. 갈피가 진행합니다:
- **P1**: 의도 확정 + 성공조건·제약 + 도메인 감지
- **P2**: 선택지 발산 → 평가 → Top3 수렴 (역발상·근거 주입 포함)
- **P3**: 결론 + 적대 검증 + 회고 (S/H 경로는 HTML 리포트 자동 생성)

---

## 업데이트

**플러그인**:
```
/plugin marketplace update moongstory-marketplace
/plugin update moongstory-tools@moongstory-marketplace
```

**본인 축적 데이터**: 갈피 세션(P3.5) 완료 시 `~/.claude/galpi-memory/`에 자동 commit+push.
다른 기기에서 최신 회고 받기: `cd ~/.claude/galpi-memory && git pull`

---

## 데이터 구조

| 위치 | 내용 | 업데이트 방식 |
|---|---|---|
| `~/.claude/plugins/cache/...` | 플러그인 자산 (프로토콜·참조·템플릿) | `/plugin update` |
| `~/.claude/galpi-memory/` | **본인의 회고·캘리브레이션·측정 로그·상태** | 갈피 세션이 자동 push |
| `{작업디렉토리}/GalpiReports/` | 세션별 HTML 리포트 | 갈피가 생성 |

플러그인과 개인 데이터를 분리한 이유: `/plugin update` 시 축적된 회고가 유실되지 않도록.

---

## 중요 주의사항

- **`<본인-id>/galpi-memory`는 절대 public으로 바꾸지 마세요** — 개인 고민 기록이 들어갑니다.
- 이 플러그인은 **혼자 쓰는 용도**로 설계됨. 조직 단위 협업·공유 목적 아님.
- **민감 도메인 면책**: 의료·법률·재정·정신건강 관련 리포트에는 자동으로 면책 문구가 삽입됩니다. AI 판단은 전문가 자문을 대체하지 않습니다.
- 긴급 정신건강 위기: **자살예방 1393 · 정신건강위기 1577-0199**

---

## 브랜드

- 먹 `#1B2838` · 단 `#E8985E` · 청 `#3D5A6E` · 지 `#FDF8F4`
- 폰트: MaruBuri (제목) + Noto Sans KR (본문)
- 톤: 개인=따뜻 / 업무=프로페셔널

---

## 문서

- **[INSTALL.md](INSTALL.md)** — 설치 가이드 (자동·수동·문제 해결)
- **[CLAUDE.md](CLAUDE.md)** — 유지보수자용 개발 문서
- **[plugins/galpi/commands/galpi.md](plugins/galpi/commands/galpi.md)** — 갈피 프로토콜 본문 (v0.10.0)

---

## 제작

김문기 ([@KimMoonGi](https://github.com/KimMoonGi)) · Claude(Anthropic) 공동 개발

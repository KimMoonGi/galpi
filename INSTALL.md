# 갈피 설치 가이드

정답 없는 고민의 갈피를 잡아주는 AI 상담·컨설턴트. Claude Code 플러그인으로 동작합니다.

## 사전 요구사항

- [Claude Code](https://claude.com/claude-code) 설치 완료
- [GitHub CLI (`gh`)](https://cli.github.com) 설치 + 인증 (`gh auth login`)
- Git (윈도우는 Git Bash 권장)

## 설치 (자동 — 권장)

아래 명령은 **당신의 개인 축적 데이터용 private 리포**를 만들고 클론한 뒤 플러그인 설치 준비까지 마칩니다.

```bash
# 1. setup 스크립트 다운로드 + 실행 (GitHub ID는 본인 것으로)
curl -fsSL https://raw.githubusercontent.com/KimMoonGi/galpi/main/plugins/galpi/scripts/setup-galpi-memory.sh \
  -o /tmp/setup-galpi-memory.sh
bash /tmp/setup-galpi-memory.sh <당신의-github-id>
```

스크립트가 수행하는 일:
1. `<당신의-github-id>/galpi-memory` private 리포 생성
2. `~/.claude/galpi-memory/`에 clone
3. 시드 템플릿(빈 초기 파일) 복사
4. 초기 커밋 + push

완료 후 **Claude Code에서** 아래 두 줄 실행:

```
/plugin marketplace add KimMoonGi/galpi
/plugin install moongstory-tools@moongstory-marketplace
```

설치 scope는 **"Install for you (user scope)"** 선택 — 모든 디렉토리에서 `/갈피` 사용 가능.

## 설치 (수동)

스크립트 없이 직접 세팅하려면:

```bash
# 1. 개인 축적 리포 생성 (private 필수!)
gh repo create <당신의-github-id>/galpi-memory --private \
  --description "갈피 축적 데이터 (개인용 — 공개 금지)"

# 2. 로컬에 clone
git clone https://github.com/<당신의-github-id>/galpi-memory.git \
  ~/.claude/galpi-memory

# 3. 시드 템플릿 내려받기
cd ~/.claude/galpi-memory
for f in _galpi_state _galpi_retrospectives _galpi_calibration _galpi_measurement_log; do
  curl -fsSL "https://raw.githubusercontent.com/KimMoonGi/galpi/main/plugins/galpi/memory-template/${f}.md" -o "${f}.md"
done

# 4. 초기 커밋 + push
git add -A && git commit -m "초기 시드" && git push -u origin main
```

그런 다음 Claude Code에서:
```
/plugin marketplace add KimMoonGi/galpi
/plugin install moongstory-tools@moongstory-marketplace
```

## 사용

어느 디렉토리에서든 Claude Code에서:

```
/moongstory-tools:galpi
```
(`/galpi`까지만 쳐도 자동완성됩니다.)

고민을 그대로 적으면 갈피 프로토콜이 시작됩니다.

## 업데이트

**플러그인 (새 버전이 올라왔을 때)**:
```
/plugin marketplace update moongstory-marketplace
/plugin update moongstory-tools@moongstory-marketplace
```

**축적 데이터 (자동)**: 갈피 세션이 끝나면(P3.5 완료) 자동으로 `~/.claude/galpi-memory/`에 commit+push. 다른 기기에서 시작할 땐 `git pull`로 최신 상태 받아오세요.

## 데이터 구조

| 위치 | 내용 | 업데이트 |
|---|---|---|
| `~/.claude/plugins/cache/...` | 플러그인 자산 (정적) | `/plugin update` |
| `~/.claude/galpi-memory/` | **당신의 회고·캘리브레이션·측정 로그** | 갈피 세션이 자동 push |
| `{작업디렉토리}/GalpiReports/` | 세션별 HTML 리포트 | 갈피가 생성 |

## 중요 주의사항

- **`<당신-id>/galpi-memory`는 절대 public으로 전환하지 말 것** — 개인 고민 기록이 들어갑니다.
- 이 플러그인은 **혼자 쓰는 용도로 설계**됨. 조직 단위 배포 목적 아님.
- 갈피가 다루는 도메인이 **의료·법률·재정·정신건강**일 때는 리포트에 면책 문구가 자동 삽입됩니다. AI 판단은 전문가 자문을 대체하지 않습니다.

## 문제 해결

- **`/plugin` 명령이 안 보임** → Claude Code 최신 버전으로 업그레이드 필요
- **`gh auth status` 실패** → `gh auth login`으로 GitHub 인증
- **memory push 실패 (세션 종료 시)** → 네트워크 확인. 다음 세션 시작 시 자동 재시도됨. 쌓인 로컬 변경은 유지됨.
- **다른 기기에서 최신 회고가 안 보임** → `cd ~/.claude/galpi-memory && git pull`

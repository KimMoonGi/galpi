# 도메인별 실패 패턴 라이브러리 (Anti-Pattern DB) v4.0

> P1 패배선제 + P3 경험적 검증에서 참조. 외부 근거 기반.
> 형식: 패턴명 | 실패율 | 전제조건/맥락 | 출처
> **v4.0**: 완전판 — 31개 도메인 전방위 + 장르별(서바이벌/익스트랙션/호러/배틀로얄/로그라이크/MMO/오픈월드) + 규모별(인디/AA/AAA). ~150패턴.

---

## 게임 기획 (Design)

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| "플레이어가 원한다고 말하는 것 = 실제 원하는 것" | 70%+ | 설문 기반 기획 시 | GDC 다수 포스트모템 |
| "밸런스가 문제" → 실제로는 경제 구조 | 60%+ | F2P 게임 | Machinations 분석 |
| "더 많은 콘텐츠 = 더 많은 리텐션" | 50%+ | 콘텐츠 소비 속도 > 생산 속도 | Game Developer |
| "핵심 루프가 재미없으면 시스템으로 보완" | 80%+ | 코어 루프 결함 | GDC Vault |
| "레퍼런스 게임과 같은 시스템 = 같은 재미" | 60%+ | 맥락/장르 불일치 | 산업 경험 |
| **디자인 문제가 근본 원인인데 기술로 해결 시도** | **22%** | 200+ PM 중 22%가 game design 문제 보고 | [arXiv:2001.00491](https://ar5iv.labs.arxiv.org/html/2001.00491), 1035문제 분석 |
| **프로토타이핑 부재/부족** | 흔함 | 기능 검증 없이 본개발 돌입 → 후반 대규모 수정 | arXiv:2001.00491, 20유형 중 "Prototyping" |
| **콘텐츠/스토리가 개발 후반에 확정** | 5건+ | 스토리·피처·디자인 문서가 마감 직전에야 완성 → 기존 시스템 retrofit | [GDC 155PM 분석](https://www.gamedeveloper.com/business/what-went-wrong-learning-from-past-postmortems) |
| **혁신적 경험 추구 → 실행 리스크 폭증** | 높음 | Thief: "radically different gaming experience"가 프로젝트를 거의 죽임 | [10 Seminal PM](https://www.gamedeveloper.com/audio/10-seminal-game-postmortems-every-developer-should-read) |
| **속편 거부감이 품질에 영향** | 중간 | Diablo II: 팀이 속편 제작을 원하지 않음 → 디자인 동기 부족 | 10 Seminal PM, Blizzard |

## 프로덕션/프로젝트 관리 (Production & Management)

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **비현실적 스코프 (Unrealistic Scope)** | **45%** | 200+ PM 중 관리 문제의 핵심. 구현 불가능한 피처 수 계획 | arXiv:2001.00491, 관리군 45% |
| **피처 크리프 (Feature Creep)** | 5건+ | 기획 확정 후에도 피처 추가 지속 → 일정 파괴 | GDC 155PM + arXiv:2001.00491 |
| **피처 컷 (Cutting Features)** | 흔함 | 일정 부족으로 기능 제거 → 게임 완성도 저하 | arXiv:2001.00491 |
| **커뮤니케이션 단절** | 5건+ | 디자인팀-기술팀 간 인식 괴리. 게임 상태에 대한 인식 불일치 | GDC 155PM 분석 |
| **채용 부족/지연 (Inadequate Hiring)** | 5건+ | "작은 팀이 낫다" 신화 → 프로젝트 규모에 맞지 않는 인력 | GDC 155PM 분석 |
| **크런치 (Crunch Time)** | 흔함 | 스코프+일정 문제의 복합 결과. 이직률 상승 | arXiv:2001.00491 |
| **동시 다중 프로젝트** | 흔함 | 핵심 인력 분산 → 양쪽 모두 품질 저하 | arXiv:2001.00491 |
| **관리 오버헤드 > 실질 감독** | 다수 | 관리자는 많은데 실제 oversight은 부재. 업무 분배 모호 | GDC 155PM 분석 |
| **일정 추정 오류** | **25%** | 200+ PM 중 25%가 schedule 문제 보고 | arXiv:2001.00491 |
| **장애물(Obstacles)** | **37%** | 200+ PM 중 37%가 예상치 못한 장애물 보고 — 가장 흔한 문제 | arXiv:2001.00491 |

## 시스템 아키텍처 & 기술 (Technical)

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| 모놀리스 → 마이크로서비스 직행 | 50%+ | 팀 < 20명 | Fowler 2015, AWS Blog |
| "스케일링이 문제" → 실제로는 의사결정 속도 | 40%+ | 조직 이슈 | AWS Architecture Center |
| 기술 부채 = 아키텍처 부채 혼동 | 60%+ | 리팩터링 범위 오판 | thenewstack.io |
| 프레임워크 교체로 근본 문제 해결 시도 | 70%+ | 도구 문제 vs 설계 문제 | Martin Fowler |
| 데디케이티드 서버 없이 멀티플레이어 스케일 | 80%+ | P2P 한계 | Awesome Game Networking |
| **도구/엔진 문제 (Tools)** | **24%** | 200+ PM 중 24%가 development process 문제 보고. 엔진/API/서드파티 소프트웨어 | arXiv:2001.00491 |
| **기술 라이선싱이 일정을 잡아먹음** | 중간 | Deus Ex: 기술 라이선싱+PR이 팀 품질만큼 일정에 영향 | 10 Seminal PM, Ion Storm |
| **경험 부족한 팀의 기술 야심** | 높음 | System Shock 2: 기술적 야심 vs 팀 경험 미스매치 → 마감 실패 | 10 Seminal PM, Irrational Games |

## 밸런스/경제 설계

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| 단일 통화 경제 → 인플레이션 불가피 | 90%+ | 싱크 부재 | GEEvo Framework (arXiv) |
| "테스트 플레이어 10명 = 충분한 밸런스 검증" | 80%+ | 통계적 무의미 | Games User Research |
| 선형 보상 커브 → 중반 이탈 | 70%+ | 성장 체감 | Machinations |
| 자동 밸런싱 → 메타 경직 | 50%+ | 적응적 밸런싱 | 학술 (RL 기반) |

## 멀티플레이어/라이브 서비스

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **프리미엄 게임 + 인게임 과금 = 유저 반발** | 높음 | Inkbound: 유료 게임에 코스메틱 판매 → 예상치 못한 격렬한 반발 | [Inkbound PM](https://www.gamedeveloper.com/production/postmortem-inkbound-s-journey-in-early-access), 2024 |
| **내부 테스터 ≠ 유료 유저 감정** | 높음 | 무료로 받은 테스터는 과금에 감정적 반응 없음 → 시장 반응 예측 실패 | Inkbound PM, Shiny Shoe |
| **단일 언어 얼리 액세스 → 글로벌 피드백 손실** | 중간 | 영어 전용 출시 → 비영어권 피드백 공백 → 반복 개선 범위 축소 | Inkbound PM |
| **검증 불가능한 가정이 비즈니스 모델에 내재** | 높음 | 비즈니스 모델 가정은 출시 전 내부 테스트로 검증 불가 → 시장에서만 확인 | Inkbound PM (메타 인사이트) |

## 조직 설계

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| 매트릭스 조직 → 책임 분산 | 60%+ | 보고선 2개+ | McKinsey |
| "애자일 도입 = 속도 향상" | 50%+ | 문화 미변화 시 | HBR |
| 대규모 조직 개편 → 6개월 생산성 저하 | 80%+ | 변화 곡선 | McKinsey State of Org |
| **뛰어난 개발자를 관리직에 배치 → 양쪽 다 손실** | 높음 | "대부분의 게임 개발자는 게임을 만들기 위해 고용됨, 사람 관리가 아님" | [KGC 발표](https://www.thisisgame.com/webzine/news/nboard/4/?n=13197) |
| **팀 문제 (Team/Staffing)** | **상위 35%** | 인력 이탈, 아웃소싱 문제, 전문성 미스매치 | arXiv:2001.00491, Design+Technical+Team 합산 |

## 기술 스택 선정

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| 최신 기술 = 최적 기술 | 60%+ | Hype Cycle | ThoughtWorks Tech Radar |
| "커뮤니티가 크니까 안전" → 생태계 파편화 | 40%+ | JS 생태계 등 | SO Survey |
| 벤더 종속 무시 → 마이그레이션 비용 폭증 | 50%+ | 클라우드 이전 | AWS Migration Blog |

## 게임 UX/UI

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **초보자 편의 vs 숙련자 깊이 이분법** | 흔함 | UI가 한쪽만 만족 → 나머지 이탈. Destiny가 관습 도전으로 해결 | [GDC Vault Destiny UI](https://gdcvault.com/play/1023460/Tenacious-Design-and-The-Interface) |
| **유저 리서치 없이 디자인** | 높음 | 설문/인터뷰/유저빌리티 테스트 생략 → 퍼소나 불일치 | [UX Planet](https://uxplanet.org/game-design-ux-best-practices-guide-4a3078c32099) |
| **UX 결함이 디자인 결함으로 오진** | 흔함 | 게임이 재미없는 게 아니라 UI가 나빠서 → 핵심 루프 재설계 낭비 | GDC 2019 Failure Workshop |
| **첫인상 복잡성 → 즉시 이탈** | 높음 | "유저는 빠른 접근, 편의, 적은 사전 투자를 원함" — 온보딩 실패 | UX Planet |

## 게임 마케팅

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **과대 약속 → 과소 이행 (Overpromise-Underdeliver)** | 높음 | Anthem: E3 시연 vs 실제 품질 괴리 → 출시 즉시 신뢰 붕괴 | [5W PR](https://5wpr.net/why-digital-pr-and-marketing-failed-for-some-video-game-launches/) |
| **기능 부재를 마케팅으로 가림** | 높음 | No Man's Sky: 미구현 기능을 프로모션에 포함 → 사기 인식 | 5W PR |
| **출시 상태와 마케팅 톤 불일치** | 높음 | Fallout 76: "완성형 경험" 마케팅 vs 게임 브레이킹 버그 | 5W PR |
| **기대치 관리 실패** | 높음 | Cyberpunk 2077: 구형 콘솔 성능을 숨김 → 스토어 퇴출 | 5W PR |
| **마케팅 시작이 너무 늦음** | 높음 | 인디: 출시 직전 시작 → 위시리스트 부족. 최소 6~9개월 필요 | [How to Market a Game](https://howtomarketagame.com/) |
| **게임플레이 없는 시네마틱 트레일러** | 흔함 | Steam 유저는 타임라인을 넘겨 게임플레이를 찾음 | How to Market a Game |
| **인디 Steam 중앙값 $1,136** | 통계 | 68%가 3년 내 $10K 미만 — 마케팅이 최대 실패 원인 | [gamedevelopermarketing.com](https://gamedevelopermarketing.com/why-do-indie-games-fail-5-surprising-reasons/) |

## 아트/애니메이션/VFX/SFX 파이프라인

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **VFX 최적화를 프로젝트 끝까지 미룸** | 흔함 | 아티스트가 최적화에 시간 투입 → 출시 불가 피처에 낭비 | [GDC 2023 VFX Roundtable](https://realtimevfx.com/t/gdc-2023-vfx-roundtable-discussion-notes/23367) |
| **오프라인 렌더 데모 → 실시간 기대** | 흔함 | 디렉터/매니저가 오프라인 R&D 결과를 보고 실시간 구현 요구 | GDC 2023 VFX Roundtable |
| **엔진 용어 불일치 → 피드백 단절** | 흔함 | "Runner" vs "Parent-Child", Shader vs Material — 팀 간 소통 붕괴 | GDC 2023 VFX Roundtable |
| **반복 루프 구축이 최대 시간 낭비** | 높음 | "이펙트를 확인하기 위한 반복 루프 구축이 가장 큰 시간 낭비" | GDC 2023 VFX Roundtable |
| **멀티플레이어 VFX 테스트 취약성** | 높음 | 네트워크 테스트가 특히 취약 → 심각한 성능 저하, 엔지니어 지원 필요 | GDC 2023 VFX Roundtable |
| **프로덕션 중 리깅/라이팅 시스템 변경** | 높음 | "이런 시스템을 소급 적용하는 것은 매우 어렵다" | GDC 2023 VFX Roundtable |
| **좋은 도구 ≠ 좋은 아트** | 흔함 | 도구 선택에 집중 → 예술적 필요성 무시 | GDC 2023 VFX Roundtable |
| **제너럴리스트 vs 스페셜리스트 압박** | 높음 | 세분화 트렌드(유체 시뮬, 후디니, 셰이더 등) vs 범용 기대 충돌 | GDC 2023 VFX Roundtable |

## HR/조직 문화/인재 관리

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **크런치가 "문화"로 정당화** | 42% | IGDA 2019: 42%가 크런치 기대, 19%가 주 60~69시간 | [IGDA Survey](https://igda-website.s3.us-east-2.amazonaws.com/wp-content/uploads/2021/05/27113439/Guide-for-Game-Companies_-How-to-Create-and-Sustain-a-Positive-Work-Culture.pdf) |
| **게임 업계 이직률 22.6%** | 통계 | 전 산업 평균 20% 대비 높음 — 번아웃+저임금 복합 | [HiBob](https://www.hibob.com/blog/gaming-companies-hr-challenges/) |
| **시니어 번아웃 → 관리 공백** | 높음 | 시니어가 떠나면 관리 경험 공백 → 크런치 악순환 | [Runn](https://www.runn.io/blog/crunch-time-in-game-development) |
| **스타트업 관리 방식을 대규모 조직에 적용** | 흔함 | "열정 기반" 관리가 규모 확장 시 붕괴 | [Bain](https://www.bain.com/insights/beyond-the-love-of-the-game-talent-in-the-video-game-industry/) |
| **게임사 vs 테크 기업 인재 경쟁** | 높음 | 더 이상 게임사끼리만 경쟁 아님 — 전체 테크 산업과 경쟁 | Bain |
| **크런치 보상 없음** | 34% | IGDA: 34%가 추가 보상/초과수당 없이 크런치 | IGDA Survey |

## IP 활용/트랜스미디어

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **원작 무시 적응 → 팬 이탈** | 높음 | Assassin's Creed(2016), Warcraft(2016): 원작과 톤/스토리 괴리 | [5W PR](https://5wpr.net/why-digital-pr-and-marketing-failed-for-some-video-game-launches/) |
| **프랜차이즈 인지도에 의존 → 내러티브 부재** | 높음 | Marvel's Avengers: 프랜차이즈 힘만 믿고 고유 매력 부족 → 유저 유지 실패 | [Naavik](https://naavik.co/deep-dives/the-future-of-transmedia/) |
| **크리에이티브 컨트롤 포기** | 높음 | 닌텐도(Mario 영화)와 라이엇(Arcane)은 크리에이티브 컨트롤 유지 → 성공. 포기 시 실패 | [MatthewBall.co](https://www.matthewball.co/all/gamingip) |
| **신규 팬 진입 경로 부재** | 흔함 | 트랜스미디어 확장 후 "게임을 해보고 싶은" 신규 팬의 접근 경로 미설계 | [MidiaResearch](https://www.midiaresearch.com/reports/flipping-the-script-game-ip-transmedia-needs-to-evolve) |

## 로컬라이제이션

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **맥락 없이 스프레드시트만 번역** | 높음 | 초기 L10n: 맥락 없는 텍스트만 제공 → 완전한 실패 | [OneSkyApp](https://www.oneskyapp.com/blog/game-localization-mistakes-2/) |
| **직역(Word-for-word) 번역** | 높음 | 문화적 뉘앙스, 유머, 의미 무시 → 플레이어 몰입 파괴 | OneSkyApp |
| **DLC/시즌 이벤트 로컬라이제이션 누락** | 흔함 | 출시 때만 번역 → 이후 업데이트 미번역 → 커뮤니티 분열 | [TechBuzzIreland](https://techbuzzireland.com/2025/09/30/game-localization-mistakes-that-hurt-player-experience/) |
| **커뮤니티가 번역 실패를 공격적으로 응징** | 높음 | 잘못된 로컬라이제이션 → 부정적 리뷰 폭주 | OneSkyApp |

## 라이브 서비스 운영

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **출시 시 콘텐츠 부족 → 초기 이탈** | 높음 | 기술 이슈+제한된 콘텐츠+불균형 게임플레이 복합 | [GameSpace](https://gamespace.com/all-articles/news/what-developers-can-learn-from-recent-live-service-game-failures/) |
| **업데이트 지연/무의미한 콘텐츠** | 높음 | 업데이트 간격 과다 또는 콘텐츠가 의미 없음 → 커뮤니티 이탈 | GameSpace |
| **Pay-to-Win 또는 과도한 그라인드** | 높음 | 수익화가 "공정하지 않다" 인식 → 신뢰 붕괴 | GameSpace |
| **마케팅 하이프로 롱런 시도** | 높음 | "마케팅 하이프는 라이브 서비스 게임의 수명을 만들 수 없다" | GameSpace |

## 게임 AI/NPC

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **핸드라이팅 디시전 트리 → "인공 멍청함"** | 높음 | 반복적 행동, 몰입 파괴, 미계획 상황에서 비정상 행동 | [Game Developer](https://www.gamedeveloper.com/programming/behavior-trees-for-ai-how-they-work) |
| **내비메시 = 완전한 이동 해결이라는 착각** | 높음 | 내비메시는 "어디 걸을 수 있는가"만 정의. 군중 관리/사회적 공간/병목 처리는 별도 시스템 필요 | GDC AI Summit |
| **ML 기반 NPC → 디버깅 불가/밸런스 불가** | 높음 | RL은 취약하고 해석 불가한 행동 생성. 상용 타이틀에서는 여전히 실험적 | GDC Survey + Engine Docs |
| **패스파인딩 실패를 스크립트로 덮기** | 흔함 | Half-Life: 수류탄 회피 실패 시 엎드리기로 대체. 근본 해결이 아닌 우회 | [Wikipedia AI in Games](https://en.wikipedia.org/wiki/Artificial_intelligence_in_video_games) |

## QA/테스팅

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **QA팀의 "내부자 시각" 편향** | 높음 | QA가 개발에 익숙해져 혼란스러운 메커닉/UI를 간과 | [Antidote](https://antidote.gg/qa-vs-playtesting/) |
| **크리티컬 패스만 테스트 → 엣지케이스 누락** | 흔함 | 시간 압박으로 핵심 경로만 검증 → 플레이어는 엣지케이스를 찾음 | Antidote |
| **매 코드 변경마다 전수 리그레션은 불가** | 구조적 | 하이브리드(자동화 smoke + 수동 복잡 시나리오)가 현실적 | [Unity QA](https://unity.com/how-to/testing-and-quality-assurance-tips-unity-projects) |
| **자동화 테스트가 UI 버그/밸런스 문제 못 잡음** | 구조적 | 자동화는 반복 검증용. "느낌"이 나쁜 것은 사람만 잡음 | Unity QA |

## 데이터 분석/텔레메트리

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **일화 기반 의사결정 (데이터 없이)** | 높음 | 인디 대부분: 최소 분석으로 운영 → 최적화 불가 | [Unfair Gaps](https://unfairgaps.com/us/video-game-industry/analytics-telemetry-and-player-behavior-data-infrastructure) |
| **KPI 트레이드오프 무시** | 흔함 | A/B 테스트에서 한 KPI↑ → 다른 KPI↓ → 비즈니스 판단 없이 수치만 추종 | [Databricks](https://www.databricks.com/blog/building-ab-testing-analysis-framework-mobile-gaming-databricks) |
| **행동 이벤트 → 성과 추론의 설계 부재** | 흔함 | 로우레벨 이벤트 수집만 하고 "이것이 뭘 의미하는가"의 추론 계층 미설계 | [ResearchGate Telemetry](https://www.researchgate.net/publication/283807192) |
| **GDPR/CCPA와 텔레메트리 수집 충돌** | 높음 | 데이터 수집·보관이 규제와 충돌 → 인프라 추가 비용 | Unfair Gaps |

## 내러티브/시나리오

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **사소한 장면에 과잉 분기 → 중요 장면에 자원 부족** | 흔함 | 분기 예산 배분 실패 → 핵심 순간의 선택지 부족 | [Game Developer](https://www.gamedeveloper.com/design/branching-conversation-systems-and-the-working-writer-part-1-introduction) |
| **분기 서사가 선형 서사보다 나을 거라는 착각** | 흔함 | "단일 경로의 분기 서사는 잘 만든 선형 스토리보다 절대 낫지 않다" | GDC Vault Narrative |
| **허브 구조 대화 = 자연스러운 대화라는 착각** | 흔함 | 정보 선택 구조이지 실제 대화가 아님 | Game Developer |

## 레벨 디자인

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **난이도 벽 vs 지루함 — 곡선 설계 실패** | 흔함 | 너무 빠른 난이도 상승 = 포기, 너무 느림 = 이탈 | [Medium](https://abhijeetzambare.medium.com/what-are-some-common-problems-in-game-level-design-8d8eba6a81d3) |
| **불명확한 피드백 → "불공정" 인식** | 높음 | 왜 죽었는지 모르면 난이도가 아니라 불공정 → 시각 큐/히트박스/적 행동 불일치 | [Ropstam](https://ropstamgames.com/difficult-games-vs-bad-game-design/) |
| **적 배치 밀도 오류** | 흔함 | 너무 밀집 = 압도, 너무 산재 = 지루 | Medium Level Design |
| **플레이테스트 없는 레벨 출시** | 높음 | 디자이너에게 안 보이는 동선/밸런스/혼란이 플레이어에게 보임 | Medium Level Design |

## 서버/인프라/DevOps

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **서버사이드 전수 검증 → 레이턴시 폭증** | 높음 | 모든 액션을 서버가 시뮬/검증 → 빠른 게임에서 성능 저하 | [arXiv 2512.21377](https://arxiv.org/html/2512.21377v1) |
| **단일 리전 배포 → 글로벌 레이턴시** | 흔함 | 멀티리전 + 리전별 매치메이킹 필수 | [Zigpoll](https://www.zigpoll.com/content/what-are-some-best-practices-for-scaling-server-infrastructure) |
| **매치메이킹 중앙화 → 병목** | 흔함 | 분산 매치메이킹 서비스 필요 | Zigpoll |
| **ML 기반 안티치트 → 스케일 불가** | 높음 | 통계/ML 방식은 "구현 확장성이 낮다" — FairFight/EAC 같은 SaaS가 현실적 | arXiv 2512.21377 |

## 접근성 (Accessibility)

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **접근성을 출시 후 패치로 대응** | 흔함 | 설계 단계에서 통합해야 비용 ↓. 소급 적용은 아키텍처 변경 필요 | [GDC 2025 Accessibility](https://accessforge.io/accessforge-blog/game-accessibility-at-gdc-2025) |
| **"접근성은 유저 문제"라는 인식** | 흔함 | "접근성은 제품에 있지 유저에 있지 않다" — 나쁜 디자인이 사람을 비활성화함 | [Game Accessibility Guidelines](https://gameaccessibilityguidelines.com/) |
| **시각/청각/운동 4영역 중 일부만 대응** | 흔함 | 컬러블라인드만 하고 운동 장애 무시 등 | [SAGE Journal](https://journals.sagepub.com/doi/abs/10.1177/1555412020971500) |

## 유저 리서치/플레이테스트

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **내부 플레이테스트의 지식 오염 (Knowledge Contamination)** | 구조적 | "팀이 메커닉, 지름길, 최적 루트를 다 아니까 유저빌리티 문제가 안 보인다" | [Antidote](https://antidote.gg/internal-playtests-fail-real-player-feedback-matters/) |
| **친구/가족의 설탕 코팅 피드백** | 구조적 | 가까운 관계 → 진솔한 비판 회피 → 표면적/긍정 편향 피드백 | Antidote |
| **내부 테스트 통과 = 출시 가능이라는 거짓 자신감** | 높음 | 내부 테스트에서 심각한 결함이 안 나왔으면 이미 위기 — 성공 자체가 무의미한 지표 | Antidote |
| **타겟이 아닌 플레이어로 테스트** | 흔함 | 아무나 테스트 vs 장르 맞춤 리크루팅. "하드코어 FPS 팬이 잡는 밸런스 결함을 캐주얼 테스터는 못 잡는다" | Antidote |
| **플레이어가 "말하는 것" ≠ "하는 것"** | 높음 | 설문 응답과 실제 행동 괴리. 행동 데이터 없이 설문만 보면 오판 | [Games User Research](https://gamesuserresearch.com/) |
| **테스트를 개발 후반까지 미룸** | 높음 | "결론이 모호하고 뻔하며, 이미 반영하기엔 너무 늦은 시점에 도착" | Games User Research |
| **리서치 목표 없이 방법론부터 결정** | 흔함 | "무엇을 알아야 하는가" 전에 "어떻게 테스트할까"를 먼저 결정 → 불필요한 테스트 | [PlaytestCloud](https://start.playtestcloud.com/blog/methods-for-playtesting) |
| **게임 UX 리서치를 웹 유저빌리티처럼 수행** | 흔함 | 웹은 효율이 목표, 게임은 즐거움이 목표 — 방법론 직수입은 부적합 | [NN/g](https://www.nngroup.com/articles/game-user-research/) |
| **확증 편향이 테스트 결과를 왜곡** | 높음 | 테스터가 가설을 확인하는 방향으로 행동 해석. 질문 프레이밍이 유도 | [Trymata](https://trymata.com/blog/confirmation-bias/) |
| **플레이테스트 예산 $0** | 50%+ | 2023 서베이: 50% 이상이 예산 제로. 응답자 69%가 $0-$100 | [2023 Playtest Survey](https://gamesuserresearch.com/the-2023-playtest-survey/) |
| **연간 외부 테스트 2~5회 (2개월에 1회 미만)** | 다수 | 대부분의 팀이 충분한 빈도로 테스트하지 못함 — 자원 제약이 핵심 | 2023 Playtest Survey |
| **세션당 참가자 ≤10명** | ~50% | 통계적 의미 없는 표본 크기로 결론 도출 | 2023 Playtest Survey |

## 툴 개발/파이프라인

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **프로그래머가 비기술 직군용 툴을 설계** | 구조적 | "가장 기술적인 사람이 가장 비기술적인 사람을 위한 도구를 만든다" → 사용성 단절 | [Game Developer](https://www.gamedeveloper.com/programming/game-tools-tune-up-optimize-your-pipeline-through-usability) |
| **파이프라인 의존성 맵 부재** | 높음 | 어떤 작업이 어떤 작업을 블로킹하는지 모름 → 대기 시간 낭비, 병목 미식별 | Game Developer Tools |
| **파이프라인 스테이지 간 소요 시간 불균형** | 높음 | 애니메이션 10일 vs 디자인 3일 → 전체 처리량이 가장 느린 스테이지에 맞춰짐 | Game Developer Tools |
| **도구가 구현 모델을 그대로 노출** | 높음 | 내부 데이터 구조를 사용자에게 노출 → 인지 부하↑, 논리 오류↑ (타이포가 아닌 로직 실수) | Game Developer Tools |
| **도구에 실시간 피드백/프리뷰 부재** | 높음 | 값 조정 → 게임에서 확인 → 다시 도구 → 반복. "블라인드 튜닝" | Game Developer Tools |
| **프로덕션 중 파이프라인 리디자인** | 높음 | Horizon Zero Dawn: 프로덕션 중 툴 파이프라인 전면 재설계 → 리스크 컸으나 성공. 보통은 실패 | [GDC Vault HZD](https://www.gdcvault.com/play/1024124/Creating-a-Tools-Pipeline-for) |
| **인하우스 툴의 기술 부채 누적** | 높음 | 에디터 크래시, 긴 반복 시간, 대규모 코드베이스 관리 부실. 엔진도 시간이 지나면 유지보수성 하락 | [Springer](https://link.springer.com/article/10.1007/s11042-025-20899-8) |
| **레벨 에디터 버그가 게임 전체에 전파** | 중간 | 트리거 볼륨 회전/스케일 버그 → 3D 오브젝트 배치 전체에 영향. 수정 시 사이드이펙트 | [Ask a Game Dev](https://askagamedev.tumblr.com/) |
| **"실패의 90%를 학습 기회로 쓰지 않는다"** | 높음 | GDC Failure Workshop: 대부분의 팀이 실패를 공유하지 않음 → 같은 실수 반복 | [GDC 2012](https://www.gamedeveloper.com/design/gdc-2012-game-devs-find-lessons-in-their-failures) |

## 인재 채용/커리어

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **"열정이 있으면 저임금도 감수" 문화** | 높음 | 테크 기업 대비 저임금 → 인재 유출 | [Bain Gaming Talent](https://www.bain.com/insights/beyond-the-love-of-the-game-talent-in-the-video-game-industry/) |
| **Steam 출시 14,000+/년 중 7~8%만 $100K 돌파** | 통계 | 인디 개발자 커리어 리스크 | [StudioKrew](https://studiokrew.com/blog/indie-vs-aa-vs-aaa-games-budgets-teams-technology-differences/) |

---

## 장르별 실패 패턴

### 서바이벌 게임

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **초기 생존 후 동기 부재** | 높음 | 생존 위협 해소 후 할 일이 없음 → 장기 목표/스토리 필수 | [Game Developer](https://www.gamedeveloper.com/design/current-issues-with-survival-games) |
| **자원 채집이 "버튼 꾹" 노동** | 높음 | 마인크래프트 나무 펀치, Satisfactory 스페이스바 — 채집 자체가 게임플레이여야 함 | [Medium Nick Irving](https://nickrirving.medium.com/five-things-survival-games-need-to-stop-doing-7379a858a6e5) |
| **멀티 서바이벌에 공동 목표 부재** | 높음 | "모든 사람을 하나로 묶는 이벤트, 모두가 도달해야 하는 가시적 목표"가 없음 | Game Developer |
| **자원 스폰 위치가 비논리적 → 몰입 파괴** | 흔함 | 사막에 나무, 눈밭에 철광석 등 | Game Developer |
| **난이도가 벽 또는 무풍** | 흔함 | "꾸준한 오르막"이어야지 "절벽"이면 안 됨 | [RetroStyleGames](https://retrostylegames.com/blog/how-to-make-a-survival-game/) |

### 익스트랙션 슈터

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **과도한 인벤토리 복잡성** | 높음 | Tarkov식 인벤토리가 장르 필수가 아님 — Hunt: Showdown은 단순화로 성공 | [Scree Games](https://screegames.com/2024/01/16/bullets-in-the-bayou-design-lessons-in-hunt-showdown/) |
| **스트레스 vs 쾌감 밸런스 실패** | 높음 | "개발자가 균형을 맞추기 어려운 장르" → 대부분의 Tarkov 클론 실패 원인 | [나무위키 익스트랙션 슈터](https://en.namu.wiki/w/%EC%9D%B5%EC%8A%A4%ED%8A%B8%EB%9E%99%EC%85%98%20%EC%8A%88%ED%84%B0) |
| **치터 문제가 장르 자체를 죽임** | 60%+ | "로비의 60%에 최소 1명 치터" → 동기 완전 상실. 하이스테이크 = 치트 인센티브 극대 | 나무위키 + Tarkov 커뮤니티 |
| **Fortnite식 원형 축소를 무비판 차용** | 흔함 | Dark and Darker 비판: "타르코프와 헌트에서 교훈을 얻어야 했다" | [Steam Community](https://steamcommunity.com/app/2016590/discussions/0/3467235293764550381/) |
| **$250 페이월 뒤의 오프라인 플레이** | 높음 | Tarkov: 오프라인 모드에 $250 에디션 필요 → Pay-to-Win 인식 | Screen Rant, 커뮤니티 |

### 호러/좀비

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **점프 스케어 남용 → 둔감화** | 높음 | "공포의 정크푸드" — 즉각 효과이나 빠르게 무효화 | [Dr Wedge](https://drwedge.uk/2024/10/11/common-horror-game-mistakes/) |
| **일관성 없는 분위기 → 몰입 붕괴** | 높음 | 어울리지 않는 시각/주제 요소 혼합 | Dr Wedge |
| **적 디자인 빈약 → 예측 가능** | 흔함 | 얕은 무브셋, 직접적 로어 설명, 전형적 비주얼 → 공포감 소실 | Dr Wedge |
| **긴장 빌드업 없이 지속적 적 투입** | 높음 | 액션 호러에서 흔함: 빌드업→릴리즈 사이클 없이 계속 공격 → 적응 | [Game Developer](https://www.gamedeveloper.com/design/the-balancing-act-of-tension-in-horror-game-design) |
| **공포는 긴 시간 유지 불가 — 구조적 한계** | 구조적 | "사람은 그렇게 오래 겁먹을 수 없다" → 후반부 긴장감 유지 실패 | [Game Developer](https://www.gamedeveloper.com/design/the-back-half-problems-of-horror-design) |
| **퍼즐이 분위기를 깸** | 흔함 | 스토리와 무관한 바쁜 작업 퍼즐 → 몰입에서 빠져나옴 | Dr Wedge |

### 배틀로얄

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **Fortnite/PUBG 추종 → MMO식 대학살 재현** | 높음 | 독자적 변주 없이 기존 히트작 복제 → 차별성 실패 | [Game Wisdom](https://game-wisdom.com/critical/battle-royale-design) |
| **변주(variance) 부족** | 높음 | 매 판이 비슷한 느낌 → 절차적/랜덤 요소 부족 | Game Wisdom |

### MMO

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **거래적 상호작용만 있는 설계 → 커뮤니티 미형성** | 높음 | "모든 플레이어 상호작용이 거래적이면 지지적 커뮤니티가 생기지 않는다" | [Massively OP](https://massivelyop.com/2024/11/27/perfect-ten-lessons-from-unsuccessful-mmorpgs-that-i-wish-designers-would-learn/) |
| **월드 규모 vs 동접 미스매치** | 높음 | 거대 월드에 12명 온라인 → 만날 수 없어 좌절 | [igroglaz](https://igroglaz.com/en/tangaria-blog/creating-mmo-roguelike-1-the-scale) |
| **재설계 성공은 "듣는 팀"에서만 발생** | 근거 | FF14, ESO: 플레이어 피드백을 듣고 점진적 개선. 자금 투입만으로 개선 불가 | Massively OP |

---

## 규모별 실패 패턴

### 인디 (예산 ~$10K-$2M, 팀 1-20명, 기간 <2년)

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **AAA 품질 경쟁 시도** | 높음 | "성공한 인디는 AAA와 경쟁하려 하지 않는다. 다른 유형의 게이머를 타겟팅" | [How to Market a Game](https://howtomarketagame.com/2023/11/06/my-advice-to-aaa-developers-trying-to-make-indie-games/) |
| **AAA 출신이 인디로 올 때 규모 감각 미조정** | 높음 | "빠르게 출시, 린하게 운영, AAA보다 더 많이 절삭" 필요 | How to Market a Game |
| **"1년 더 폴리싱하면 히트작" 환상** | 높음 | 부진한 게임에 추가 시간 투자 → 매몰 비용 함정 | How to Market a Game |
| **마케팅 부재가 실패 1순위** | 통계 | Steam 14,000+/년 중 7-8%만 $100K+ 수익 | StudioKrew |

### AAA (예산 $100M-$650M, 팀 200-800명, 기간 4+년)

| 패턴 | 실패율 | 맥락 | 출처 |
|------|:---:|------|------|
| **예산 자체가 리스크** | 높음 | $100M+ 투자 회수 실패 시 스튜디오 존속 위협 | StudioKrew |
| **팀 규모 → 커뮤니케이션 비용 비선형 증가** | 높음 | 200→800명 시 의사소통 경로 기하급수적 증가 | 산업 경험 |
| **"안전한" 속편/리부트에 편중** | 흔함 | 혁신 리스크 회피 → 시장 피로도 | 산업 트렌드 |

---

## 통계 요약 (학술 근거)

### 200+ 포스트모템, 1035 문제 분석 (arXiv:2001.00491, 1998~2018)

| 문제 그룹 | 비율 | 주요 유형 |
|:---:|:---:|------|
| **프로덕션** | 45% | Design, Tools, Technical, Testing, Bugs, Prototyping, Documentation |
| **관리** | 45% | Unrealistic Scope, Feature Creep, Delays, Crunch, Communication, Team, Planning |
| **비즈니스** | 10% | Security, Marketing, Monetization |

### 155 포스트모템 분석 (Washburn et al., ICSE 2016)

| "무엇이 잘못됐나" 카테고리 | 빈도 |
|------|:---:|
| 장애물 (Obstacles) | 37% |
| 일정 (Schedule) | 25% |
| 개발 프로세스 (Dev Process) | 24% |
| 게임 디자인 (Game Design) | 22% |

**핵심 발견**: 프로젝트 관리가 게임 개발 성패의 가장 큰 결정 요인. 게임 디자인 문제(22%)보다 관리 문제(장애물 37%+일정 25%)가 더 흔함.

---

> **출처**: [arXiv:2001.00491](https://ar5iv.labs.arxiv.org/html/2001.00491) | [ICSE 2016 155PM](https://www.semanticscholar.org/paper/17cbe2cf69be214e427cacc0c818c9cd81273453) | [GDC 155PM](https://www.gamedeveloper.com/business/what-went-wrong-learning-from-past-postmortems) | [Inkbound PM](https://www.gamedeveloper.com/production/postmortem-inkbound-s-journey-in-early-access) | [10 Seminal PM](https://www.gamedeveloper.com/audio/10-seminal-game-postmortems-every-developer-should-read) | [KGC](https://www.thisisgame.com/webzine/news/nboard/4/?n=13197) | [NDC 마비노기 영웅전](https://www.slideshare.net/paparanga/ndc-2010-1-4362428)

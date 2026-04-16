# 외부 지식 소스 목록 + 검색 쿼리 템플릿 v2.0

> **v2.0**: 게임 관련 전 분야 커버 (13 도메인). GDC/NDC/KGC 전방위 대응.

## 도메인별 검색 쿼리 템플릿

| 도메인 | P1 문제 검증 쿼리 | P2 증거 주입 쿼리 | P3 경험적 검증 쿼리 |
|------|------|------|------|
| 게임 기획 | `"game design" "{mechanic}" postmortem OR lessons learned` | `"game design" "{approach}" case study OR results` | `"game design" "{method}" failure OR risk` |
| 시스템 아키텍처 | `"{pattern}" migration pitfalls OR anti-patterns` | `"{pattern}" benchmark OR metrics OR case study` | `"{implementation}" failure rate OR cost overrun` |
| 밸런스/경제 | `"game economy" "{system}" balance failure OR inflation` | `"game balance" "{method}" empirical OR simulation` | `"game economy" "{design}" exploit OR collapse` |
| 조직 설계 | `"organizational restructuring" "{type}" failure rate` | `"org design" "{approach}" case study OR results` | `"reorg" "{method}" lessons learned OR mistakes` |
| 게임 UX/UI | `"game UX" "{element}" mistakes OR pitfalls OR usability` | `"game UI" "{approach}" best practices OR case study` | `"game UX" "{design}" failure OR player frustration` |
| 마케팅 | `"game marketing" "{strategy}" failure OR mistakes` | `"game launch" "{approach}" case study OR results` | `"game marketing" "{method}" lessons learned` |
| 아트/VFX/SFX | `"game VFX" OR "game audio" "{pipeline}" problems OR challenges` | `"game art" "{technique}" GDC OR best practices` | `"VFX pipeline" OR "audio pipeline" failure OR bottleneck` |
| HR/인재관리 | `"game studio" "{topic}" crunch OR burnout OR retention` | `"game industry" "{approach}" talent OR culture` | `"game studio" HR "{practice}" failure OR turnover` |
| IP/트랜스미디어 | `"game IP" "{type}" adaptation failure OR lessons` | `"transmedia" "{franchise}" case study OR success` | `"game IP" licensing "{approach}" mistakes` |
| 로컬라이제이션 | `"game localization" "{language}" mistakes OR failures` | `"game localization" "{approach}" best practices` | `"localization" "{method}" player backlash` |
| 커뮤니티 관리 | `"game community" "{issue}" backlash OR trust` | `"community management" "{approach}" case study` | `"player trust" "{method}" failure OR recovery` |
| 라이브 서비스 | `"live service" game "{model}" failure OR shutdown` | `"games as a service" "{approach}" retention` | `"live service" "{method}" lessons learned` |
| 수익화/BM | `"game monetization" "{model}" failure OR backlash` | `"game monetization" "{approach}" case study OR revenue` | `"monetization" "{method}" player reaction` |
| 기술 스택 | `"{technology}" adoption failure OR regret` | `"{technology}" benchmark OR comparison {year}` | `"{technology}" production issues OR postmortem` |

## 핵심 소스 (안정성 ★★★ 우선)

### 학술 (D12 직격)
| 소스 | URL | 용도 | 안정성 |
|------|-----|------|:---:|
| Semantic Scholar | semanticscholar.org | AI 기반 논문 검색, TLDR 제공 | ★★★ |
| arXiv | arxiv.org | CS/AI 프리프린트 | ★★★ |
| ACM Digital Library | dl.acm.org | CS 학회 논문 (2026 전면 오픈액세스) | ★★★ |
| Google Scholar | scholar.google.com | 범용 학술 검색 | ★★★ |

### 게임 개발 (D5+D7+D12)
| 소스 | URL | 용도 | 안정성 |
|------|-----|------|:---:|
| Game Developer | gamedeveloper.com | 포스트모템, 기획 에세이, 산업 뉴스 | ★★★ |
| Machinations | machinations.io/articles | 게임 경제 설계, 시뮬레이션 | ★★★ |
| Game Programming Patterns | gameprogrammingpatterns.com | 아키텍처 패턴 (무료 온라인 북) | ★★★ |
| Game UI Database | gameuidatabase.com | UI/UX 레퍼런스 55,000+ 스크린샷 | ★★★ |

### 아키텍처/기술 (D7 직격)
| 소스 | URL | 용도 | 안정성 |
|------|-----|------|:---:|
| Martin Fowler | martinfowler.com | 아키텍처 패턴, 마이크로서비스, 리팩터링 | ★★★ |
| AWS Architecture Center | aws.amazon.com/architecture | Well-Architected Framework, 레퍼런스 아키텍처 | ★★★ |
| ThoughtWorks Tech Radar | thoughtworks.com/radar | 기술 트렌드 Assess/Trial/Adopt/Hold | ★★★ |
| Epic Dev Docs | dev.epicgames.com/documentation | UE5 아키텍처, 리플리케이션, 블루프린트 | ★★★ |
| Awesome Game Networking | github.com/rumaniel/Awesome-Game-Networking | 멀티플레이어 네트워킹 패턴 | ★★★ |

### 전략/조직 (D5+D7)
| 소스 | URL | 용도 | 안정성 |
|------|-----|------|:---:|
| McKinsey Insights | mckinsey.com/capabilities/people-and-organizational-performance | 조직 설계, 변화관리 | ★★☆ |
| HBR | hbr.org | 전략, 조직, 리더십 (월 3-4건 무료) | ★★☆ |

### 게임 UX/UI
| 소스 | URL | 용도 | 안정성 |
|------|-----|------|:---:|
| Game UI Database | gameuidatabase.com | 55,000+ 스크린샷, HUD/컨트롤 패턴 검색 | ★★★ |
| GDC Vault UX/UI | gdcvault.com (UX Summit) | Destiny UI, Division UI 등 실전 사례 | ★★★ |
| UX Planet (Game UX) | uxplanet.org | 게임 UX 베스트 프랙티스 가이드 | ★★☆ |
| Games User Research | gamesuserresearch.com | 플레이테스트/UX 리서치 방법론 | ★★★ |

### 마케팅
| 소스 | URL | 용도 | 안정성 |
|------|-----|------|:---:|
| How to Market a Game | howtomarketagame.com | 60가지 마케팅 실수, Steam 위시리스트 전략 | ★★★ |
| Game Developer Marketing | gamedevelopermarketing.com | 인디 실패 원인 분석, 통계 | ★★★ |
| CloutBoost | cloutboost.com/blog | 퍼블리싱/마케팅 실수 Top 10 | ★★☆ |

### 아트/VFX/SFX 파이프라인
| 소스 | URL | 용도 | 안정성 |
|------|-----|------|:---:|
| Real Time VFX | realtimevfx.com | GDC VFX Roundtable 노트, 파이프라인 토론 | ★★★ |
| Beyond-FX Blog | blog.beyond-fx.com | VFX 라운드테이블 요약, 최적화 패턴 | ★★★ |
| GDC Tech Art Summit | gdcvault.com (Tech Art) | 리깅/TA/파이프라인 실전 사례 | ★★★ |

### HR/인재관리
| 소스 | URL | 용도 | 안정성 |
|------|-----|------|:---:|
| IGDA Guides | igda.org | 크런치/문화/다양성 가이드, 개발자 만족도 조사 | ★★★ |
| Bain (Gaming Talent) | bain.com | "Beyond the Love of the Game" — 게임 인재 전략 | ★★★ |
| HiBob (Gaming HR) | hibob.com/blog | 게임 업계 HR 5대 과제 | ★★☆ |

### IP/트랜스미디어
| 소스 | URL | 용도 | 안정성 |
|------|-----|------|:---:|
| Naavik (Transmedia) | naavik.co | IP 활용/트랜스미디어 딥다이브 | ★★★ |
| MatthewBall.co | matthewball.co | 게임 IP가 영화/TV로 확장되는 7가지 이유 | ★★★ |
| Gamma Law | gammalaw.com | IP 라이선싱 법적 기반 | ★★☆ |

### 로컬라이제이션
| 소스 | URL | 용도 | 안정성 |
|------|-----|------|:---:|
| OneSkyApp | oneskyapp.com/blog | Top 10 로컬라이제이션 실수 | ★★★ |
| Andovar | blog.andovar.com | 15가지 흔한 L10n 문제 | ★★★ |

### 라이브 서비스/커뮤니티
| 소스 | URL | 용도 | 안정성 |
|------|-----|------|:---:|
| GameSpace | gamespace.com | 라이브 서비스 실패 분석 | ★★☆ |

### 의사결정 (범용)
| 소스 | URL | 용도 | 안정성 |
|------|-----|------|:---:|
| UK Gov MCDA Guide | analysisfunction.civilservice.gov.uk | 다기준 의사결정 분석 가이드 | ★★★ |

## 증류 프로토콜

WebFetch 원문 → 3단 증류:
1. **관련성 필터**: "이 내용이 현재 주장과 직접 관련 있는가?" → No → 폐기
2. **신뢰도 태깅**: `[학술|산업보고서|블로그|포럼]` + `[N=?]` + `[연도]`
3. **핵심 추출**: 200토큰 이내로 "주장 + 수치 + 맥락" 압축

신뢰도 낮은 소스(포럼, 연도>3년)는 보조 근거로만 사용.

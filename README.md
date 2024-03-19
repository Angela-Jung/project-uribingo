# 우리빙고 (UriBingo)

공용 냉장고 관리 솔루션을 제공하는 앱 <br>
2024.01 - 2024.02 (팀 프로젝트) <br>
Google Play Store: https://play.google.com/store/apps/details?id=com.uribingo

![제목 추가](https://github.com/sanghyun3377/project_super.team/assets/89803783/120e6f74-eb01-4b54-b00d-f9a7f2a2f060)


<br>

## Skills
Dart, Flutter, Provider, MVVM, Figma, Notion
<br>
<br>
## 상태관리 & 디자인패턴
Provider, MVVM
<br>
<br>
## 인원 구성
총 6인 (기여도 30%) | 플러터 개발자
<br>
<br>
<br>

## 주요 개선 사항 <br>
사용자의 편의성을 고려하여 사진 등록만으로 모든 필수 정보가 자동으로 생성 및 저장되도록 구현 <br>
- 냉장고 관리자의 니즈로 시작된 프로젝트 → 직원의 입장에서 앱 사용 강제성이 생기는 부분에 대해 고민 <br>
- 필수 정보를 하나씩 입력해야 했던 기존 기획을 자동 생성으로 변경하기로 결정 <br>
- DateTime 클래스와 difference 메서드를 이용한 자동 계산 시스템 구현 <br>
- 음식 사진을 등록하는 시점을 자동으로 기록하고, 이를 바탕으로 남은 보관 기간을 계산하는 시스템을 구현  <br>
- 사용자의 입력 시간을 50% 감소시킴
<br>
<br>

## 기타 개선 사항 <br>
1. 상태에 따른 UI 업데이트로 사용자 친화적 시스템 구현 <br>
- Provider를 활용하여 동적으로 UI를 업데이트하여 페이지 이탈 없이 효율적으로 필요한 액션을 취할 수 있도록 함 <br>
- 단일 페이지 내에서 모든 필수 기능을 수행할 수 있게 되어 사용 편의성을 향상 시킴 <br>
2. UI 통일성 및 협업 효율성 향상을 위한 공통 Widget 모듈화 <br>
- 재사용 가능한 위젯 파악 → dialog와 button 위젯을 제작하여 UI 컴포넌트 모듈화 <br>
- UI 개발 효율성이 증가하고 팀원 간의 협업이 원활해짐 <br>
3. 코드의 가독성 및 안정성 향상을 위한 MVVM 디자인 패턴 적용 <br>
- UI와 로직을 분리하고 의존성 주입, Provider를 활용하여 코드 구조 개선 <br>
- 가독성이 향상되어 팀원들이 서로의 코드를 더 쉽게 이해하고 유지보수 용이성이 높아짐 <br>



<br>

## Tech

<a href="" target="_blank"><img src="https://img.shields.io/badge/Flutter-02569B?style=flat&logo=Flutter&logoColor=white"/></a> 
<a href="" target="_blank"><img src="https://img.shields.io/badge/Dart-0175C2?style=flat&logo=Dart&logoColor=white"/></a>
<a href="" target="_blank"><img src="https://img.shields.io/badge/Firebase-FFCA28?style=flat&logo=Firebase&logoColor=white"/></a>
<br>
<a href="" target="_blank"><img src="https://img.shields.io/badge/Figma-F24E1E?style=flat&logo=Figma&logoColor=white"/></a>
<a href="" target="_blank"><img src="https://img.shields.io/badge/Canva-00C4CC?style=flat&logo=Canva&logoColor=white"/></a>

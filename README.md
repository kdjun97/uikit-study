# UIKit Study

UIKit 전반에 대한 궁금한 점들을 하나의 프로젝트 안에서 직접 구현하며 탐구할 예정.  
UI 구성 실험부터 특정 시나리오 기반 기능 검증까지 자유롭게 진행한다.  

# TODO  

- [x] Task A  
- [x] Task B  
- [x] Task C  
- [x] Task D  
- [x] ReactorKit 전환
- [x] Task E

<details>
<summary>Task A</summary><br>

Navigation 구조 설계 및 구현  

간단한 Navigation 흐름을 정의하고, 각 화면에는 버튼 한 개만 두는 최소 단위 UI로 구성한다.  
우선은 Multi Module 환경에서 Navigation 구조를 어떻게 설계할지 고민하기 전에, 필요한 기능들을 단일 프로젝트에서 먼저 실험하고 검증하는 단계다.  

이번 구조를 기반으로 화면 전환 방식을 간단하게 경험해보고,  
이후 진행할 다음 프로젝트에서 이를 Multi Module 구조로 확장하여 화면 전환/라우팅 설계, 모듈 간 의존 관계 설정, 특정 기능 검증까지 이어갈 예정이다.  

구조는 아래와 같이 개발 예정.  

```  
Root  
└─ Splash
└─ SignIn (로그인 버튼)
└─ Main
    └─ Home 
        └─ Detail
    └─ MyPage (로그아웃 버튼)
```  

</details>  

<details>
<summary>Task B</summary><br>

아래 구조에서 Detail 페이지에서 Sheet가 나올 수 있도록 개발.  

```  
Root  
└─ Splash
└─ SignIn (로그인 버튼)
└─ Main
    └─ Home 
        └─ Detail
    └─ MyPage (로그아웃 버튼)
```  

</details>  

<details>
<summary>Task C</summary><br>

**SnapKit을 활용한 UI 개발**

UIKit 기반 UI 개발에 익숙해지기 위한 과제로,
AutoLayout을 보다 간결하게 사용할 수 있는 SnapKit을 활용해 여러 View를 직접 구성해본다.

- UIKit + SnapKit을 사용하여 화면 UI 구현
- UI 구성은 자유 주제
  - 즉흥적으로 구성해도 무방
  - Figma에 있는 간단한 UI를 참고하여 구현도 ok
- 복잡한 인터랙션이나 고난이도 레이아웃은 지양하고, 기본적인 UI 구성과 AutoLayout 연습에 목적을 둔다

목표: SnapKit 문법과 AutoLayout 개념에 익숙해지고, UIKit UI 구성에 대한 감각을 익히는 것

</details>  

<details>
<summary>Task D</summary><br>

**UIKit 기반 Custom Alert 표시 시나리오 및 기능 구현**

- Alert의 실제 표시는 `UIViewController`에서 담당
- Alert를 띄워야 한다는 판단은 `ViewModel`에서 결정
- 하나의 View에서 여러 디자인의 Custom Alert를 유연하게 표시하는 구조를 목표로 구현

</details>  

<details>
<summary>ReactorKit 전환</summary><br>

**왜 ReactorKit?**

이 프로젝트는 기존의 MVVM + Clean Architecture 구조에서,  
보다 **명확한 상태 관리와 단방향 데이터 흐름**을 확보하기 위해  
**ReactorKit + Clean Architecture** 구조를 도입해 보고자 한다.  

ReactorKit은 단순한 MVVM의 확장이 아니라,  
**Action → Mutation → State**라는 명확한 흐름을 중심으로 설계된 아키텍처로,  
상태 변경의 경로를 제한하고 예측 가능한 UI 상태 관리를 가능하게 한다.  

또한, **TCA(The Composable Architecture)**에 익숙한 개발 경험을 바탕으로  
ReactorKit을 도입했을 때, 단방향 아키텍처가 실제 개발 및 유지보수에 어떤 이점을 제공하는지 개발하기엔 어떨지 검증해보고자 한다.  

모든 페이지를 다 migration하는 것 보다는, **SignIn 하나만 진행**하고, 이후 있을 몇 개의 뷰들만 Reactor로 진행하여,  
본 프로젝트에서는 MVVM 방식도 써보고, ReactorKit도 써보며 연습.  

</details>  

<details>
<summary>Task E 개발</summary><br>

이번 Task에서는 ReactorKit을 도입하며 기존 MyPage 화면을 개선한다.  

1. SnapKit을 사용하도록 기존 AutoLayout 코드 정리
2. MVVM 기반 MyPage 화면을 ReactorKit 아키텍처로 migration
3. UI를 확장하고, 일부 요소에 상호작용 기능 추가

</details>  
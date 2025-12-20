# UIKit Study

UIKit 전반에 대한 궁금한 점들을 하나의 프로젝트 안에서 직접 구현하며 탐구할 예정.  
UI 구성 실험부터 특정 시나리오 기반 기능 검증까지 자유롭게 진행한다.  

# TODO  

- [x] Task A  
- [x] Task B  
- [x] Task C  
- [x] Task D  


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
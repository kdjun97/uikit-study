# UIKit Study

UIKit 전반에 대한 궁금한 점들을 하나의 프로젝트 안에서 직접 구현하며 탐구할 예정.  
UI 구성 실험부터 특정 시나리오 기반 기능 검증까지 자유롭게 진행한다.  

# TODO  

- [x] Task A  


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
# Mangoring
![index](https://user-images.githubusercontent.com/84880772/181256685-a15d16bd-5832-4a0d-be1d-b65019160a7c.png)

## 쌍용교육센터 파이널프로젝트 (위치 기반 맛집 검색 및 예약 사이트)
- Spring Boot를 이용한 맛집 검색 및 예약 사이트를 구현했습니다.
- 일반 사용자는 맛집을 검색하여 예약, 또는 포장 주문을 진행 할 수 있으며, 음식점 관리자는 매장의 메뉴를 등록하거나 예약, 포장 주문을 관리할 수 있습니다. 

<br>

## 개발 기간
**2022.05.06 ~ 2022.06.10 (5주)**
- 2022.05.06 (주제 선정)
- 2022.05.09 ~ 12 (화면 / 기능 / ERD 설계 및 협의)
- 2022.05.13 ~ 06.09 (기능 구현)
- 2022.06.09 (발표 준비)
- 2022.06.10 (최종 발표)

<br>

## 세부 일정
![일정](https://user-images.githubusercontent.com/84880772/180790796-3ecb69e0-3b57-4f03-9de5-f5c0962d1370.PNG)

<br>

## 개발 환경
**Back-End**
- OS : Windows 10 / Mac OS Monterey
- Languages : Java JDK 1.11
- Framework : Spring boot 2.6.7 / Mybaits 3.5.9
- IDE : Spring Tool Suite 4 (Eclipse), VS Code
- Web Server : Apache Tomcat 9.0.58
- DataBase : MySQL 8.0.28
- RDS : AWS RDS

**Front-End**
- Languages : HTML5, CSS, JavaScript, Ajax, JSON, jQuery, Bootstrap

**협업 도구**
- Github, Git-Fork (형상 관리 도구)
- ERDCloud (DB ERD 관리 도구)
- Notion (개발 일정 및 협업 관리 도구)
- Miro (와이어프레임)

**사용 API**
- 토스페이 API
- 카카오 주소 API
- 카카오 맵 API
- 카카오페이 API

<br>

## ERD
![ERD](https://user-images.githubusercontent.com/84880772/180791162-823f8bcb-33ef-47ee-92c1-15c40e75d5d1.png)

<br>

## 와이어프레임
![wireframe](https://user-images.githubusercontent.com/84880772/180792079-c98650a5-ee86-45a2-93df-bd14eb93f6f0.jpg)
https://miro.com/app/board/uXjVO2wWYqs=/?share_link_id=416286603373

<br>

## 웹 애플리케이션 아키텍처
![웹 애플리케이션 아키텍처](https://user-images.githubusercontent.com/84880772/192285861-7c90bde2-8768-40d4-872f-70d79afa895a.png)

<br><br>

---

<br>

## 주요 기능

<details>
<summary>주요 기능보기</summary>
<div markdown="1">
<br>
<br>
  
**회원가입 / 로그인**
- 회원가입 후 아이디와 비밀번호를 입력하여 로그인 할 수 있습니다.
- 쿠키 기능을 이용하여 아이디를 저장할 수 있습니다.
- 회원 타입은 일반회원, 음식점 관리자, 사이트 관리자로 구분됩니다.

![login](https://user-images.githubusercontent.com/84880772/180791297-4ea61edc-9908-4fb2-8540-3dbdb61a451c.png)

<br>  

**검색 기능**
- 검색 기능은 크게 일반 검색, 상세 검색으로 나뉩니다.
- 일반 검색은 index 페이지 또는 헤더에서 사용할 수 있습니다
- 지역, 메뉴, 점포명과 같은 키워드를 참조하여 검색합니다.
- 지역을 선택하여 세부적으로 검색도 가능합니다.

- 상세 검색은 각 조건에 맞는 맛집을 찾아주는 기능을 제공합니다.
- 현재 내 위치를 추적하여 검색할 수 있습니다.
- 원하는 메뉴를 입력 후 평점 순, 리뷰 순으로 검색 결과를 정렬할 수 있습니다.
- 카테고리, 해시태그, 노키즈존 및 주차가능과 같은 조건을 걸어 검색할 수 있습니다.

![detailSearch1](https://user-images.githubusercontent.com/84880772/180793031-271e58b9-07a8-4ec4-ba41-990f4b858f4b.png)
![detailSearch2](https://user-images.githubusercontent.com/84880772/180793058-8322b229-3099-4938-86b1-48215076d35c.png)

- 검색이 완료되면 조건에 맞는 음식점이 나타나며 평점과 지도를 통해 해당 음식점의 평판과 위치를 파악할 수 있습니다.

![searchResult](https://user-images.githubusercontent.com/84880772/180793102-0414e8ef-dbfb-4872-bfb6-f473921f574f.png)

<br>

**매장 상세**
- 매장 상세페이지에서는 메뉴와 매장지도 및 리뷰를 확인할 수 있습니다.
- 해당 매장을 위시리스트에 추가 할 수 있습니다.
- 매장 예약 또는 포장 주문을 할 수 있습니다.

![restaurantDetail](https://user-images.githubusercontent.com/84880772/180797257-2a995d5e-9e7b-4a49-9cfb-0aaa8468534c.png)

<br>

**예약페이지**
- 예약페이지에서 원하는 날짜와 시간 그리고 인원을 선택하여 예약할 수 있습니다.
- 예약이 완료되면 음식점 관리자는 예약 내용을 확인 할 수 있습니다.

![reservation](https://user-images.githubusercontent.com/84880772/180797432-649be511-4175-4797-ab24-36d826ea7b29.png)

<br>

**포장페이지**
- 주문하고 싶은 메뉴와 갯수를 선택하여 주문할 수 있습니다.
- 프로모션이 진행 중인 매장은 프로모션 할인을 적용할 수 있습니다.

![packingOrder](https://user-images.githubusercontent.com/84880772/180797448-796afaff-c634-4fbf-8b49-178d6652d37b.png)
  
- 선택한 메뉴에 대한 정보와 총 결제가격을 확인 할 수 있습니다.
- 원하는 결제방식을 선택하여 결제를 진행할 수 있습니다.
  
![order](https://user-images.githubusercontent.com/84880772/180797464-fe5ca4ff-7780-4be5-8cf5-a6da44bd8785.png)

- 토스페이, 카카오페이 또는 무통장입금으로 결제 진행이 가능합니다.
- 결제가 완료되면 주문 정보가 음식점 관리자에게 전달됩니다.
  
![payment](https://user-images.githubusercontent.com/84880772/180801129-b5573f80-db32-4071-9d27-31719364f6f5.png)
  
<br>

**마이페이지**
- 위시리스트, 내 평점, 결제내역, 예약내역 기능
- 회원등급에 따라 매장 관리 페이지 또는 관리자 페이지로 접근이 가능합니다.

![mypage](https://user-images.githubusercontent.com/84880772/180793420-2c671438-c477-4684-b828-e819b40eb927.png)

<br>

**매장 관리 페이지**
- 가게 정보 수정 페이지에서는 검색 시 노출되는 매장의 대표 썸네일을 포함해 매장의 정보와 메뉴를 추가 삭제할 수 있습니다. 또한 매장의 대표 태그를 선택하여 관리가 가능합니다.
- 예약 관리 페이지에서는 매장의 예약 현황 및 방문 상태를 확인하고 관리가 가능합니다.
- 포장 관리 페이지에서는 매장의 포장 주문 현황 및 방문 상태를 확인하고 관리가 가능합니다.

![collage](https://user-images.githubusercontent.com/84880772/180802817-6e1d697b-3471-488e-83b5-980e25f75511.png)

<br>

**관리자 페이지**
- 회원 관련으로는 전체회원관리, 회원변경관리, 블랙리스트 관리가 가능합니다.
- 가게 관련으로는 가게관리, 리뷰에 대한 신고 관리가 가능합니다.
  
![adminpage](https://user-images.githubusercontent.com/84880772/180802967-b99b801d-ad46-4ad0-ba3b-188aa058b81c.png)

</div>
<br/>  
<br/> 
</details>

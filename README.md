식품 전용 온라인 쇼핑몰
============================


[![쩝쩝박사](http://img.youtube.com/vi/EVkqiXxS2N8/0.jpg)](https://youtu.be/EVkqiXxS2N8?t=0s) 
(위의 그림을 클릭 시 프로젝트가 구현되는 영상의 유튜브 링크로 이동합니다)

### 프로젝트 계획 이유
 언택트(Untact) 시대로 불필요한 외부접촉을 피하고 안전하게 식품을 받아볼 수 있는 서비스 구현하고자 식품 전용 온라인 쇼핑몰을 제작하였다.
 
### 기능 설명
 1. 상품 : 손님이 사용하는 기능 (장바구니에 상품 추가, 주문 하기, 문의 및 후기 작성)
 2. 계정 : 손님이 사용하는 기능 (계정 정보 관리 , 주문 관리 수정, 찜리스트)
 3. 관리자 : 관리자가 사용하는 기능 (상품/옵션/카테고리 추가, 업데이트, 삭제, 주문내역 확인 등)
 
 
### [ 상품 기능 ]
---
상품 : 상품을 담고 주문할 수 있고 상품문의 및 상품 후기 작성 할 수 있다.

1. Insert
   * 상품 문의 게시판, 상품 후기 게시판에 글을 추가하는 기능
   * 상품 주문 시 주문한 내용들을 추가할 수 있는 기능
   
2. Select
   * 각 카테고리마다 상품들의 이름, 가격, 평점을 확인할 수 있는 기능
   * 상품 주문 시 주문 상세 조회할 수 있는 기능
   
3. Update
   * 상품 문의 게시판, 상품 후기 게시판에서 상품마다 등록했던 내용을 수정할 수 있는 기능
   * 상품 주문 시 구입한 만큼 재고를 내리고 판매량을 증가할 수 있도록 수정하는 기능
   
4. Delete
   * 상품 문의 게시판, 상품 후기 게시판에서 상품마다 등록했던 내용을 삭제할 수 있는 기능
   * 장바구니에서 담긴 상품을 하나씩 또는 전체를 삭제할 수 있는 기능
   
5. List(All)
    * 전체 메뉴의 카테고리, 이름, 가격, 신상품, 베스트, 알뜰쇼핑을 확인할 수 있는 기능

6. List(category)
    * 원하는 카테고리를 선택하면, 그 카테고리에 있는 메뉴들의 카테고리,이름 ,가격, 평점을 확인할 수 있는 기능
    * 정렬 조건을 선택하여 (신상품순, 낮은가격순, 높은가격순) 카테고리별 상품을 정렬하는 기능
    * 한 페이지에 최대 등록할 수 있는 상품 수 초과 시 다음페이지로 이동시키는 페이징 기능
    
7. Search(menu) 
    * 검색 창에 원하는 단어를 입력하면 입력한 내용이 포함되어 있는 상품들을 출력해주는 기능
    
8. File Upload
    * 상품 문의 등록과 상품 후기 등록에서 이미지 파일을 업로드할 수 있는 기능
    
### [ 계정 기능 ]
---
계정 : 계정 정보 관리, 주문 관리, 찜 리스트 등의 기능을 이용할 수 있도록 구현한다.

1. Insert
   * 회원가입에서 회원 정보를 입력하여 추가하는 기능
   * 계정 정보에 주소 페이지에서 새 배송지를 추가하는 기능
   * 계정의 찜리스트에서 등록된 상품을 장바구니에 추가할 수 있는 기능
   
2. Select
   * 로그인 시 정보 중복 체크를 할 수 있는 기능
   * 회원가입 시 아이디와 이메일을 중복확인을 할 수 있는 기능
   * 이메일 인증을 하기 위해 계정 정보를 확인하기 위한 기능 
   * 메인 화면에서 마이페이지를 누르면 계정 정보를 조회할 수 있는 기능
   * 구글로 로그인 시(SNS) 아이디의 정보를 조회할 수 있는 기능
   * 마이페이지에서 나의 계정 정보를 조회할 수 있는 기능
   * 계정에서 내 주문을 조회할 수 있는 기능

3. Update
   * 계정 정보의 전체적인 내용을 수정할 수 있는 기능
   * 배송지 정보(주소)의 내용을 수정할 수 있는 기능 
   * 추가한 배송지를 기본 배송지로 수정할 수 있는 기능(merge 사용)
   * 비밀번호 찾기에서 이메일로 받은 난수(10자리)로 패스워드를 수정할 수 있는 기능  
   * 비밀번호 찾기에서 이메일 인증 후 입력한 패스워드를 수정할 수 있는 기능
   
4. Delete
   * 계정 메뉴에서 계정 삭제를 클릭 시에 회원 계정 정보가 삭제되는 기능
   * 배송지 주소 페이지에서 삭제를 누르면 삭제되는 기능
   * 계정의 찜리스트에서 등록된 상품를 삭제할 수 있는 기능 
   
5. List(shipping)
    *  배송지를 추가 후, 배송지에 있는 세세한 주소(우편번호, 도로명 주소, 지번 주소, 나머지 주소)를 확인할 수 있는 기능
    

    
### [ 관리자 기능 ]
---

관리자 : 관리자 페이지를 구성하여 상품 및 회원 관리, 고객센터 운영 등의 쇼핑몰 시스템을 전반적으로 관리할 수 있다.

1. Insert
   * 상품 관리의 상품입력에서 상품을 추가하는 기능
   * 공지사항, 자주하는 질문 문의를 추가하는 기능
   * 상품문의, 1대1문의에서 문의에 대한 답변을 등록하는 답변형 게시판 기능
   
2. Select
    * 회원 관리의 각 회원의 상세정보를 조회하는 기능
    * 상품 관리의 각 상품의 상세정보를 조회하는 기능
    * 주문 관리의 각 주문의 상세정보를 조회하는 기능
    * 공지사항, 자주하는 질문, 상품문의, 1대1문의를 하는 기능
   
3. Update
    * 회원 관리의 각 회원의 상세정보를 수정하는 기능
    * 상품 관리의 각 상품의 상세정보를 수정하는 기능
    * 주문 관리의 각 주문의 상세정보를 수정하는 기능
    * 공지사항, 자주하는 질문, 상품문의, 1대1문의를 수정할 수 있는 기능
   
4. Delete
   * 회원관리의 회원들을 삭제할 수 있는 기능
   * 상품관리의 상품들을 삭제할 수 있는 기능
   * 공지사항, 자주하는 질문, 상품문의, 1대1문의의 문의들을 삭제할 수 있는 기능
   
5. List(All)
    * 회원 관리, 상품 관리, 주문 관리를 확인할 수 있는 기능
    * 공지사항, 자주하는 질문, 상품문의, 1대1문의를 확인할 수 있는 기능
    
6. Search(menu) 
    * 상품목록에서 옵션별로 단어나, 알파벳을 입력하면 입력한 내용이 포함되어 있는 메뉴를 출력해주는 기능
    * 공지사항, 자주하는 질문, 1대1문의에서 옵션별로 단어나, 알파벳을 입력하면 입력한 내용이 포함되어 있는 메뉴를 출력해주는 기능
    
7. File Upload
    * 상품 입력에서 상품 이미지를 업로드할 수 있는 기능
    * 공지사항, 자주하는 질문, 상품 문의, 1대1문의에서 파일을 업로드 할 수 있는 기능
    
8. Paging
    * 회원관리의 회원 목록에서 페이지 이동을 할 수 있는 기능
    * 상품관리의 상품 목록에서 페이지 이동을 할 수 있는 기능
    * 공지사항, 자주하는 질문, 상품문의, 1대1문의에서 문의 내용들의 페이지의 이동을 할 수 있는 기능

9. Sort
    * 회원관리의 최신 등록한 회원들을 정렬해주는 기능(desc:내림차순)
    * 상품관리의 최신 등록한 상품들을 정렬해주는 기능(desc:내림차순)
    * 공지사항, 자주하는 질문, 상품문의, 1대1문의에서 문의 내용들을 최신 등록한 순으로 정렬해주는 기능(desc:내림차순)

 



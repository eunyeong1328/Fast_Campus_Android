<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath }"  />
<%
  request.setCharacterEncoding("UTF-8");
%>

<div class="d-flex flex-fill container">

	<!-- MIDDLE -->
	<div id="middle" class="flex-fill">
	
		<div class="page-title bg-transparent b-0">
			<!-- h1 고객센터 -->
			<h1 class="h4 mt-4 mb-0 px-3">고객센터</h1>
		</div>
		
			<div class="clearfix">
				<div role="tabpanel">
				
					<!-- Nav tabs -->
					<div class="container">
						<ul class="nav">
							<li class="tab-link" data-tab="tab-1">
								<a href="notice-tab.do">공지사항</a>
							</li>
							<li class="tab-link" data-tab="tab-2">
								<a href="faq-tab.do">FAQ</a>
							</li>
							<li class="tab-link current" data-tab="tab-3">
								<a href="memberQ-tab.do">1:1 문의</a>
							</li>
						</ul>
			
						<!-- tab-3 -->
						<div id="tab-3" class="tab-content">
							
							<h3 class="joy-table-title">
                                1:1
                                <p>모든 의문... 쩝쩝박사에게!</p>
                            </h3>
							
							<!-- insert form -->
                                <div id="memq-insert">

                                    <form action="memQ-insert.do" method="post" enctype="multipart/form-data">
                                    	<input type="hidden" name="action" value="memQ-insert">
                                        <div class="memq-title">
                                            <p>제목</p>
                                            <div class="category-select">
                                                <select name="qna_category_num">
                                                    <option selected="selected">선택해주세요.</option>
                                                    <option value="1">배송</option>
                                                    <option value="2">반품</option>
                                                    <option value="3">상품</option>
                                                </select>
                                                <input type="text" name="title">
                                            </div>
                                        </div>
                                        <div class="memq-order-num">
                                            <p>주문번호</p>
                                            <input type="number" name="order_num">
                                            <input type="button" value="주문조회">
                                        </div>
                                        <div class="memq-email">
                                            <p>이메일</p>
                                            <input type="text" name="email" placeholder="이메일을 입력하세요">
                                        </div>
                                        <div class="memq-phone">
                                            <p>전화번호</p>
                                            <input type="text" name="phone">
                                        </div>
                                        <div class="memq-contents">
                                            <p>내용</p>
                                            <div>
                                                1:1 문의 작성 전 확인해주세요!<br><br>
                                                반품/환불<br>
                                                - 제품 하자 혹은 이상으로 반품(환불)이 필요한 경우 사진과 함께 구체적인 내용을 남겨주세요.<br><br>
                                                주문취소<br>
                                                - 생산이 시작된 이후에는 취소가 제한되는 점 고객님의 양해 부탁드립니다.<br>
                                                - 일부 상품은 배송 3~4일 전에만 취소 가능합니다.<br><br>
                                                배송<br>
                                                - 배송일 및 배송시간 지정은 불가능합니다.<br><br>
                                                # 전화번호, 이메일, 주소, 계좌번호 등의 상세 개인정보가 문의 내용에 저장되지 않도록 주의해 주시기 바랍니다.<br>
                                            </div>
                                            <textarea name="contents" rows="5" cols="80"></textarea>
                                        </div>
                                        <div class="memq-image">
                                            <p>이미지</p>
                                            <input type="image" name="file">
                                        </div>
                                        <div class="memq-submit">
                                            <input type="submit" value="등록">
                                    		<a href="memberQ-tab.do" class="list">목록</a>
                                        </div>
                                    </form>

                                </div>
                                <!-- insert form end -->
							
						</div>
						<!-- tab-3 end -->

					</div>
					<!-- Nav tabs end-->
				
				</div>
				
			</div>
		
	</div>
	<!-- MiDDLE end -->
		
</div>

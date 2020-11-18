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
								<a href="notice-tab.do?nowTab=tab-1">공지사항</a>
							</li>
							<li class="tab-link" data-tab="tab-2">
								<a href="faq-tab.do?nowTab=tab-2">FAQ</a>
							</li>
							<li class="tab-link" data-tab="tab-3">
								<a href="productQ-tab.do?nowTab=tab-3">상품문의</a>
							</li>
							<li class="tab-link current" data-tab="tab-4">
								<a href="memberQ-tab.do?nowTab=tab-4">1:1 문의</a>
							</li>
						</ul>
			
						<!-- tab-4 -->
						<div id="tab-4" class="tab-content">
							
							<h3 class="joy-table-title">
                                1:1
                                <p>모든 의문... 쩝쩝박사에게!</p>
                            </h3>
							
							<!-- insert form -->
                                <div id="container">

                                    <form action="addMemQ.do" method="post">
                                        <table>
                                            <tr>
                                                <th>제목</th>
                                                <td>
<!--                                                     <select> -->
<!--                                                         <option>선택해주세요.</option> -->
<!--                                                         <option>상품정보문의</option> -->
<!--                                                         <option>배송문의</option> -->
<!--                                                         <option>반품문의</option> -->
<!--                                                         <option>A/S문의</option> -->
<!--                                                         <option>환불문의</option> -->
<!--                                                         <option>주문결제문의</option> -->
<!--                                                         <option>회원정보문의</option> -->
<!--                                                         <option>취소문의</option> -->
<!--                                                         <option>교환문의</option> -->
<!--                                                         <option>기타문의</option> -->
<!--                                                     </select><br> -->
													<input type="text" name="member_id">
                                                    <input type="text" name="title">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    주문번호
                                                </th>
                                                <td>
                                                    <input type="text" name="order_num">
                                                    <input type="button" value="주문조회">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>이메일</th>
                                                <td>
                                                    <input type="text" name="email">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>문자메시지</th>
                                                <td>
                                                    <input type="text" name="phone">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>내용</th>
                                                <td>
                                                    <p>
                                                        1:1 문의 작성 전 확인해주세요!<br><br>
                                                        반품/환불<br>
                                                        - 제품 하자 혹은 이상으로 반품(환불)이 필요한 경우 사진과 함께 구체적인 내용을 남겨주세요.<br><br>
                                                        주문취소<br>
                                                        - 생산이 시작된 이후에는 취소가 제한되는 점 고객님의 양해 부탁드립니다.<br>
                                                        - 일부 상품은 배송 3~4일 전에만 취소 가능합니다.<br><br>
                                                        배송<br>
                                                        - 배송일 및 배송시간 지정은 불가능합니다.<br><br>
                                                        # 전화번호, 이메일, 주소, 계좌번호 등의 상세 개인정보가 문의 내용에 저장되지 않도록 주의해 주시기 바랍니다.<br>
                                                    </p>
                                                    <textarea name="content" rows="5" cols="80"></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>이미지</th>
                                                <td>
                                                    <input type="text" name="image">
                                                </td>
                                            </tr>
                                        </table>
                                        <input type="submit" value="등록">
                                    </form>

                                    <a href="memberQ-tab.do" class="list">목록</a>
							
						</div>
						<!-- tab-4 end -->

					</div>
					<!-- Nav tabs end-->
				
				</div>
				
			</div>
		
	</div>
	<!-- MiDDLE end -->
		
</div>

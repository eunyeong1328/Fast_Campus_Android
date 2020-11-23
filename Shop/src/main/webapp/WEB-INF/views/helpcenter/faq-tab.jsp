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
							<li class="tab-link current" data-tab="tab-2">
								<a href="faq-tab.do">FAQ</a>
							</li>
							<li class="tab-link" data-tab="tab-3">
								<a href="memberQ-tab.do">1:1 문의</a>
							</li>
						</ul>
			
						<!-- tab-2 -->
						<div id="tab-2" class="tab-content">
							
							<h3 class="joy-table-title">
								FAQ
								<p>여러분이 쩝쩝박사에게 자주하는 질문!</p>
							</h3>
							
							<table class="joy-table">
								<thead>
									<tr>
										<th>번호</th>
										<th>카테고리</th>
										<th>제목</th>
									</tr>
								</thead>

								<c:if test="${empty FAQList}">
									<tbody>
										<tr><td colspan="3">데이터가 없습니다.</td></tr>
									</tbody>
								</c:if>
								<c:if test="${not empty FAQList}">
									<c:forEach var="faq" items="${FAQList}">
										<tbody>
											<tr>
												<td>${faq.faq_num}</td>
												<td>
													${faq.qna_category_name}
												</td>
												<td>
													<a href="faq.do?faq_num=${faq.faq_num}&cPage=${paging.nowPage}">
														${faq.title}
													</a>
												</td>
											</tr>
										</tbody>
									</c:forEach>
								</c:if>
							</table>

							<ul class="joy-paging">
								<c:if test="${paging.beginPage == 1}">
									<li><p class="disabled">Prev</p></li>
								</c:if>
								<c:if test="${paging.beginPage != 1}">
									<li>
										<a href="faq-tab.do?cPage=${paging.beginPage - 1 }">Prev</a>
									</li>
								</c:if>
									
								<c:forEach var="pageNo" begin="${paging.beginPage }" end="${paging.endPage }">
									<c:if test="${pageNo == paging.nowPage }">
										<li class="active">${pageNo }</li>
									</c:if>
									<c:if test="${pageNo != paging.nowPage }">
										<li><a href="faq-tab.do?cPage=${pageNo }">${pageNo }</a></li>
									</c:if>
								</c:forEach>
									
								<c:if test="${paging.endPage >= paging.totalPage }">
									<li><p class="disabled">Next</p></li>
								</c:if>
								<c:if test="${paging.endPage < paging.totalPage }">
									<li><a href="faq-tab.do?cPage=${paging.endPage + 1 }">Next</a></li>
								</c:if>
							</ul>
						</div>
						<!-- tab-2 end -->

					</div>
					<!-- Nav tabs end-->
				
				</div>
				
			</div>
		
	</div>
	<!-- MiDDLE end -->
		
</div>

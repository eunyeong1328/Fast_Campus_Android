<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
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

		<!-- Nav tabs -->
		<div class="container">
			<ul class="nav">
				<li class="tab-link"><a href="notice-tab.do">공지사항</a></li>
				<li class="tab-link"><a href="faq-tab.do">FAQ</a></li>
				<li class="tab-link current"><a href="memberQ-tab.do">1:1
						문의</a></li>
			</ul>

			<!-- tab-3 -->
			<div id="tab-3" class="tab-content current">

				<h3 class="joy-table-title">
					1:1 문의
					<p>모든 의문... 쩝쩝박사에게!</p>
					<a class="insert" href="memQ-insert.do">글쓰기</a>
				</h3>

				<table class="joy-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th class="joy-title-text-left">제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>

					<c:if test="${empty MemQList}">
						<tbody>
							<tr>
								<td colspan="5">데이터가 없습니다.</td>
							</tr>
						</tbody>
					</c:if>
					<c:if test="${not empty MemQList}">
						<c:forEach var="memQ" items="${MemQList}">
							<tbody>
								<tr>
									<td>${memQ.r_num}</td>
									<td>${memQ.qna_category_name}</td>
									<c:if test="${memQ.parent_num == 0 }">
										<td class="joy-title-text-left">
											<a href="memQ.do?r_num=${memQ.r_num}&cPage=${paging.nowPage}">${memQ.title }</a>
										</td>
									</c:if>
									<c:if test="${memQ.parent_num != 0 }">
										<td class="joy-title-text-left">
											<a href="memQ.do?r_num=${memQ.r_num}&cPage=${paging.nowPage}">
												<span class="badge badge-soft badge-pill badge-purple">RE</span>
												${memQ.title }
											</a>
										</td>
									</c:if>
									<td>${memQ.member_id}</td>
									<td>${memQ.reg_date}</td>
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
						<li><a href="memberQ-tab.do?cPage=${paging.beginPage - 1 }">Prev</a>
						</li>
					</c:if>

					<c:forEach var="pageNo" begin="${paging.beginPage }"
						end="${paging.endPage }">
						<c:if test="${pageNo == paging.nowPage }">
							<li class="active">${pageNo }</li>
						</c:if>
						<c:if test="${pageNo != paging.nowPage }">
							<li><a href="memberQ-tab.do?cPage=${pageNo }">${pageNo }</a></li>
						</c:if>
					</c:forEach>

					<c:if test="${paging.endPage >= paging.totalPage }">
						<li><p class="disabled">Next</p></li>
					</c:if>
					<c:if test="${paging.endPage < paging.totalPage }">
						<li><a href="memberQ-tab.do?cPage=${paging.endPage + 1 }">Next</a></li>
					</c:if>

				</ul>
			</div>
			<!-- tab-3 end -->

		</div>
		<!-- Nav tabs end-->

	</div>
	<!-- MiDDLE end -->

</div>

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

		<!-- PAGE LIST -->

		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="home">
				<h3 class="joy-table-title">
					FAQ
					<p>여러분이 쩝쩝박사에게 자주하는 질문!</p>
				</h3>
				<div class="joy-board-detail">
					<table class="joy-table-detail">
						<tr>
							<th>제목</th>
							<td colspan="3">${faq.title}</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>JJupJJup</td>
							<th>카테고리</th>
							<td>${faq.qna_category_name}</td>
						</tr>
					</table>
					<div class="detail-contents">
						<p class="contents">${faq.contents}</p>
					</div>
					<div class="prev-next-list">
						<c:if test="${faq.pre_no == 0 }">
							<p class="disabled">이전글</p>
						</c:if>
						<c:if test="${faq.pre_no != 0 }">
							<c:choose>
								<c:when
									test="${(faq.faq_num - 1) == maxPre || faq.faq_num == maxPre}">
									<a
										href="faq.do?faq_num=${faq.faq_num - 1}&cPage=${paging.nowPage}">이전글</a>
								</c:when>
								<c:otherwise>
									<a
										href="faq.do?faq_num=${faq.faq_num - 1}&cPage=${paging.nowPage + 1}">이전글</a>
								</c:otherwise>
							</c:choose>
						</c:if>

						<c:if test="${faq.next_no == 0 }">
							<p class="disabled">다음글</p>
						</c:if>
						<c:if test="${faq.next_no != 0 }">
							<c:choose>
								<c:when test="${maxPre == 0 || (faq.faq_num + 1) == maxPre}">
									<a
										href="faq.do?faq_num=${faq.faq_num + 1}&cPage=${paging.nowPage}">다음글</a>
								</c:when>
								<c:when test="${faq.faq_num == maxPre}">
									<a
										href="faq.do?faq_num=${faq.faq_num + 1}&cPage=${paging.nowPage}">다음글</a>
								</c:when>
								<c:otherwise>
									<a
										href="faq.do?faq_num=${faq.faq_num + 1}&cPage=${paging.nowPage - 1}">다음글</a>
								</c:otherwise>
							</c:choose>
						</c:if>

						<a href="faq-tab.do?cPage=${paging.nowPage }" class="list">목록</a>
					</div>
				</div>
			</div>
		</div>

		<!-- /PAGE LIST -->

	</div>
	<!-- /MIDDLE -->

</div>


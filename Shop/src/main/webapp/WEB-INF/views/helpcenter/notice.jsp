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
					공지사항
					<p>쩝쩝박사의 새로운 소식과 유용한 정보들을 한곳에서 확인하세요.</p>
				</h3>
				<div class="joy-board-detail">
					<table class="joy-table-detail">
						<tr>
							<th>제목</th>
							<td colspan="3">${notice.title}</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td colspan="3">JJupJJup</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td>${notice.reg_date}</td>
							<th>조회수</th>
							<td>${notice.views}</td>
						</tr>
					</table>
					<div class="detail-contents">
						<p class="contents">
							${notice.contents}
						</p>
						<div class="image-box">
							<c:if test="${not empty notice.image1 }">
								<div class="detail-image">
									<img
										src="${contextPath }/board/fileDownload.do?image=${notice.image1}">
								</div>
							</c:if>
							<c:if test="${not empty notice.image2 }">
								<div class="detail-image">
									<img
										src="${contextPath }/board/fileDownload.do?image=${notice.image2}">
								</div>
							</c:if>
							<c:if test="${not empty notice.image3 }">
								<div class="detail-image">
									<img
										src="${contextPath }/board/fileDownload.do?image=${notice.image3}">
								</div>
							</c:if>
						</div>
					</div>
					<div class="prev-next-list">
						<c:if test="${notice.pre_no == 0 }">
							<p class="disabled">이전글</p>
						</c:if>
						<c:if test="${notice.pre_no != 0 }">
							<c:choose>
								<c:when
									test="${(notice.notice_num - 1) == maxPre || notice.notice_num == maxPre}">
									<a href="notice.do?notice_num=${notice.notice_num - 1}&cPage=${paging.nowPage}">이전글</a>
								</c:when>
								<c:otherwise>
									<a
										href="notice.do?notice_num=${notice.notice_num - 1}&cPage=${paging.nowPage + 1}">이전글</a>
								</c:otherwise>
							</c:choose>
						</c:if>

						<c:if test="${notice.next_no == 0 }">
							<p class="disabled">다음글</p>
						</c:if>
						<c:if test="${notice.next_no != 0 }">
							<c:choose>
								<c:when
									test="${maxPre == 0 || (notice.notice_num + 1) == maxPre}">
									<a
										href="notice.do?notice_num=${notice.notice_num + 1}&cPage=${paging.nowPage}">다음글</a>
								</c:when>
								<c:when test="${notice.notice_num == maxPre}">
									<a
										href="notice.do?notice_num=${notice.notice_num + 1}&cPage=${paging.nowPage}">다음글</a>
								</c:when>
								<c:otherwise>
									<a
										href="notice.do?notice_num=${notice.notice_num + 1}&cPage=${paging.nowPage - 1}">다음글</a>
								</c:otherwise>
							</c:choose>
						</c:if>

						<a href="notice-tab.do?cPage=${paging.nowPage }" class="list">목록</a>
					</div>
				</div>
			</div>
		</div>

		<!-- /PAGE LIST -->

	</div>
	<!-- /MIDDLE -->

</div>


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

				<!-- PAGE LIST -->

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="home">
                                <h3 class="joy-table-title">
                                	1:1 문의
                                	<p>모든 의문... 쩝쩝박사에게!</p>
                            	</h3>
                                <div class="joy-board-detail">
                                    <table class="joy-table-detail">
                                        <tr>
                                        	<th>카테고리</th>
                                        	<td>${memQ.qna_category_name}</td>
                                        	<th>작성일</th>
                                        	<td>${memQ.reg_date}</td>
                                        </tr>
                                        <tr>
                                        	<th>제목</th>
                                        	<td>
												${memQ.title }
                                        	</td>
                                        	<th>작성자</th>
                                        	<td>${memQ.member_id }</td>
                                        </tr>
                                    </table>
                                    <div class="detail-contents">
                                        <p class="contents">
                                            ${memQ.contents}
                                        </p>
                                        <div class="image-box">
	                                        <c:if test="${not empty memQ.image1 }">
	                							<div class="detail-image">
	                								<img src="${contextPath }/board/fileDownload.do?image=${memQ.image1}">
	                							</div>
	                						</c:if>
	                						<c:if test="${not empty memQ.image2 }">
	                							<div class="detail-image">
	                								<img src="${contextPath }/board/fileDownload.do?image=${memQ.image2}">
	                							</div>
	                						</c:if>
	                						<c:if test="${not empty memQ.image3 }">
	                							<div class="detail-image">
	                								<img src="${contextPath }/board/fileDownload.do?image=${memQ.image3}">
	                							</div>
	                						</c:if>
                                        </div>
                                    </div>
									<div class="prev-next-list">
										<c:if test="${memQ.pre_no == 0 }">
											<p class="disabled">이전글</p>
										</c:if>
										<c:if test="${memQ.pre_no != 0 }">
											<c:choose>
												<c:when
													test="${(memQ.member_qna_num - 1) == maxPre || memQ.member_qna_num == maxPre}">
													<a
														href="memQ.do?member_qna_num=${memQ.member_qna_num - 1}&cPage=${paging.nowPage}">이전글</a>
												</c:when>
												<c:otherwise>
													<a
														href="memQ.do?member_qna_num=${memQ.member_qna_num - 1}&cPage=${paging.nowPage + 1}">이전글</a>
												</c:otherwise>
											</c:choose>
										</c:if>
				
										<c:if test="${memQ.next_no == 0 }">
											<p class="disabled">다음글</p>
										</c:if>
										<c:if test="${memQ.next_no != 0 }">
											<c:choose>
												<c:when
													test="${maxPre == 0 || (memQ.member_qna_num + 1) == maxPre}">
													<a
														href="memQ.do?member_qna_num=${memQ.member_qna_num + 1}&cPage=${paging.nowPage}">다음글</a>
												</c:when>
												<c:when test="${notice.notice_num == maxPre}">
													<a
														href="memQ.do?member_qna_num=${memQ.member_qna_num + 1}&cPage=${paging.nowPage}">다음글</a>
												</c:when>
												<c:otherwise>
													<a
														href="memQ.do?member_qna_num=${memQ.member_qna_num + 1}&cPage=${paging.nowPage - 1}">다음글</a>
												</c:otherwise>
											</c:choose>
										</c:if>
				
										<a href="memberQ-tab.do?cPage=${paging.nowPage }" class="list">목록</a>
									</div>
								</div>
                            </div>
                        </div>

				<!-- /PAGE LIST -->

			</div>
			<!-- /MIDDLE -->

		</div>


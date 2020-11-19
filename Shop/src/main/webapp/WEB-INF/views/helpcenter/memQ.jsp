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
				<div class="clearfix">
					<div role="tabpanel">

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="home">
                                <h3 class="joy-table-title">
                                	1:1 문의
                                	<p>모든 의문... 쩝쩝박사에게!</p>
                            	</h3>
                                <div class="joy-notice-detail">
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
                                        <p>
                                            ${memQ.contents}
                                        </p>
                                        <div class="detail-image">
                                        	${memQ.image }
                                        </div>
                                    </div>
                                    <div class="prev-next-list">
                                    	<c:if test="${memQ.member_qna_num <= 1}">
                                        	<p class="disabled">이전글</p>
                                    	</c:if>
                                    	<c:if test="${memQ.member_qna_num > 1 }">
                                        	<a href="notice.do?notice_num=${faq.faq_num - 1}">이전글</a>
                                    	</c:if>
                                    	
                                    	<c:if test="${memQ.member_qna_num >= 8 }">
                                        	<p class="disabled">다음글</p>
                                    	</c:if>
                                    	<c:if test="${memQ.member_qna_num < 8 }">
                                        	<a href="memQ.do?member_qna_num=${memQ.member_qna_num + 1}">다음글</a>
                                    	</c:if>
                                    	
                                    	<a href="memQ-update.do?member_qna_num=${memQ.member_qna_num }" class="list">수정</a>
                                        <a href="memberQ-tab.do?nowTab=${paging.nowTab }&cPage=${paging.nowPage }" class="list">목록</a>
                                    </div>
                                </div>
                            </div>
                        </div>

					</div>

				</div>
				<!-- /PAGE LIST -->

			</div>
			<!-- /MIDDLE -->

		</div>


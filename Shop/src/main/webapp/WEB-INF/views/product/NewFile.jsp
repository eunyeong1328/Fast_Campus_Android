>> notice_tab.jsp 고객센터-공지사항 탭 페이지
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"   isELIgnored="false"
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
                     <li class="tab-link current" data-tab="tab-1">
                        <a href="notice-tab.do?nowTab=tab-1">공지사항</a>
                     </li>
                     <li class="tab-link" data-tab="tab-2">
                        <a href="faq-tab.do?nowTab=tab-2">FAQ</a>
                     </li>
                     <li class="tab-link" data-tab="tab-3">
                        상품문의
                     </li>
                     <li class="tab-link" data-tab="tab-4">
                        1:1문의
                     </li>
                  </ul>
                  
                  <!-- tab-1 -->
                  <div id="tab-1" class="tab-content current">

                     <h3 class="joy-table-title">
                        공지사항
                        <p>쩝쩝박사의 새로운 소식과 유용한 정보들을 한곳에서 확인하세요.</p>
                     </h3>
                     
                     <table class="joy-table">
                        <thead>
                           <tr>
                              <th>번호</th>
                              <th>제목</th>
                              <th>작성자</th>
                              <th>작성일</th>
                              <th>조회수</th>
                              </tr>
                        </thead>
                        <c:if test="${empty NoticeList}">
                           <tbody>
                              <tr>
                                 <td colspan="5">등록된 게시글이 없습니다.</td>
                              </tr>
                           </tbody>
                        </c:if>
                        <c:if test="${not empty NoticeList}">
                           <c:forEach var="notice" items="${NoticeList}">
                              <tbody>
                                 <tr>
                                    <td>${notice.notice_num}</td>
                                    <td>
                                       <a href="notice.do?notice_num=${notice.notice_num}&cPage=${paging.nowPage}">
                                          ${notice.title}
                                       </a>
                                    </td>
                                    <td>쩝쩝박사</td>
                                    <td>${notice.reg_date}</td>
                                    <td>${notice.views}</td>
                                 </tr>
                              </tbody>
                           </c:forEach>
                        </c:if>
                     </table>
                  
                     <!-- paging -->
                     <ul class="joy-paging">
                        <c:if test="${paging.beginPage == 1}">
                           <li>
                              <p class="disabled">Prev</p>
                           </li>
                        </c:if>
                        <c:if test="${paging.beginPage != 1}">
                           <li>
                              <a href="notice-tab.do?cPage=${paging.beginPage - 1 }">
                                 Prev
                              </a>
                           </li>
                        </c:if>
                           
                        <c:forEach var="pageNo" begin="${paging.beginPage }" end="${paging.endPage }">
                           <c:if test="${pageNo == paging.nowPage }">
                              <li class="active">${pageNo }</li>
                           </c:if>
                           <c:if test="${pageNo != paging.nowPage }">
                              <li>
                                 <a href="notice-tab.do?cPage=${pageNo }">
                                    ${pageNo }
                                 </a>
                              </li>
                           </c:if>
                        </c:forEach>
                           
                        <c:if test="${paging.endPage >= paging.totalPage }">
                           <li><p class="disabled">Next</p></li>
                        </c:if>
                        <c:if test="${paging.endPage < paging.totalPage }">
                           <li><a href="notice-tab.do?cPage=${paging.endPage + 1 }">Next</a></li>
                        </c:if>
                     </ul>
                     
                  </div>
                  <!-- tab-1 end -->
                  
               </div>
               <!-- Nav tabs end-->
            
            </div>
            
         </div>
      
   </div>
   <!-- MiDDLE end -->
      
</div>
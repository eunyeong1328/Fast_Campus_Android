<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록 </title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<style>
	.mini{
		width: 80px;
		height: 80px;
		margin-right: 60px;
	}
</style>
</head>


			<div id="middle" class="flex-fill">

				<section>
					<a href="${contextPath}/admin/productAdd.do">
						<i class="fas fa-plus"></i>
						상품 추가 페이지 이동
					</a>
					<br><br>
					<table class="table table-align-middle border-bottom mb-6">
						<thead>
							<tr class="text-muted fs--13">
								<th class="w--80 ">번호</th>
								<th class="w--200 ">상품명</th>
								<th class="w--100 ">판매가</th>
								<th class="w--100 ">분류</th>
								<th class="w--100 ">재고</th>
								<th class="w--100 ">판매량</th>
								<th class="w--200 ">등록일</th>
								<th class="w--150 ">비고</th>
								</tr>
						</thead>
						<tbody id="item_list">
							<c:choose>
								<c:when test="${empty list}">
									<tr class="text-muted fs--13">
										<td colspan=8 class="fixed"><strong>조회된 상품이 없습니다.</strong></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${list}" varStatus="item_num">
										<tr class="text-muted fs--13">
											<td>${item_num.count}</td>
											<td>
											<div><img class="mini" src="${contextPath}/resources/images/product/${item.product_id}/${item.product_image}">${item.product_name}</div>
											</td>
											<td>${item.price}</td>
											<td>${item.product_category_name}</td>
											<td>${item.stock}</td>
											<td>${item.sales}</td>
											<td>${item.reg_date}</td>
											<td>
											<a href="${contextPath}/admin/productUpdate.do?product_id=${item.product_id}"><i class="far fa-edit"></i>수정 &nbsp</a>
											<a href="${contextPath}/admin/productDelete.do?product_id=${item.product_id}"><i class="fas fa-trash-alt"></i>삭제 &nbsp</a>
											<a href="${contextPath}/admin/productOption.do?product_id=${item.product_id}"><i class="fas fa-tasks"></i>옵션 관리</a>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>														
													
						</tbody>
						
					</table>
					<!-- 페이징 -->
					<nav aria-label="pagination" class="mt-5">
					<ul
						class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">

						<%--[이전으로] 사용불가 또는 안보이게 : 첫번째 블록인경우 --%>
						<c:if test="${pvo.beginPage == 1}">
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true">Previous</a></li>
						</c:if>
						<c:if test="${pvo.beginPage != 1}">
							<li class="page-item"><a class="page-link"
								href="${contextPath}/admin/productList.do?cPage=${pvo.beginPage - 1 }">Previous</a>
							</li>
						</c:if>

						<%-- 페이지 표시(시작페이지~끝페이지) --%>
						<c:forEach var="pageNo" begin="${pvo.beginPage }"
							end="${pvo.endPage }">
							<c:if test="${pageNo == pvo.nowPage }">
								<li class="page-item active"><a class="page-link" href="#">${pageNo }
										<span class="sr-only"></span>
								</a></li>
							</c:if>
							<c:if test="${pageNo != pvo.nowPage }">
								<li class="page-item" aria-current="page"><a
									class="page-link"
									href="${contextPath}/admin/productList.do?cPage=${pageNo}">${pageNo }</a>
								</li>
							</c:if>
						</c:forEach>

						<%--[다음으로] 사용여부 처리 --%>
						<c:if test="${pvo.endPage >= pvo.totalPage }">
							<li class="page-item disabled"><a class="page-link">다음으로</a>
							</li>
						</c:if>

						<c:if test="${pvo.endPage < pvo.totalPage }">
							<li class="page-item"><a class="page-link"
								href="${contextPath}/admin/productList.do?cPage=${pvo.endPage +1}">Next</a>
							</li>
						</c:if>
					</ul>
				</nav>
				<!-- 페이징 -->
				</section>

			</div>

		
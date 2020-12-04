<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
  request.setCharacterEncoding("UTF-8");
%>

				<!-- MIDDLE -->
				<div id="middle" class="flex-fill">

					<!--

						PAGE TITLE
					-->
					<div class="page-title bg-transparent b-0">

						<h1 class="h4 mt-4 mb-0 px-3 font-weight-normal">PRODUCT Q&A</h1>
						<br>
						<p>
							&nbsp;&nbsp;&nbsp;&nbsp;상품에 대한 문의 내용<br>&nbsp;&nbsp;&nbsp;&nbsp;배송,
					</div>

					<!--
				  	<form novalidate class="bs-validate" method="post" action="${contextPath }/product/addBoardQna.do" enctype="multipart/form-data">
-->
					<form class="bs-validate" method="post"
						action="${contextPath }/admin/productQnaReUpdateForm.do"
						enctype="multipart/form-data">

						<section>

							<div class="row gutters-sm">

								<div class="col-12 col-lg-12 col-xl-8 mb-5">


									<div class="form-label-group mb-3">
										<table style="color: gray;" class="table" width="500px">
											<tbody>
												<tr>
													<th scope="row">작성자</th>
													<td>${qna.member_id }</td>
												</tr>
												<tr>
													<th scope="row">상품 아이디</th>
													<td>${qna.product_id }</td>
												</tr>
												<tr>
													<th scope="row">작성일</th>
													<td>${qna.reg_date }</td>
												</tr>
												<tr>
													<th width="200" scope="row">제목</th>
													<td width="800">${qna.title }</td>
												</tr>
												<tr>
													<th scope="row">내용</th>
													<td>${qna.contents }</td>
												</tr>
												<tr>
													<th scope="row">이미지</th>
													<td> 
														<c:if test="${not empty qna.image1 }">
															<img src="${contextPath }/resources/images/product_qna/${qna.image1}">				
														</c:if>
														<c:if test="${not empty qna.image2 }">
															<img src="${contextPath }/resources/images/product_qna/${qna.image2}">				
														</c:if>
														<c:if test="${not empty qna.image3 }">
															<img src="${contextPath }/resources/images/product_qna/${qna.image3}">				
														</c:if>
													</td>
												</tr>
											</tbody>
										</table>

									</div>
									<input type="hidden" name="member_id" value="${qna.member_id }">
									<input type="hidden" name="product_id" value="${qna.product_id }">
									<input type="hidden" name="title" value="${qna.title }">
									<input type="hidden" name="contents" value="${qna.contents }">
									<input type="hidden" name="product_qna_num" value="${qna.product_qna_num }" />

									

									<br>
									<br> 
									<c:choose>
										<c:when test="${qna.member_id == 'admin'}">
											
												<input type="submit" value="수정하기" class="btn btn-purple btn-soft mb-1" >
											
										</c:when>
										<c:otherwise>
											<a href="${contextPath }/admin/productQnaReForm.do?product_id=${qna.product_id}&parent_num=${qna.product_qna_num}">
												<input type="button" value="답변하기" class="btn btn-purple btn-soft mb-1" >
											</a>
										</c:otherwise>	
									</c:choose>
									
									<input type="button" value="삭제하기" class="btn btn-purple btn-soft mb-1"  >
									
									<a href="${contextPath}/admin/productQnaList.do?">	
									<input type=button value="목록으로" 	 class="btn btn-purple btn-soft mb-1" >
									</a>	


									
								</div>


								

							</div>

						</section>

					</form>

				</div>
				<!-- /MIDDLE -->


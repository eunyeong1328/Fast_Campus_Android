<%@page import="com.project.shop.product.impl.ProductDAO"%>
<%@page import="com.project.shop.product.Paging"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
  request.setCharacterEncoding("UTF-8");

%>

<!--여기서부터 시작-->
<!-- PAGE TITLE -->
<section class="bg-light p-0">
	<div class="container py-5">

		<h1 class="h3">${product_category_name}</h1>

		<nav aria-label="breadcrumb">
			<ol class="breadcrumb fs--14">
				<li class="breadcrumb-item"><a
					href="${contextPath}/main/main.do">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">${product_category_name}</li>
			</ol>
		</nav>

	</div>
</section>
<!-- /PAGE TITLE -->

<section>
	<div class="container">

		<div class="row">

			<!-- sidebar -->
			<div class="order-1 col-12 col-sm-12 col-md-12 col-lg-3 mb--60">


				<!-- CATEGORIES -->
				<nav
					class="nav-deep nav-deep-light mb-4 border b-0-xs px-4 pb-3 p-0-md p-0-xs rounded">

					<!-- mobile trigger : categories -->
					<button
						class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
						data-target="#nav_responsive"
						data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
						<span class="group-icon px-2 py-2 float-start"> <i
							class="fi fi-bars-2"></i> <i class="fi fi-close"></i>
						</span> <span class="h5 py-2 m-0 float-start"> Categories </span>
					</button>

					<!-- desktop only -->
					<h5 class="h6 pt-3 pb-3 m-0 d-none d-lg-block">Categories</h5>


					<!-- navigation -->
					<ul id="nav_responsive" class="nav flex-column d-none d-lg-block">

						<li class="nav-item"><a class="nav-link px-0"
							href="${contextPath}/product/productList.do?product_category_num=1">

								<!-- <span class="badge badge-warning float-end pl--3 pr--3 pt--2 pb--2 fs--11 mt-1">
												New in stock
											</span> --> <i class="fi fi-arrow-end m-0 fs--12"></i> <span
								class="px-2 d-inline-block"> 육류 </span>
						</a></li>

						<li class="nav-item"><a class="nav-link px-0"
							href="${contextPath}/product/productList.do?product_category_num=2">
								<i class="fi fi-arrow-end m-0 fs--12"></i> <span
								class="px-2 d-inline-block"> 채소 </span>
						</a></li>

						<li class="nav-item"><a class="nav-link px-0"
							href="${contextPath}/product/productList.do?product_category_num=3">
								<i class="fi fi-arrow-end m-0 fs--12"></i> <span
								class="px-2 d-inline-block"> 베이커리 </span>
						</a></li>

						<li class="nav-item"><a class="nav-link px-0" href="#!">
								<i class="fi fi-arrow-end m-0 fs--12"></i> <span
								class="px-2 d-inline-block"> 추가예정1 </span>
						</a></li>

						<li class="nav-item"><a class="nav-link px-0" href="#"> <span
								class="group-icon"> <i class="fi fi-arrow-end"></i> <i
									class="fi fi-arrow-down"></i>
							</span> <span class="px-2 d-inline-block"> 추가예정2 </span>
						</a>

							<ul class="nav flex-column px-3">
								<li class="nav-item"><a class="nav-link" href="#">
										Option 1 </a></li>
								<li class="nav-item"><a class="nav-link" href="#">
										Option 2 </a></li>
								<li class="nav-item"><a class="nav-link" href="#">
										Option 3 </a></li>
							</ul></li>

					</ul>

				</nav>
				<!-- /CATEGORIES -->

			</div>
			<!-- /sidebar -->



			<!-- products -->
			<div class="order-2 col-12 col-sm-12 col-md-12 col-lg-9">


				<!-- additional filters -->
				<div class="bg-light mb-5 p-3 rounded clearfix">

					<div class="clearfix border-bottom pb-3 mb-3">

						<div class="float-start fs--14 position-relative mt-1"></div>

						<div class="float-end fs--14 position-relative mt-1">
							<a href="#" class="text-primary text-decoration-none"
								data-toggle="dropdown" aria-expanded="false"> ${sortby } <i
								class="fi fi-arrow-down-slim fs--12"></i>
							</a>

							<ul class="dropdown-menu b-0 mt-3 rounded fs--15">
								<li class="dropdown-item active"><a
									href="${contextPath}/product/productList.do?product_category_num=${product_category_num }&listKey=reg_date&orderKey=desc"
									class="text-muted py-2 d-block">신상품순</a></li>
								<li class="dropdown-item"><a
									href="${contextPath}/product/productList.do?product_category_num=${product_category_num }&listKey=price&orderKey=asc"
									class="text-muted py-2 d-block">낮은가격순</a></li>
								<li class="dropdown-item"><a
									href="${contextPath}/product/productList.do?product_category_num=${product_category_num }&listKey=price&orderKey=desc"
									class="text-muted py-2 d-block">높은가격순</a></li>
							</ul>
						</div>

					</div>

					<!--  
								<h2 class="h6 mb-0">
									1,381 total items
								</h2>
								-->
				</div>
				<!-- /additional filters -->



				<!-- product list -->

				<div class="row gutters-xs--xs">

					<c:forEach var="item" items="${productList}">
						<!-- item -->

						<div class="col-6 col-md-4 mb-4 mb-2-xs">

							<div
								class="bg-white border rounded show-hover-container p-2 h-100">

								<!-- hover buttons : top -->
								<div
									class="position-absolute top-0 end-0 text-align-end w--80 z-index-3 my-3 mx-4 px-2 show-hover-item">

									<!-- add to favourite : not logged in -->
									<!--
											<a href="#" class="js-ajax-modal btn bg-white shadow-lg btn-sm rounded-circle mb-2"
											    data-href="_ajax/modal_signin_md.html"
											    data-ajax-modal-size="modal-md"
											    data-ajax-modal-centered="false"
											    data-ajax-modal-backdrop="static">
											    <i class="fi fi-heart-slim"></i>
											</a>
											-->

									<!-- add to favourite : logged in -->
									
									<a href="#"
										class="btn-toggle btn bg-white shadow-lg btn-sm rounded-circle mb-2"
										data-toggle="tooltip" data-original-title="add to favourite"
										data-placement="left"
										data-toggle-ajax-url-on="demo.files/php/demo.ajax_request.php?product_id=1&amp;action=add_to_favourite"
										data-toast-success-message="Added to your favourite!"
										data-toast-success-position="bottom-center"> <i
										class="fi fi-heart-slim"></i>
									</a> <a href="#"
										class="btn bg-white shadow-lg btn-sm rounded-circle mb-2"
										title="" data-toggle="tooltip" data-placement="left"
										data-original-title="add to compare"> <i
										class="fi fi-graph"></i>
									</a> <a href="#"
										class="btn btn-danger shadow-lg btn-sm rounded-circle mb-2"
										title="" data-toggle="tooltip" data-placement="left"
										data-original-title="add to cart"> <i class="fi fi-cart-1"></i>
									</a>
								</div>
								<!-- /hover buttons : top -->


								<a
									href="${contextPath}/product/productDetail.do?product_id=${item.product_id}"
									class="d-block text-decoration-none">

									<figure class="m-0 text-center">
										<img class="img-fluid"
											src="${contextPath}/product/thumbnails.do?product_id=${item.product_id }&product_image=${item.product_image }"
											alt="상품이미지">
									</figure> <span class="d-block text-center-xs text-gray-600 py-3">

										<!-- 
													.max-height-50  = limited to 2 rows of text 
													-or-
													.text-truncate
												--> <span class="d-block fs--16 max-h-50 overflow-hidden">
											${item.product_name} </span> <!-- price --> <span
										class="d-block text-danger font-weight-medium fs--16 mt-2">

											<!-- <del class="text-muted">$220<sup>00</sup></del>  --> <del
												class="text-muted">
												<fmt:formatNumber type="number" value="${item.price}" />
												원
											</del> <!-- $173<sup>00</sup> --> <fmt:formatNumber type="number"
												value="${item.sale_price}" />원


									</span> <!-- rating --> <span class="d-block"> <i
											class="rating-5 text-warning fs--14"></i> <span
											class="fs--12 text-muted">(4.7)</span>
									</span>

								</span>

								</a>

							</div>

						</div>
					</c:forEach>
					<!-- /item -->



				</div>
				<!-- /products -->


				<!-- pagination -->
				<div>
					<nav aria-label="pagination" class="mt-5">
						<ul
							class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">
							<%--[이전으로] 사용불가 또는 안보이게 : 첫번째 블록인경우 --%>
							<c:if test="${pvo.beginPage == 1}">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
							</c:if>
							<c:if test="${pvo.beginPage != 1}">
								<li class="page-item"><a class="page-link"
									href="${contextPath}/product/productList.do?product_category_num=${product_category_num }&cPage=${pvo.beginPage - 1 }">Previous</a>
								</li>
							</c:if>

							<%-- 페이지 표시(시작페이지~끝페이지) --%>
							<c:forEach var="pageNo" begin="${pvo.beginPage }"
								end="${pvo.endPage }">
								<c:if test="${pageNo == pvo.nowPage }">
									<li class="page-item active"><a class="page-link" href="#">${pageNo }
											<span class="sr-only">??</span>
									</a></li>
								</c:if>
								<c:if test="${pageNo != pvo.nowPage }">
									<li class="page-item" aria-current="page"><a
										class="page-link"
										href="${contextPath}/product/productList.do?product_category_num=${product_category_num}&cPage=${pageNo}">${pageNo }</a>
									</li>
								</c:if>
							</c:forEach>

							<%--[다음으로] 사용여부 처리 --%>
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="page-item disabled"><a class="page-link">다음으로
								</a></li>
							</c:if>

							<c:if test="${pvo.endPage < pvo.totalPage }">

								<li class="page-item"><a class="page-link"
									href="${contextPath}/product/productList.do?product_category_num=${product_category_num}&cPage=${pvo.endPage +1}">Next</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
				<!-- pagination -->
			</div>

		</div>
</section>
<!-- / -->

<script src="${contextPath}/resources/assets/js/core.min.js"></script>

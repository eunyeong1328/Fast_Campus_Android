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

		<div id="wrapper">

			<!-- PAGE TITLE -->
			<section class="bg-light p-0">
				<div class="container py-5">

					<h1 class="h3">
						찜 리스트
					</h1>

					<nav aria-label="breadcrumb">
						<ol class="breadcrumb fs--14">
							<li class="breadcrumb-item"><a href="${contextPath}/main/main.do">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">찜 리스트</li>
						</ol>
					</nav>

				</div>
			</section>
			<!-- /PAGE TITLE -->




			<!-- -->
			<section>
				<div class="container">

					<div class="row">

						<div class="col-12 col-sm-12 col-md-12 col-lg-3 mb--60">

							<nav class="sticky-kit nav-deep nav-deep-light">

								<!-- mobile only -->
								<button class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none" data-target="#nav_responsive" data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
									<span class="group-icon px-2 py-2 float-start">
										<i class="fi fi-bars-2"></i>
										<i class="fi fi-close"></i>
									</span>

									<span class="h5 py-2 m-0 float-start">
										Account Menu
									</span>
								</button>

								<!-- desktop only -->
								<h5 class="pt-3 pb-3 m-0 d-none d-lg-block">
									계정 메뉴
								</h5>


								<!-- navigation -->
								<ul id="nav_responsive" class="nav flex-column d-none d-lg-block">

									<li class="nav-item">
										<a class="nav-link px-0" href="${contextPath}/myaccount/account-orders.do">
											<i class="fi fi-arrow-end m-0 fs--12"></i> 
											<span class="px-2 d-inline-block">
												내 주문
											</span>
										</a>
									</li>

									<li class="nav-item active">
										<a class="nav-link px-0" href="${contextPath}/myaccount/account-favourites.do">
											<i class="fi fi-arrow-end m-0 fs--12"></i> 
											<span class="px-2 d-inline-block">
												찜 리스트
											</span>
										</a>
									</li>

									<li class="nav-item">
										<a class="nav-link px-0" href="${contextPath}/myaccount/account-settings.do">
											<i class="fi fi-arrow-end m-0 fs--12"></i> 
											<span class="px-2 d-inline-block">
												마이 페이지
											</span>
										</a>
									</li>

									<li class="nav-item">
										<a class="nav-link px-0" href="#">
											<span class="group-icon">
												<i class="fi fi-arrow-end"></i>
												<i class="fi fi-arrow-down"></i>
											</span>

											<span class="px-2 d-inline-block">
												Multi level
											</span>
										</a>

										<ul class="nav flex-column px-3">
											<li class="nav-item">
												<a class="nav-link" href="#">
													Option 1
												</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#">
													Option 2
												</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#">
													Option 3
												</a>
											</li>
										</ul>

									</li>

									<li class="nav-item">
										<a class="nav-link px-0" href="${contextPath}/member/logout.do">
											<i class="fi fi-power"></i> 
											로그아웃
										</a>
									</li>

								</ul>

							</nav>

						</div>


				<div class="col-12 col-sm-12 col-md-12 col-lg-9">


					<!-- item -->
					<c:forEach var="favList" items="${favList }" begin="0" end="3">
						<div
							class="clearfix p-3 shadow-xs shadow-md-hover mb-3 rounded bg-white">

							<div class="row col-border">

								<!-- image -->
								<div class="col-5 col-sm-3 col-md-3 col-lg-2 text-center">
									<a class="text-decoration-none"> <img
										class="img-fluid bg-suprime"
										src="${contextPath}/resources/images/item_image/${favList.product_image}"
										alt="...">
									</a>
								</div>

								<!-- detail -->
								<div class="col-7 col-sm-5 col-md-4 col-lg-6 bordered-start">

									<a class="fs--16 text-dark font-weight-medium" href="${contextPath}/product/productDetail.do?product_id=${favList.product_id}">
										<c:out value="${favList.product_name}" />
										</a>

									<div class="fs--14 mb--10 clearfix">
										<i class="rating-5 text-warning fs--14 float-start mt--3"></i>
										<span class="text-muted">6 reviews</span>
									</div>

									<div class="mt-2">

										<p class="fs--13 text-muted mb-0">
											<del><c:out value="${favList.price}" />원</del>											
										</p>

										<p class="fs--18 font-weight-medium mb-0 ">
										<fmt:parseNumber value="${favList.price*((100-favList.discount)/100)}"/>원
										</p>

									</div>

								</div>

								<div class="col-12 d-block d-sm-none mt-3">
									<!-- mobile spacer -->
								</div>

								<!-- buttons -->
								<div
									class="col-12 col-sm-4 col-md-4 col-lg-4 text-align-end text-align-center-xs b-0">

									<button type="submit"
										class="btn btn-sm btn-primary fs--14 w-100-xs d-block-xs">
										Add to cart</button>

									<div class="clearfix mt-2">
										<a href="#!" data-href="#?action=delete&amp;item_id=1"
											data-ajax-confirm-mode="regular"
											data-ajax-confirm-size="modal-md"
											data-ajax-confirm-centered="false"
											data-ajax-confirm-title="Please Confirm"
											data-ajax-confirm-body="Are you sure? Remove from favourites?"
											data-ajax-confirm-btn-yes-class="btn-sm btn-danger"
											data-ajax-confirm-btn-yes-text="Yes, Remove"
											data-ajax-confirm-btn-yes-icon="fi fi-check"
											data-ajax-confirm-btn-no-class="btn-sm btn-light"
											data-ajax-confirm-btn-no-text="Cancel"
											data-ajax-confirm-btn-no-icon="fi fi-close"
											data-ajax-confirm-callback-function=""
											class="js-ajax-confirm btn btn-sm btn-light d-block-xs font-regular fs--14 w-100-xs d-block-xs">
											Remove </a>

									</div>

								</div>

							</div>

						</div>
						<!-- /item -->

					</c:forEach>





					<!-- pagination -->
					<nav aria-label="pagination" class="mt-5">
						<ul
							class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">

							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true">Previous</a></li>

							<li class="page-item active"><a class="page-link" href="#">1
									<span class="sr-only">(current)</span>
							</a></li>

							<li class="page-item" aria-current="page"><a
								class="page-link" href="#">2</a></li>

							<li class="page-item"><a class="page-link" href="#">3</a></li>

							<li class="page-item"><a class="page-link" href="#">Next</a>
							</li>

						</ul>
					</nav>
					<!-- pagination -->



				</div>

			</div>

				</div>
			</section>
			<!-- / -->



		<script src="${contextPath}/resources/assets/js/core.js"></script>

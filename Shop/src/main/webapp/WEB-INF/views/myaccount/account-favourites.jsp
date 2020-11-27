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

				<c:choose>
				<c:when test="${empty favList }">
					<div class="container">

					<div class="row">

						<div class="col-12 col-md-8 col-lg-9 order-md-1 mb-5">

							<div class="text-center mb-5">
	
								<h1 class="mb--80">
									찜 리스트가 존재하지 않습니다.
								</h1>

								<img class="img-fluid max-w-350" src="${contextPath}/resources/demo.files/svg/ecommerce/undraw_empty_cart_co35.svg" alt="..." style="margin-bottom:50px">
								<br>
								<a href="#!" class="badge badge-pill badge-purple badge-soft font-weight-normal p-2">
									쇼핑하러 가기
								</a>

							</div>

						</div>
				
				</c:when>
				<c:otherwise>
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
										장바구니에 추가</button>

									<div class="clearfix mt-2">
										<a href="#!"
										data-href="${contextPath}/myaccount/deleteFav.do?product_id=${favList.product_id}"
											data-ajax-confirm-mode="regular"
											data-ajax-confirm-size="modal-md"
											data-ajax-confirm-centered="false"
											data-ajax-confirm-title="삭제 확인"
											data-ajax-confirm-body="이 제품을 찜 리스트에서 삭제하시겠습니까?"
											data-ajax-confirm-btn-yes-class="btn-sm btn-danger"
											data-ajax-confirm-btn-yes-text="네"
											data-ajax-confirm-btn-yes-icon="fi fi-check"
											data-ajax-confirm-btn-no-class="btn-sm btn-light"
											data-ajax-confirm-btn-no-text="아니오"
											data-ajax-confirm-btn-no-icon="fi fi-close"
											data-ajax-confirm-callback-function='function(){windWow.location.href = "${contextPath}/myaccount/account-favourites.do";}'
											class="js-ajax-confirm btn btn-sm btn-light d-block-xs font-regular fs--14 w-100-xs d-block-xs">
											삭제 </a>

									</div>

								</div>

							</div>

						</div>
						<!-- /item -->

					</c:forEach>					

				
				</c:otherwise>
				
				</c:choose>


				</div>

			</div>

				</div>
			</section>
			<!-- / -->



		<script src="${contextPath}/resources/assets/js/core.js"></script>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>


			<!-- PAGE TITLE -->
			<section class="bg-light p-0">
				<div class="container py-5">

					<h1 class="h3">
						주문 상세
					</h1>

					<nav aria-label="breadcrumb">
						<ol class="breadcrumb fs--14">
							<li class="breadcrumb-item"><a href="${contextPath }/main/main.do">Home</a></li>
							<li class="breadcrumb-item"><a href="${contextPath }/myaccount/account-orders.do">내 주문</a></li>
							<li class="breadcrumb-item active" aria-current="page">주문 상세</li>
						</ol>
					</nav>

				</div>
			</section>
			<!-- /PAGE TITLE -->




			<!-- -->
			<section>
				<div class="container">

					<div class="row">

<!-- 네비게이션 자리 -->


						<div class="col-12 col-sm-12 col-md-12 col-lg-9">

							<!-- ORDER INFO -->
							<div class="p-4 shadow-xs border rounded mb-4">
								
								<div class="row">

									<div class="col-12 col-sm-6 col-md-6 col-lg-6">

										<h2 class="fs--18 mb-0">
											주문 #imp_526324180397
										</h2>

										<p>
											November 23, 2018, 11:38
										</p>

										<p class="mb-0">
											Status:

											<span class="text-warning">
												Pending / New
											</span>
										</p>

									</div>


									<div class="col-12 col-sm-6 col-md-6 col-lg-6">

										<a href="#" 
											data-href="#?action=cancel&amp;order_id=1009" 
											data-ajax-confirm-mode="regular" 
											data-ajax-confirm-size="modal-md" 
											data-ajax-confirm-centered="false" 
											data-ajax-confirm-title="Please Confirm" 
											data-ajax-confirm-body="Are you sure you want to cancel this order?" 
											data-ajax-confirm-btn-yes-class="btn-sm btn-danger" 
											data-ajax-confirm-btn-yes-text="Yes, Cancel" 
											data-ajax-confirm-btn-yes-icon="fi fi-check" 
											data-ajax-confirm-btn-no-class="btn-sm btn-light" 
											data-ajax-confirm-btn-no-text="No" 
											data-ajax-confirm-btn-no-icon="fi fi-close" 
											class="js-ajax-confirm float-end float-none-xs m-0 btn btn-sm btn-light fs--14 mb-0 mt-2">

											주문 취소하기
<!-- 											
											<span class="text-muted fs--12 d-block">
												29 min. remaining
											</span> -->

										</a>

									</div>

								</div>

							</div>
							<!-- /ORDER INFO -->



							<!-- ORDER PERSONAL DETAIL -->
							<div class="p-4 shadow-xs rounded mb-4">

								<div class="row row-grid b-0">

									
									<div class="col-12 col-sm-6 col-md-4 col-lg-6">

										<div class="px-3 pb-3">

											<h6 class="mb-4 mt-2 text-primary">
												배송 <span class="font-weight-normal">정보</span>
											</h6>

											<label class="text-dark d-block m-0">주문자 이름</label>
											<p>
												John Doe
												<span class="d-block fs--13 text-muted">(+01) 555-5555</span>
											</p>

											
											<label class="text-dark d-block m-0">주소</label>
											<p>
												Road 741, No.44 <br>
												United States <br>
												New York <br>
												500096<br>
											</p>

											<label class="text-dark d-block m-0">이메일</label>
											<p>
												Smarty Inc.
											</p>

										</div>

									</div>

									<div class="col-12 col-sm-12 col-md-4 col-lg-6 br-0">

										<div class="px-3 pb-3">

											<h6 class="mt-2 text-primary">
												거래 정보
											</h6>

											<!-- not needed/required -->
											<!--
											<div class="mt-3">
												<span class="d-block text-muted">Name:</span>
												John Doe
											</div>
											-->

											<div class="mt-3">
												<label class="text-dark d-block m-0">카드사 승인번호:</label>
												<span class="text-muted">000</span>
											</div>

											<div class="mt-3">
												<label class="text-dark d-block m-0">결제 승인시각:</label>
												<span class="text-muted">00</span>
											</div>

											<div class="mt-3">
												<label class="text-dark d-block m-0">결제방법:</label>
												<span class="text-muted">카카오페이</span>
											</div>


										</div>

									</div>


								</div>

								<div class="text-muted mt-4">
									<span class="font-weight-medium">요청사항:</span>

									– –

								</div>
								<!-- customer detail -->

							</div>
							<!-- /ORDER PERSONAL DETAIL -->



							<!-- ITEMS -->
							<div class="p-4 shadow-xs rounded mb-4">


								<!-- item -->
								<div class="row">

									<div class="col-3 col-sm-2 col-md-2 col-lg-2 text-center">
										
										<a class="d-block clearfix" href="#!">
											<img class="img-fluid" src="demo.files/images/unsplash/products/thumb_330/imani-clovis-LxVxPA1LOVM-unsplash-min.jpg" alt="...">
										</a>

									</div>

									<div class="col">

										<div class="row">
											<div class="col">

												<a class="d-block clearfix" href="#!">
													Product title here
												</a>

												<span class="d-block text-muted fs--13">SKU-NIKEY</span>

											</div>

											<div class="col-12 col-md-4 text-align-end text-start-xs">
												$548.50 

												<del class="text-muted d-block fs--14">
													$992.5
												</del>
											</div>

										</div>

									</div>
								</div>
								<!-- /item -->


								<hr>




								<div class="row">
									<div class="offset-sm-6 offset-md-6 offset-lg-7 col-12 col-sm-6 col-md-6 col-lg-5">

										<div class="clearfix">
											Shipping:
											<span class="float-end text-align-end">
												$120.00
											</span>
										</div>

										<hr>

										<div class="clearfix">
											<h5 class="float-start">
												Total:
											</h5>
											<h5 class="float-end">
												$2916.45 
											</h5>
										</div>

									</div>
								</div>


								<hr>


								<div class="text-success text-align-end text-center-xs px-3">

									Congratulations John, you saved: <b>$697.00</b> 

									<!-- show percent on saved more than 10% -->
									<span class="font-light">(20%)</span>

								</div>


							</div>
							<!-- /ITEMS -->



						</div>

					</div>

				</div>
			</section>
			<!-- / -->
				<script src="${contextPath}/resources/assets/js/core.min.js"></script>
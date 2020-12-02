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

					<h1 class="h3">내 주문</h1>

					<nav aria-label="breadcrumb">
						<ol class="breadcrumb fs--14">
							<li class="breadcrumb-item"><a href="${contextPath}/main/main.do">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">내 주문</li>
						</ol>
					</nav>

				</div>
			</section>
			<!-- /PAGE TITLE -->

			<!-- -->
			<section>
				<div class="container">

					<div class="row">

				<jsp:include page="/WEB-INF/views/myaccount/account-navi.jsp" />


						<div class="col-12 col-sm-12 col-md-12 col-lg-9">

							<div class="clearfix mb-5">

								<!-- Order Period -->
								<select
									class="form-control b-0 bg-light bs-select w--250 w-100-xs float-start float-none-xs mb-2"
									data-style="bg-light select-form-control" title="주문 기간"
									data-header="Order Period"
									onchange="window.location=this.value">
									<option value="#">All (12)</option>
									<option value="?filter_order_period=1">Last 3 months</option>
									<option value="?filter_order_period=2">Last 6 months</option>
									<option value="?filter_order_period=2019">Year 2019</option>
								</select>

								<!-- Order Status -->
								<select
									class="form-control b-0 bg-light bs-select w--250 w-100-xs float-start float-none-xs mb-2"
									data-style="bg-light select-form-control" title="주문 상태"
									data-header="Order Status"
									onchange="window.location=this.value">
									<option value="#">Any</option>
									<option value="?filter_order_status=1">Completed</option>
									<option value="?filter_order_status=2">Canceled</option>
									<option value="?filter_order_status=3">Refunded</option>
								</select>

							</div>

							<!-- order -->
							<c:forEach var="orderList" items="${orderList }" begin="0">
							<div
								class="clearfix p-3 shadow-xs shadow-md-hover mb-3 rounded bg-white">

								<h2 class="fs--18">
									<a href="${contextPath }/myaccount/account-order-detail.do" class="float-end fs--12">
										주문 상세보기 </a> <a href="${contextPath }/myaccount/account-order-detail.do"
										class="text-dark"> 주문 # ${orderList.order_num } </a>
								</h2>

								<p class="mb-0 fs--14">주문일: ${orderList.order_date } |
									결제금액: ${orderList.totalPrice} </p>

								<p class="mb-0 fs--14">
									상태:&nbsp; <span class="text-warning font-weight-normal">${orderList.order_status }</span>
								</p>

							</div>
							</c:forEach>
							<!-- /order -->



							<!-- order -->
							<div
								class="clearfix p-3 shadow-xs shadow-md-hover mb-3 rounded bg-white">

								<h2 class="fs--18">
									<a href="account-order-detail.html" class="float-end fs--12">
										ORDER DETAIL </a> <a href="account-order-detail.html"
										class="text-dark"> Order #1123 </a>
								</h2>

								<p class="mb-0 fs--14">Date: November 23, 2019, 11:38 |
									Total: $2796.45</p>

								<p class="mb-0 fs--14">
									Status:&nbsp; <span class="text-info font-weight-normal">Refunded</span>
								</p>

							</div>
							<!-- /order -->



							<!-- order -->
							<div
								class="clearfix p-3 shadow-xs shadow-md-hover mb-3 rounded bg-white">

								<h2 class="fs--18">
									<a href="account-order-detail.html" class="float-end fs--12">
										ORDER DETAIL </a> <a href="account-order-detail.html"
										class="text-dark"> Order #1009 </a>
								</h2>

								<p class="mb-0 fs--14">Date: November 23, 2019, 11:38 |
									Total: $2796.45</p>

								<p class="mb-0 fs--14">
									Status:&nbsp; <span class="text-danger font-weight-normal">Canceled</span>
								</p>

							</div>
							<!-- /order -->




							<!-- order -->
							<div
								class="clearfix p-3 shadow-xs shadow-md-hover mb-3 rounded bg-white">

								<h2 class="fs--18">
									<a href="account-order-detail.html" class="float-end fs--12">
										ORDER DETAIL </a> <a href="account-order-detail.html"
										class="text-dark"> Order #987 </a>
								</h2>

								<p class="mb-0 fs--14">Date: November 23, 2019, 11:38 |
									Total: $2796.45</p>

								<p class="mb-0 fs--14">
									Status:&nbsp; <span class="text-success font-weight-normal">Completed</span>
								</p>

							</div>
							<!-- /order -->



							<!-- pagination -->
							<nav aria-label="pagination" class="mt-5">
								<ul
									class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">

									<li class="page-item disabled"><a class="page-link"
										href="#" tabindex="-1" aria-disabled="true">Previous</a></li>

									<li class="page-item active"><a class="page-link" href="#">1
											<span class="sr-only">(current)</span>
									</a></li>

									<li class="page-item" aria-current="page"><a
										class="page-link" href="#">2</a></li>

									<li class="page-item"><a class="page-link" href="#">3</a>
									</li>

									<li class="page-item"><a class="page-link" href="#">Next</a>
									</li>

								</ul>
							</nav>
							<!-- pagination -->



						</div>

					</div>

				</div>
			</section>
		
		
		<!-- INFO BOX -->
			<section class="bg-light py-0">
				<div class="container py-3">

					<div class="row">

						<div class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs">

							<div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
								<img width="60" height="60" src="${contextPath}/resources/demo.files/svg/ecommerce/money_bag.svg" alt="...">
							</div>

							<div class="my-2">
								
								<h2 class="font-weight-medium fs--20 mb-0">
									최저가 보장
								</h2>

								<p class="m-0">
									30-days money back
								</p>

							</div>

						</div>

						<div class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs border-dashed border-light bw--1 bt-0 br-0 bb-0 b--0-lg">

							<div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
								<img width="60" height="60" src="${contextPath}/resources/demo.files/svg/ecommerce/free-delivery-truck.svg" alt="...">
							</div>

							<div class="my-2">
								
								<h2 class="font-weight-medium fs--20 mb-0">
									무료배송
								</h2>

								<p class="m-0">
									Shipping is on us
								</p>

							</div>

						</div>

						<div class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs border-dashed border-light bw--1 bl-0 br-0 bb-0 b--0-lg">

							<div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
								<img width="60" height="60" src="${contextPath}/resources/demo.files/svg/ecommerce/24-hours-phone-service.svg" alt="...">
							</div>

							<div class="my-2">
								
								<h2 class="font-weight-medium fs--20 mb-0">
									고객센터
								</h2>

								<p class="m-0">
									24/24 available
								</p>

							</div>

						</div>

						<div class="col-6 col-lg-3 p--15 d-flex d-block-xs text-center-xs border-dashed border-light bw--1 bb-0 br-0 b--0-lg">

							<div class="pl--10 pr--20 fs--50 line-height-1 pt--6">
								<img width="60" height="60" src="${contextPath}/resources/demo.files/svg/ecommerce/handshake.svg" alt="...">
							</div>

							<div class="my-2">
								
								<h2 class="font-weight-medium fs--20 mb-0">
									품질보장
								</h2>

								<p class="m-0">
									Quality guaranteed
								</p>

							</div>

						</div>

					</div>

				</div>
			</section>
			<!-- /INFO BOX -->



		</div><!-- /#wrapper -->


		<!-- 
			SHOP AJAX MODAL : ON LOAD 

			Note: #onload_modal_shop is also used inside the modal
			for the button "stop showing" to set a cookie!
		-->
		<div id="onload_modal_shop" class="hide js-onload js-ajax-modal" 
		    data-href="${contextPath}/resources/_ajax/modal_shop.html" 
		    data-ajax-modal-delay="3000" 
		    data-ajax-modal-size="modal-lg" 
		    data-ajax-modal-centered="true" 
		    data-ajax-modal-backdrop=""></div>

	



	<script src="${contextPath}/resources/assets/js/core.min.js"></script>

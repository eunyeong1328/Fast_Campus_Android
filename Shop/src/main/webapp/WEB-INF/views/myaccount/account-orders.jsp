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
									onchange="window.location=this.value">
									<option value="#">전체</option>
									<option value="?filter_order_period=1">최근 일주일 이내</option>
									<option value="?filter_order_period=2">최근 한 달 이내</option>
								</select>

								<!-- Order Status -->
								<select
									class="form-control b-0 bg-light bs-select w--250 w-100-xs float-start float-none-xs mb-2"
									data-style="bg-light select-form-control" title="주문 상태"
									onchange="window.location=this.value">
									<option value="#">전체</option>
									<option value="?filter_order_status=1">결제완료</option>
									<option value="?filter_order_status=2">배송완료</option>
									<option value="?filter_order_status=3">주문취소</option>
								</select>

							</div>

							<!-- order -->
							<c:forEach var="orderList" items="${orderList }" begin="0">
							<div
								class="clearfix p-3 shadow-xs shadow-md-hover mb-3 rounded bg-white">

								<h2 class="fs--18">
									<a href="${contextPath }/myaccount/account-order-detail.do?order_num=${orderList.order_num }" class="float-end fs--12">
										주문 상세보기 </a> <a href="${contextPath }/myaccount/account-order-detail.do?order_num=${orderList.order_num }"
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





						</div>

					</div>

				</div>
			</section>
		
		

	<script src="${contextPath}/resources/assets/js/core.min.js"></script>

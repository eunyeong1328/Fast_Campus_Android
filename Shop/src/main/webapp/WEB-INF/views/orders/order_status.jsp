<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<script>

</script>

								<p class="mb-0 fs--14">
									상태:&nbsp; <span class="text-warning font-weight-normal">${orderList.order_status }</span>
								</p>

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


								
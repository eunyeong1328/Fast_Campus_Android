<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- Footer -->
<footer id="footer" class="shadow-xs">
	<div class="container py-5">

		<div class="row">

			<div class="col-12 col-lg-8">

				<div class="row mb-3">

					<!-- Col 1 -->
					<div class="col-12 col-lg-4 mb-1">

						<!-- mobile only : SOW Toggle Button -->
						<button
							class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
							data-target="#footer_c1"
							data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">

							<span class="group-icon p-2 float-start">
								<i class="fi fi-bars-2"></i>
								<i class="fi fi-close"></i>
							</span>

							<span class="h5 py-2 m-0 float-start">
								주문
							</span>
						</button>

						<!-- desktop only -->
						<h3 class="h5 py-3 m-0 d-none d-lg-block">
							주문
						</h3>


						<!-- navigation -->
						<ul id="footer_c1" class="nav flex-column d-none d-lg-block">
							<li class="list-item">
								<a class="d-block py-1" href="#!">My Account</a>
							</li>

							<li class="list-item">
								<a class="d-block py-1" href="#!">How do I order?</a>
							</li>

							<li class="list-item">
								<a class="d-block py-1" href="#!">Payment Methods</a>
							</li>
						</ul>

					</div>

					<!-- Col 2 -->
					<div class="col-12 col-lg-4 mb-1">

						<!-- mobile only : SOW Toggle Button -->
						<button
							class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
							data-target="#footer_c2"
							data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">

							<span class="group-icon p-2 float-start">
								<i class="fi fi-bars-2"></i>
								<i class="fi fi-close"></i>
							</span>

							<span class="h5 py-2 m-0 float-start">
								살펴보기
							</span>
						</button>

						<!-- desktop only -->
						<h3 class="h5 py-3 m-0 d-none d-lg-block">
							살펴보기
						</h3>


						<!-- navigation -->
						<ul id="footer_c2" class="nav flex-column d-none d-lg-block">
							<li class="list-item">
								<a class="d-block py-1" href="blog-page-sidebar.html">Smarty Blog</a>
							</li>

							<li class="list-item">
								<a class="d-block py-1" href="#!">Shipping</a>
							</li>

							<li class="list-item">
								<a class="d-block py-1" href="#!">Cookies</a>
							</li>
						</ul>


					</div>

					<!-- Col 3 -->
					<div class="col-12 col-lg-4 mb-1">

						<!-- mobile only : SOW Toggle Button-->
						<button
							class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
							data-target="#footer_c3"
							data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">

							<span class="group-icon p-2 float-start">
								<i class="fi fi-bars-2"></i>
								<i class="fi fi-close"></i>
							</span>

							<span class="h5 py-2 m-0 float-start">
								고객센터
							</span>

						</button>

						<!-- desktop only -->
						<h3 class="h5 py-3 m-0 d-none d-lg-block">
							고객센터
						</h3>


						<!-- navigation -->
						<ul id="footer_c3" class="nav flex-column d-none d-lg-block">
							<li class="list-item">
								<a class="d-block py-1" href="#!">Refund Policy</a>
							</li>

							<li class="list-item">
								<a class="d-block py-1" href="#!">Privacy Policy</a>
							</li>

							<li class="list-item">
								<a class="d-block py-1" href="#!">Terms &amp; Conditions</a>
							</li>
						</ul>

					</div>

				</div>

			</div>


			<div class="col">

				<h5 class="text-danger my-3">
					쩝쩝박사 구독하기
				</h5>

				<form novalidate class="bs-validate" method="post" action="#">

					<div class="input-group mb-3">

						<input required type="email" name="subscribe_email" value="" class="form-control"
							placeholder="email address" aria-label="email address">

						<div class="input-group-append">
							<button class="btn btn-danger btn-soft">구독</button>
						</div>

					</div>

				</form>

			</div>

		</div>

	</div>



	<div class="border-top">
		<div class="container text-center py-5">

			<!-- logo -->
			<span class="h--70 d-inline-flex align-items-center"> <img
					src="${contextPath}/resources/images/drjjlogo.svg" width="110" height="70" alt="...">
			</span>

			<p class="m-0 text-gray-500 fs--14">

				&copy; My Company Inc. 2015 – 2019. <br> All Rights Reserved.

			</p>

			<div class="mt-5">

				<!-- social -->
				<a href="#!" class="btn btn-sm btn-light transition-hover-top mb-2 rounded-circle" rel="noopener"
					aria-label="facebook page"> <i class="fi fi-social-facebook"></i>
				</a> <a href="#!" class="btn btn-sm btn-light transition-hover-top mb-2 rounded-circle" rel="noopener"
					aria-label="twitter page"> <i class="fi fi-social-twitter"></i>
				</a> <a href="#!" class="btn btn-sm btn-light transition-hover-top mb-2 rounded-circle" rel="noopener"
					aria-label="linkedin page"> <i class="fi fi-social-linkedin"></i>
				</a> <a href="#!" class="btn btn-sm btn-light transition-hover-top mb-2 rounded-circle" rel="noopener"
					aria-label="youtube page"> <i class="fi fi-social-youtube"></i>
				</a>


				<!-- credit cards -->
				<ul class="list-inline mb-0 mt-2">

					<li class="list-inline-item m-0"><img width="38" height="24" class="lazy"
							data-src="${contextPath}/resources/assets/images/credit_card/visa.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="visa credit card icon"></li>

					<li class="list-inline-item m-0"><img width="38" height="24" class="lazy"
							data-src="${contextPath}/resources/assets/images/credit_card/mastercard.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="mastercard credit card icon"></li>

					<li class="list-inline-item m-0"><img width="38" height="24" class="lazy"
							data-src="${contextPath}/resources/assets/images/credit_card/discover.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="discover credit card icon"></li>

					<li class="list-inline-item m-0"><img width="38" height="24" class="lazy"
							data-src="${contextPath}/resources/assets/images/credit_card/amazon.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="amazon credit card icon"></li>

					<li class="list-inline-item m-0"><img width="38" height="24" class="lazy"
							data-src="${contextPath}/resources/assets/images/credit_card/paypal.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="paypal credit card icon"></li>

					<li class="list-inline-item m-0"><img width="38" height="24" class="lazy"
							data-src="${contextPath}/resources/assets/images/credit_card/skrill.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="skrill credit card icon"></li>

					<!-- more vendors on ${contextPath}/resources/assets/images/credit_card/ -->

				</ul>

			</div>

		</div>

	</div>
	
</footer>
<!-- /Footer -->
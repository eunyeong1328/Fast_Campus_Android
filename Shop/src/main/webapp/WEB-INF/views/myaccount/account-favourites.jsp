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
										<a class="nav-link px-0" href="${contextPath}/myaccount/account-settings.do?member_id=${member_Info.member_id}">
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


							<!-- favourite banner : hidden on mobile -->
							<div class="px-4 py-5 shadow-xs mb-5 rounded bg-white d-none d-sm-block">

								<div class="row col-border">

									<div class="col-12 col-sm-4 col-md-4 col-lg-4">
										<div class="text-center">
											<i class="fi fi-heart-empty fs--40 text-primary"></i>
											<h2 class="fs--15 mt--20 mb--20">
												ADD TO FAVOURITES
											</h2>
											<p class="font-light text-muted">
												Do you love a product? You can add any product to your favourite list with one click!
											</p>
										</div>
									</div>


									<div class="col-12 col-sm-4 col-md-4 col-lg-4">
										<div class="text-center">
											<i class="fi fi-cart-3 fs--40 text-primary"></i>
											<h2 class="fs--15 mt--20 mb--20">
												PURCHASE ANY TIME
											</h2>
											<p class="font-light text-muted">
												Purchase your favourites at any time, never forget your favourite products!
											</p>
										</div>
									</div>


									<div class="col-12 col-sm-4 col-md-4 col-lg-4">
										<div class="text-center">
											<i class="fi fi-smart-devices fs--40 text-primary"></i>
											<h2 class="fs--15 mt--20 mb--20">
												ALL FAVOURITES IN ONE PLACE
											</h2>
											<p class="font-light text-muted">
												Desktop, tablet or mobile! You can access your favourite products any time, from everywhere!
											</p>
										</div>
									</div>

								</div>

							</div>
							<!-- /favourite banner -->



							<!-- item -->
							<div class="clearfix p-3 shadow-xs shadow-md-hover mb-3 rounded bg-white">

								<div class="row col-border">

									<!-- image -->
									<div class="col-5 col-sm-3 col-md-3 col-lg-2 text-center">
										<a class="text-decoration-none">
											<img class="img-fluid bg-suprime" src="demo.files/images/unsplash/products/thumb_330/imani-clovis-LxVxPA1LOVM-unsplash-min.jpg" alt="...">
										</a>
									</div>

									<!-- detail -->
									<div class="col-7 col-sm-5 col-md-4 col-lg-6 bordered-start">

										<a class="fs--16 text-dark font-weight-medium" href="#">
											Product title here
										</a>

										<div class="fs--14 mb--10 clearfix">
											<i class="rating-5 text-warning fs--14 float-start mt--3"></i>
											<span class="text-muted">6 reviews</span>
										</div>

										<div class="mt-2">

											<p class="fs--13 text-muted mb-0">
												<del>$189.95</del>  
												<span class="text-success font-weight-light fs--14">(–16% / <b>you save $31.00</b>)</span>
											</p>

											<p class="fs--18 font-weight-medium mb-0 ">
												$158.95 
											</p>

										</div>

									</div>
									
									<div class="col-12 d-block d-sm-none mt-3"><!-- mobile spacer --></div>

									<!-- buttons -->
									<div class="col-12 col-sm-4 col-md-4 col-lg-4 text-align-end text-align-center-xs b-0">

										<button type="submit" class="btn btn-sm btn-primary fs--14 w-100-xs d-block-xs">
											Add to cart
										</button>

										<div class="clearfix mt-2">
											<a href="#!" 
												data-href="#?action=delete&amp;item_id=1" 
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

												data-ajax-confirm-callback-function="" class="js-ajax-confirm btn btn-sm btn-light d-block-xs font-regular fs--14 w-100-xs d-block-xs">
												Remove
											</a>

										</div>

									</div>

								</div>

							</div>
							<!-- /item -->




							<!-- item -->
							<div class="clearfix p-3 shadow-xs shadow-md-hover mb-3 rounded bg-white">

								<div class="row col-border">

									<!-- image -->
									<div class="col-5 col-sm-3 col-md-3 col-lg-2 text-center">
										<a class="text-decoration-none">
											<img class="img-fluid bg-suprime" src="demo.files/images/unsplash/products/thumb_330/aidan-hancock-UtzrcidfCsk-unsplash-min.jpg" alt="...">
										</a>
									</div>

									<!-- detail -->
									<div class="col-7 col-sm-5 col-md-4 col-lg-6 bordered-start">

										<a class="fs--16 text-dark font-weight-medium" href="#">
											Product title here
										</a>

										<div class="fs--14 mb--10 clearfix">
											<i class="rating-5 text-warning fs--14 float-start mt--3"></i>
											<span class="text-muted">6 reviews</span>
										</div>

										<div class="mt-2">

											<p class="fs--13 text-muted mb-0">
												<del>$189.95</del>  
												<span class="text-success font-weight-light fs--14">(–16% / <b>you save $31.00</b>)</span>
											</p>

											<p class="fs--18 font-weight-medium mb-0 ">
												$158.95 
											</p>

										</div>

									</div>
									
									<div class="col-12 d-block d-sm-none mt-3"><!-- mobile spacer --></div>

									<!-- buttons -->
									<div class="col-12 col-sm-4 col-md-4 col-lg-4 text-align-end text-align-center-xs b-0">

										<button type="submit" class="btn btn-sm btn-primary fs--14 w-100-xs d-block-xs">
											Add to cart
										</button>

										<div class="clearfix mt-2">
											<a href="#!" 
												data-href="#?action=delete&amp;item_id=1" 
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

												data-ajax-confirm-callback-function="" class="js-ajax-confirm btn btn-sm btn-light d-block-xs font-regular fs--14 w-100-xs d-block-xs">
												Remove
											</a>
										</div>

									</div>

								</div>

							</div>
							<!-- /item -->




							<!-- item -->
							<div class="clearfix p-3 shadow-xs shadow-md-hover mb-3 rounded bg-white">

								<div class="row col-border">

									<!-- image -->
									<div class="col-5 col-sm-3 col-md-3 col-lg-2 text-center">
										<a class="text-decoration-none">
											<img class="img-fluid bg-suprime" src="demo.files/images/unsplash/products/thumb_330/hardik-sharma-CrPAvN29Nhs-unsplash-min.jpg" alt="...">
										</a>
									</div>

									<!-- detail -->
									<div class="col-7 col-sm-5 col-md-4 col-lg-6 bordered-start">

										<a class="fs--16 text-dark font-weight-medium" href="#">
											Product title here
										</a>

										<div class="fs--14 mb--10 clearfix">
											<i class="rating-5 text-warning fs--14 float-start mt--3"></i>
											<span class="text-muted">6 reviews</span>
										</div>

										<div class="mt-2">

											<p class="fs--13 text-muted mb-0">
												<del>$189.95</del>  
												<span class="text-success font-weight-light fs--14">(–16% / <b>you save $31.00</b>)</span>
											</p>

											<p class="fs--18 font-weight-medium mb-0 ">
												$158.95 
											</p>

										</div>

									</div>
									
									<div class="col-12 d-block d-sm-none mt-3"><!-- mobile spacer --></div>

									<!-- buttons -->
									<div class="col-12 col-sm-4 col-md-4 col-lg-4 text-align-end text-align-center-xs b-0">

										<button type="submit" class="btn btn-sm btn-primary fs--14 w-100-xs d-block-xs">
											Add to cart
										</button>

										<div class="clearfix mt-2">
											<a href="#!" 
												data-href="#?action=delete&amp;item_id=1" 
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

												data-ajax-confirm-callback-function="" class="js-ajax-confirm btn btn-sm btn-light d-block-xs font-regular fs--14 w-100-xs d-block-xs">
												Remove
											</a>
										</div>

									</div>

								</div>

							</div>
							<!-- /item -->



							<!-- pagination -->
							<nav aria-label="pagination" class="mt-5">
								<ul class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">

									<li class="page-item disabled">
										<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
									</li>
									
									<li class="page-item active">
										<a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
									</li>
									
									<li class="page-item" aria-current="page">
										<a class="page-link" href="#">2</a>
									</li>
									
									<li class="page-item">
										<a class="page-link" href="#">3</a>
									</li>
									
									<li class="page-item">
										<a class="page-link" href="#">Next</a>
									</li>

								</ul>
							</nav>
							<!-- pagination -->
									


						</div>

					</div>

				</div>
			</section>
			<!-- / -->


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




			<!-- Footer -->
			<footer id="footer" class="shadow-xs">
				
				<div class="container py-5">

					<div class="row">

						<div class="col-12 col-lg-8">

							<div class="row mb-3">

								<!-- Col 1 -->
								<div class="col-12 col-lg-4 mb-1">

									<!-- mobile only : SOW Toggle Button -->
									<button class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none" 
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
									<button class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none" 
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
									<button class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none" 
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

									<input required type="email" name="subscribe_email" value="" class="form-control" placeholder="email address" aria-label="email address">
									
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
						<span class="h--70 d-inline-flex align-items-center">
							<img src="${contextPath}/resources/images/drjjlogo.svg" width="110" height="70" alt="...">
						</span>

						<p class="m-0 text-gray-500 fs--14">

							&copy; My Company Inc. 2015 – 2019. 

							<br>

							All Rights Reserved.
						
						</p>


						<div class="mt-5"> 

							<!-- social -->
							<a href="#!" class="btn btn-sm btn-light transition-hover-top mb-2 rounded-circle" rel="noopener" aria-label="facebook page">
								<i class="fi fi-social-facebook"></i> 
							</a>

							<a href="#!" class="btn btn-sm btn-light transition-hover-top mb-2 rounded-circle" rel="noopener" aria-label="twitter page">
								<i class="fi fi-social-twitter"></i> 
							</a>

							<a href="#!" class="btn btn-sm btn-light transition-hover-top mb-2 rounded-circle" rel="noopener" aria-label="linkedin page">
								<i class="fi fi-social-linkedin"></i> 
							</a>

							<a href="#!" class="btn btn-sm btn-light transition-hover-top mb-2 rounded-circle" rel="noopener" aria-label="youtube page">
								<i class="fi fi-social-youtube"></i> 
							</a>


							<!-- credit cards -->
							<ul class="list-inline mb-0 mt-2"> 

								<li class="list-inline-item m-0"> 
									<img width="38" height="24" class="lazy" data-src="${contextPath}/resources/assets/images/credit_card/visa.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="visa credit card icon">
								</li> 

								<li class="list-inline-item m-0"> 
									<img width="38" height="24" class="lazy" data-src="${contextPath}/resources/assets/images/credit_card/mastercard.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="mastercard credit card icon">
								</li> 

								<li class="list-inline-item m-0"> 
									<img width="38" height="24" class="lazy" data-src="${contextPath}/resources/assets/images/credit_card/discover.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="discover credit card icon">
								</li>

								<li class="list-inline-item m-0"> 
									<img width="38" height="24" class="lazy" data-src="${contextPath}/resources/assets/images/credit_card/amazon.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="amazon credit card icon">
								</li>
								
								<li class="list-inline-item m-0"> 
									<img width="38" height="24" class="lazy" data-src="${contextPath}/resources/assets/images/credit_card/paypal.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="paypal credit card icon">
								</li>

								<li class="list-inline-item m-0"> 
									<img width="38" height="24" class="lazy" data-src="${contextPath}/resources/assets/images/credit_card/skrill.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="skrill credit card icon">
								</li>

								<!-- more vendors on ${contextPath}/resources/assets/images/credit_card/ -->

							</ul>

						</div>


					</div>
				</div>

			</footer>
			<!-- /Footer -->


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


		</div><!-- /#wrapper -->

		<script src="${contextPath}/resources/assets/js/core.min.js"></script>
		
	
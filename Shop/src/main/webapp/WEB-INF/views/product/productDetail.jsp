<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- 여기서부터 -->
<!-- PRODUCT -->
<section class="pt-5">
	<div class="container">
		
		<!-- Breadcrumbs -->
		<div class="mb-5">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb fs--14">
					<li class="breadcrumb-item"><a
						href="${contextPath}/main/main.do">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">
						${vo.product_category_name }</li>
				</ol>
			</nav>
		</div>
		<!-- /Breadcrumbs -->


		<div class="row">
			<div class="col-lg-7 col-md-6 order-1 mb-5">
				<div class="row">
					<!-- SECONDARY SWIPER : THUMBS -->
					<div class="col-12 order-2">
						<img src="${contextPath}/resources/images/item_image/${vo.product_image}">
					</div>


					<!-- PRIMARY SWIPER -->
					<div class="col-12 order-1">


						<!-- 

										SWIPER SLIDER 
										w-75 w-100-xs 		= 70% width on desktop, 100% mobile
										swiper-white 		= white buttons. (swiper-primary, swiper-danger, etc)

										By default, Smarty controller will reconfigure swiper if -only- one image detected:
											- remove arrows
											- remove progress/bullets
											- disable loop
										Add .js-ignore class to skip, if for some reason is needed!

									-->
<!--  -->
						<div id="swiper_primary"
							class="swiper-container swiper-preloader swiper-white mx-auto"
							data-swiper-link="swiper_secondary"
							data-swiper='{
											"slidesPerView": 1,
											"spaceBetween": 0,
											"autoplay": false,
											"loop": true,
											"zoom": true,
											"effect": "slide",
											"loopedSlides": 1,
											"breakpoints": {
												"920": 	{ "slidesPerView": "1" }
											}
										}'>

							<!--
											
											NOTE: only the first image is NOT using lazy loading (to avoid 'jumping')
											lazy is optional but recommended: ~80% of visitors don't slide through images!

											Images are using srcset for responsiveness!

										-->
							<div class="swiper-wrapper text-center">

								<!-- slider 1 -->

								<div class="swiper-slide">
									<div class="swiper-zoom-container">
										<!--
													<img class="bg-suprime img-fluid rounded max-h-600" 

														sizes="(max-width: 768px) 100vw"
														srcset="
																demo.files/images/unsplash/products/smartwatch_3.jpg 1200w,
																demo.files/images/unsplash/products/thumb_768/smartwatch_3.jpg 768w
														"
														src="demo.files/images/unsplash/products/smartwatch_3.jpg" 
														alt="...">
													-->
									<!-- 
										<img class="bg-suprime img-fluid rounded max-h-600"
											src="${contextPath}/product/thumbnails.do?product_id=${vo.product_id}&product_category_num=${vo.product_category_num}ㅎㅎ">
									 -->
									</div>
								</div>

								<!-- slider 2 -->
								<!-- 
											<div class="swiper-slide">
												<div class="swiper-zoom-container">
													<img class="lazy bg-suprime img-fluid rounded max-h-600" 

														sizes="(max-width: 768px) 100vw"
														srcset="
																demo.files/images/unsplash/products/smartwatch_2.jpg 1200w,
																demo.files/images/unsplash/products/thumb_768/smartwatch_2.jpg 768w
														"

														data-src="demo.files/images/unsplash/products/smartwatch_2.jpg" 
														src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" 
														alt="...">
												</div>
											</div>
											-->
								<!-- slider 3 -->
								<!-- 
											<div class="swiper-slide">
												<div class="swiper-zoom-container">
													<img class="lazy bg-suprime img-fluid rounded max-h-600" 

														sizes="(max-width: 768px) 100vw"
														srcset="
																demo.files/images/unsplash/products/smartwatch_1.jpg 1200w,
																demo.files/images/unsplash/products/thumb_768/smartwatch_1.jpg 768w
														"

														data-src="demo.files/images/unsplash/products/smartwatch_1.jpg" 
														src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" 
														alt="...">
												</div>
											</div>
											-->
							</div>

							<!-- Left|Right Arrows -->
							<div
								class="swiper-button-next rounded-circle shadow-xs d-none d-md-block"></div>
							<div
								class="swiper-button-prev rounded-circle shadow-xs d-none d-md-block"></div>

						</div>
						<!-- /SWIPER SLIDER -->

					</div>

				</div>
			</div>


			<div class="col-lg-5 col-md-6 order-2 mb-5">

				<div class="clearfix">
					<!-- sticky-kit -->

					<!-- SUPPLIER & TITLE -->
					<h4 class="h2 h3-xs font-weight-medium mb-5">
						[${vo.supplier}]${vo.product_name} <span
							class="d-block text-muted fs--14">${vo.product_detail}</span>
					</h4>



					<!-- Form -->
					<form novalidate class="bs-validate" method="post" action="#"
						data-error-scroll-up="true">


						<!-- PRICE -->
						<div class="clearfix mb-5">

							<p class="text-muted m-0">
								<del>
									<fmt:formatNumber type="number" value="${vo.price}" />
									원
								</del>
								<span class="text-success font-light fs--14">(
									${vo.discount}%) <!--<span class="font-weight-medium">you save $31.00</span> -->
								</span>
							</p>

							<p class="fs--25 m-0 font-weight-medium text-danger">

								<!-- 
												counter used because of configurator to do the math.
												If configurator not used, just add the price instead ($149.99)
											-->
								<span class="item-price" data-toggle="count"
									data-count-decimals="2" data-count-from="144.99"
									data-count-to="144.99" data-count-duration="250"><fmt:formatNumber
										type="number" value="${vo.sale_price}" />원</span>
							</p>

						</div>



						<!--  상세 정보  -->
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">판매단위</th>
									<td>${vo.sales_unit }ea</td>
								</tr>
								<tr>
									<th scope="row">상품용량</th>
									<td>${vo.product_size }g</td>
								</tr>
								<tr>
									<th scope="row">포장타입</th>
									<td>${vo.packing_type }</td>
								</tr>
							</tbody>
						</table>

						<!-- 상품 옵션!! -->
						<!-- Basic -->
						<c:if test="${not empty optionList }">
							<select class="form-control bs-select" name="option_name"
								title="Please Select..." required>
								<c:forEach var="option" items="${optionList }">
									<option value="${option.option_name }">${option.option_name }
										[
										<fmt:formatNumber type="number"
											value="${option.option_price }" /> 원]
									</option>
								</c:forEach>
							</select>
						</c:if>
						<br> <select class="form-control bs-select"
							name="option_quantity" title="Please Select..." required>
							<c:forEach var="i" begin="1" end="10" step="1">
								<option value="i">${i }개</option>
							</c:forEach>
						</select>


						<!-- ADD TO CART -->
						<div class="clearfix d-flex d-block-xs">

							<!-- ADD TO CART BUTTON -->
							<div
								class="d-inline-flex w-100-xs float-start float-none-xs ml-0 mr-0 mt-2">

								<!-- QUANTITY INPUT -->
								<div>
									<span
										class="js-form-advanced-limit-info badge badge-warning hide animate-bouncein position-absolute absolute-top start-0 m-1 z-index-5">
										please, order between 1 and 99. </span> <input required type="number"
										name="qty" value="1" step="1" min="0" max="99"
										class="form-control text-center js-form-advanced-limit w--80 h-100 m-0"
										data-toggle="tooltip" data-original-title="quantity">
								</div>

								<div class="pl-2 pr-2 w-100-xs">
									<button
										class="btn btn-danger bg-gradient-danger text-white px-4 b-0 d-block-xs w-100-xs">
										<span class="px-4 p-0-xs"> <i> <svg width="22px"
													height="22px" x="0px" y="0px"
													viewBox="0 10 459.529 500.529">
																<path fill="#ffffff"
														d="M17,55.231h48.733l69.417,251.033c1.983,7.367,8.783,12.467,16.433,12.467h213.35c6.8,0,12.75-3.967,15.583-10.2    l77.633-178.5c2.267-5.383,1.7-11.333-1.417-16.15c-3.117-4.817-8.5-7.65-14.167-7.65H206.833c-9.35,0-17,7.65-17,17    s7.65,17,17,17H416.5l-62.9,144.5H164.333L94.917,33.698c-1.983-7.367-8.783-12.467-16.433-12.467H17c-9.35,0-17,7.65-17,17    S7.65,55.231,17,55.231z"></path>
																<path fill="#ffffff"
														d="M135.433,438.298c21.25,0,38.533-17.283,38.533-38.533s-17.283-38.533-38.533-38.533S96.9,378.514,96.9,399.764    S114.183,438.298,135.433,438.298z"></path>
																<path fill="#ffffff"
														d="M376.267,438.298c0.85,0,1.983,0,2.833,0c10.2-0.85,19.55-5.383,26.35-13.317c6.8-7.65,9.917-17.567,9.35-28.05    c-1.417-20.967-19.833-37.117-41.083-35.7c-21.25,1.417-37.117,20.117-35.7,41.083    C339.433,422.431,356.15,438.298,376.267,438.298z"></path>
															</svg>
										</i> <span class="fs--18">Add to cart</span>
										</span>

										<!-- free shipping : optional : good for conversions -->
										<span class="d-block pt-2 pb-1"> <span class="hr"></span>
											<span class="font-light fs--13 opacity-7 d-block mt-2">
												free shipping </span>
										</span>
										<!-- /free shipping : optional : good for conversions -->

									</button>
								</div>

							</div>

							<!-- ADD TO FAVOURITES BUTTON -->
							<div class="w--60 mt-2 w-100-xs float-start float-none-xs mt-2">
								<a href="#"
									class="btn-toggle btn btn-light h-100 d-flex justify-content-center align-items-center"
									data-toggle="tooltip" data-original-title="add to favourite"
									data-toggle-ajax-url-on="demo.files/php/demo.ajax_request.php?product_id=1&amp;action=add_to_favourite"
									data-toast-success-message="Added to your favourite!"
									data-toast-success-position="bottom-center"> <!-- heart icon -->
									<i class="m-0 fi fi-heart-empty"></i> <!-- text : mobile only -->
									<span class="pl-3 pr-3 d-block d-sm-none"> add to
										favourite </span>
								</a>
							</div>

						</div>
						<!-- /ADD TO CART -->

						<!-- stock info -->
						<span class="d-block text-muted fs--11 mt-1 pl-2 pr-2"> 99
							in stock </span>
						<!-- /ADD TO CART -->
					</form>
					<!-- /Form -->
				</div>
			</div>
		</div>
	</div>
</section>
<!-- /PRODUCT -->


<!-- SPECIFICATIONS -->
<section class="border-top">
	<div class="container">
		<!-- <img src="${contextPath }/product/download.do?product_detail_image=${vo.product_detail_image}" >  -->
		<img
			src="${contextPath}/resources/images/item_image/${vo.product_detail_image}">
	</div>
</section>
<!-- /SPECIFICATIONS -->





<!-- 문의게시판... -->
<section>
	<div class="accordion shadow-xs" id="accordionBottomBorder"
		data-aos="fade-in" data-aos-delay="250">
		
		<div class="card border-bottom bl-0 br-0 bt-0">
			
			<div class="card-header b-0 p-0 border bg-transparent"
				id="cleanHeadingBorder1">
				<h2 class="mb-0">
					<button
						class="fs--18 btn btn-link btn-block btn-lg text-align-start text-decoration-none text-dark"
						type="button" data-toggle="collapse"
						data-target="#borderCollapse1" aria-expanded="true"
						aria-controls="borderCollapse1">
						Do I have a business email address? <span
							class="group-icon float-end"> <i
							class="fi fi-arrow-start-slim"></i> <i
							class="fi fi-arrow-down-slim"></i>
						</span>
					</button>
				</h2>
			</div>

			<div id="borderCollapse1" class="collapse show"
				aria-labelledby="cleanHeadingBorder1"
				data-parent="#accordionBottomBorder">
				<div class="card-body">
					<p class="lead">

						We are not able to offer you a dedicated email service for a
						custom email address like office@mydomain.com at this time. An
						easy way to create your own business email address is using a
						cheap hosting plan. <a href="#!">Here is an informative guide</a>.

					</p>
				</div>
			</div>
		</div>

		<div class="card border-bottom bl-0 br-0 bt-0">
			<div class="card-header b-0 p-0 border bg-transparent"
				id="cleanHeadingBorder2">
				<h2 class="mb-0">
					<button
						class="fs--18 btn btn-link btn-block btn-lg text-align-start text-decoration-none text-dark collapsed"
						type="button" data-toggle="collapse"
						data-target="#borderCollapse2" aria-expanded="false"
						aria-controls="borderCollapse2">
						Do I have a traffic limit? <span class="group-icon float-end">
							<i class="fi fi-arrow-start-slim"></i> <i
							class="fi fi-arrow-down-slim"></i>
						</span>
					</button>
				</h2>
			</div>

			<div id="borderCollapse2" class="collapse"
				aria-labelledby="cleanHeadingBorder2"
				data-parent="#accordionBottomBorder">
				<div class="card-body">
					<p class="lead">No, there is no such thing like "traffic limit"
						or "order limit".</p>
				</div>
			</div>
		</div>
	</div>
</section>


<!--  상품 문의 qna -->
<section>
	<div class="d-flex flex-fill container">

		<!-- MIDDLE -->
		<div id="middle" class="flex-fill">

			<div class="page-title bg-transparent b-0">
				<!-- h1 고객센터 -->
				<h1 class="h4 mt-4 mb-0 px-3">상품문의</h1>
			</div>

			<div class="clearfix">
				<div role="tabpanel">

					<!-- Nav tabs -->
					<div class="container">


						<!-- tab-1 -->
						<div id="tab-1" class="tab-content current">

							<h3 class="joy-table-title">
								상품문의
								<p>
									상품에 대한 문의를 남기는 공간입니다. <br> 배송관련, 주문(취소/교환/환불)관련 문의는 1:1문의에
									남겨주세요
								</p>
							</h3>

							<table class="joy-table">
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<c:if test="${empty qnaList}">
									<tbody>
										<tr>
											<td colspan="5">등록된 게시글이 없습니다.</td>
										</tr>
									</tbody>
								</c:if>
								<c:if test="${not empty qnaList}">
									<c:forEach var="qna" items="${qnaList}">
										<tbody>
											<tr>
												<td>rowNum</td>
												<td><a
													href="notice.do?notice_num=${notice.notice_num}&cPage=${paging.nowPage}">
														${qna.title} </a></td>
												<td>${qna.member_id }</td>
												<td>${qna.reg_date}</td>
												<td>${qna.views}</td>
											</tr>
										</tbody>
									</c:forEach>
								</c:if>
							</table>

							<!-- paging -->
							<ul class="joy-paging">
								<c:if test="${paging.beginPage == 1}">
									<li>
										<p class="disabled">Prev</p>
									</li>
								</c:if>
								<c:if test="${paging.beginPage != 1}">
									<li><a href="notice-tab.do?cPage=${paging.beginPage - 1 }">
											Prev </a></li>
								</c:if>

								<c:forEach var="pageNo" begin="${paging.beginPage }"
									end="${paging.endPage }">
									<c:if test="${pageNo == paging.nowPage }">
										<li class="active">${pageNo }</li>
									</c:if>
									<c:if test="${pageNo != paging.nowPage }">
										<li><a href="notice-tab.do?cPage=${pageNo }">
												${pageNo } </a></li>
									</c:if>
								</c:forEach>

								<c:if test="${paging.endPage >= paging.totalPage }">
									<li><p class="disabled">Next</p></li>
								</c:if>
								<c:if test="${paging.endPage < paging.totalPage }">
									<li><a href="notice-tab.do?cPage=${paging.endPage + 1 }">Next</a></li>
								</c:if>
							</ul>

						</div>
						<!-- tab-1 end -->

					</div>
					<!-- Nav tabs end-->

				</div>

			</div>

		</div>
		<!-- MiDDLE end -->

	</div>
	</div>
</section>


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

							<span class="group-icon p-2 float-start"> <i
								class="fi fi-bars-2"></i> <i class="fi fi-close"></i>
							</span> <span class="h5 py-2 m-0 float-start"> Orders </span>
						</button>

						<!-- desktop only -->
						<h3 class="h5 py-3 m-0 d-none d-lg-block">Orders</h3>


						<!-- navigation -->
						<ul id="footer_c1" class="nav flex-column d-none d-lg-block">
							<li class="list-item"><a class="d-block py-1" href="#!">My
									Account</a></li>

							<li class="list-item"><a class="d-block py-1" href="#!">How
									do I order?</a></li>

							<li class="list-item"><a class="d-block py-1" href="#!">Payment
									Methods</a></li>
						</ul>

					</div>

					<!-- Col 2 -->
					<div class="col-12 col-lg-4 mb-1">

						<!-- mobile only : SOW Toggle Button -->
						<button
							class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
							data-target="#footer_c2"
							data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">

							<span class="group-icon p-2 float-start"> <i
								class="fi fi-bars-2"></i> <i class="fi fi-close"></i>
							</span> <span class="h5 py-2 m-0 float-start"> Explore </span>
						</button>

						<!-- desktop only -->
						<h3 class="h5 py-3 m-0 d-none d-lg-block">Explore</h3>


						<!-- navigation -->
						<ul id="footer_c2" class="nav flex-column d-none d-lg-block">
							<li class="list-item"><a class="d-block py-1"
								href="blog-page-sidebar.html">Smarty Blog</a></li>

							<li class="list-item"><a class="d-block py-1" href="#!">Shipping</a>
							</li>

							<li class="list-item"><a class="d-block py-1" href="#!">Cookies</a>
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

							<span class="group-icon p-2 float-start"> <i
								class="fi fi-bars-2"></i> <i class="fi fi-close"></i>
							</span> <span class="h5 py-2 m-0 float-start"> Support </span>

						</button>

						<!-- desktop only -->
						<h3 class="h5 py-3 m-0 d-none d-lg-block">Support</h3>


						<!-- navigation -->
						<ul id="footer_c3" class="nav flex-column d-none d-lg-block">
							<li class="list-item"><a class="d-block py-1" href="#!">Refund
									Policy</a></li>

							<li class="list-item"><a class="d-block py-1" href="#!">Privacy
									Policy</a></li>

							<li class="list-item"><a class="d-block py-1" href="#!">Terms
									&amp; Conditions</a></li>
						</ul>

					</div>

				</div>

			</div>


			<div class="col">

				<h5 class="text-primary my-3">Follow us</h5>

				<form novalidate class="bs-validate" method="post" action="#">

					<div class="input-group mb-3">

						<input required type="email" name="subscribe_email" value=""
							class="form-control" placeholder="email address"
							aria-label="email address">

						<div class="input-group-append">
							<button class="btn btn-primary">Subscribe</button>
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
				src="assets/images/logo/logo_dark.svg" width="110" height="70"
				alt="...">
			</span>

			<p class="m-0 text-gray-500 fs--14">

				&copy; My Company Inc. 2015 – 2019. <br> All Rights Reserved.

			</p>


			<div class="mt-5">

				<!-- social -->
				<a href="#!"
					class="btn btn-sm btn-light transition-hover-top mb-2 rounded-circle"
					rel="noopener" aria-label="facebook page"> <i
					class="fi fi-social-facebook"></i>
				</a> <a href="#!"
					class="btn btn-sm btn-light transition-hover-top mb-2 rounded-circle"
					rel="noopener" aria-label="twitter page"> <i
					class="fi fi-social-twitter"></i>
				</a> <a href="#!"
					class="btn btn-sm btn-light transition-hover-top mb-2 rounded-circle"
					rel="noopener" aria-label="linkedin page"> <i
					class="fi fi-social-linkedin"></i>
				</a> <a href="#!"
					class="btn btn-sm btn-light transition-hover-top mb-2 rounded-circle"
					rel="noopener" aria-label="youtube page"> <i
					class="fi fi-social-youtube"></i>
				</a>



				<!-- credit cards -->
				<ul class="list-inline mb-0 mt-2">

					<li class="list-inline-item m-0"><img width="38" height="24"
						class="lazy" data-src="assets/images/credit_card/visa.svg"
						src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
						alt="visa credit card icon"></li>

					<li class="list-inline-item m-0"><img width="38" height="24"
						class="lazy" data-src="assets/images/credit_card/mastercard.svg"
						src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
						alt="mastercard credit card icon"></li>

					<li class="list-inline-item m-0"><img width="38" height="24"
						class="lazy" data-src="assets/images/credit_card/discover.svg"
						src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
						alt="discover credit card icon"></li>

					<li class="list-inline-item m-0"><img width="38" height="24"
						class="lazy" data-src="assets/images/credit_card/amazon.svg"
						src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
						alt="amazon credit card icon"></li>

					<li class="list-inline-item m-0"><img width="38" height="24"
						class="lazy" data-src="assets/images/credit_card/paypal.svg"
						src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
						alt="paypal credit card icon"></li>

					<li class="list-inline-item m-0"><img width="38" height="24"
						class="lazy" data-src="assets/images/credit_card/skrill.svg"
						src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
						alt="skrill credit card icon"></li>

					<!-- more vendors on assets/images/credit_card/ -->

				</ul>

			</div>


		</div>
	</div>

</footer>
<!-- /Footer -->


</div>
<!-- /#wrapper -->

<script src="assets/js/core.min.js"></script>


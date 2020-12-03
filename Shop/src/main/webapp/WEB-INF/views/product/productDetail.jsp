<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%
   request.setCharacterEncoding("UTF-8");
%>


<c:if test="${not empty msg }">
	<script>
		alert("게시글 작성자가 아닙니다");
	</script>
</c:if>

<script type="text/javascript">
var quantity="0";
var opt_name;

function changeOption() {
	var selectOpt = document.getElementById("opt");
	var tmp = selectOpt.options[selectOpt.selectedIndex].text;
	var tmp1 = tmp.lastIndexOf("원");
	var num = tmp.indexOf("[");
	var str = tmp.substring(0,num);
	opt_name = str.trim();
}
function changeQuantity() {

	var selectOpt =  document.getElementById("opt_quantity");
	    quantity  = parseInt(selectOpt.options[selectOpt.selectedIndex].text);
}
function add_cart(product_name,quantity,opt_name) {
	if(${not empty optionList} && !opt_name){
		alert("옵션을 선택해주세요");
		return;
	}
	
	if(quantity==0){
		alert("수량옵션을 선택해주세요");
		return;
	}
	if(!opt_name){
		opt_name="";
	}
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/cart/addProductInCart.do",
		data : {
			product_name:product_name,
			quantity:quantity,
			option_name:opt_name
		},
		success : function(data, textStatus) {
			if(data.trim()=='add_success'){
				alert("카트에 등록되었습니다.");
			}else if(data.trim()=='already_existed'){
				alert("이미 카트에 등록된 상품입니다.");	
			}else if(data.trim()=='logingo'){
				alert("로그인을 먼저 해주세요.");
			}
		},
		error : function(data, textStatus) {
		},
		complete : function(data, textStatus) {
		}
	}); //end ajax	

}
</script>

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
						<img
							src="${contextPath}/resources/images/item_image/${vo.product_image}">
						<!-- 
                           <div id="swiper_secondary" class="swiper-container swiper-thumbs mt-3"
                              data-swiper='{
                                 "slidesPerView": 6,
                                 "spaceBetween": 6,
                                 "autoplay": false,
                                 "loop": false,
                                 "zoom": false,
                                 "effect": "slide",
                                 "pagination": null,
                                 "watchSlidesVisibility": true,
                                    "watchSlidesProgress": true,
                                    "loopedSlides": 1,
                                    "thumbs": { 
                                       "slideThumbActiveClass": "bg-theme-color-light border-bottom border-primary-soft bw--3" 
                                    },
                                 "breakpoints": {
                                    "920":    { "slidesPerView": "4" }
                                 }
                              }'>

                              <div class="swiper-wrapper text-center">

                                 
                                 <div>
                                 <img src="${contextPath}/product/thumbnails1.do?product_id=${vo.product_id }&product_image=${vo.product_image }">
                                 </div>
                              
                              </div>

                           </div>
                           
                           <!-- /SWIPER  : THUMBS -->

					</div>


					<!-- PRIMARY SWIPER -->
					<div class="col-12 order-1">


						<!-- 

                              SWIPER SLIDER 
                              w-75 w-100-xs       = 70% width on desktop, 100% mobile
                              swiper-white       = white buttons. (swiper-primary, swiper-danger, etc)

                              By default, Smarty controller will reconfigure swiper if -only- one image detected:
                                 - remove arrows
                                 - remove progress/bullets
                                 - disable loop
                              Add .js-ignore class to skip, if for some reason is needed!

                           -->
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
                                    "920":    { "slidesPerView": "1" }
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
                                       --><%-- 
										<img class="bg-suprime img-fluid rounded max-h-600"
											src="${contextPath}/product/thumbnails.do?product_id=${vo.product_id}&product_category_num=${vo.product_category_num}"> --%>
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
                           <c:if test="${not empty optionList }" >
                              <select id="opt" class="form-control bs-select" name="option_name" title="Please Select..." onChange="changeOption();" required>
                                 <c:forEach var="option" items="${optionList }">
                                    <option value="${option.option_name }">${option.option_name } [<fmt:formatNumber type="number" value="${option.option_price }"/> 원]</option>
                                 </c:forEach>
                              </select>
                           </c:if>
                           <br>
                           <select id="opt_quantity" class="form-control bs-select" name="option_quantity" title="Please Select..." onChange="changeQuantity();" required>
                              <c:forEach var="i" begin="1" end="10" step="1">
                                 <option value="i">${i }개</option>
                              </c:forEach>
                           </select>
                           <!-- ADD TO CART -->
                           <div class="clearfix d-flex d-block-xs">
                              
                              <!-- ADD TO CART BUTTON -->
                              <div class="d-inline-flex w-100-xs float-start float-none-xs ml-0 mr-0 mt-2"> 

					
						<!-- 상품 담기 -->
                                 <div class="pl-2 pr-2 w-100-xs"> 
                                    <button class="btn btn-danger bg-gradient-danger text-white px-4 b-0 d-block-xs w-100-xs"
                   		 onclick="javascript:add_cart('${vo.product_name}',quantity,opt_name)"> 
                   		
                                       <span class="px-4 p-0-xs">
                                          <i>
                                             <svg width="22px" height="22px" x="0px" y="0px" viewBox="0 10 459.529 500.529">
                                                <path fill="#ffffff" d="M17,55.231h48.733l69.417,251.033c1.983,7.367,8.783,12.467,16.433,12.467h213.35c6.8,0,12.75-3.967,15.583-10.2    l77.633-178.5c2.267-5.383,1.7-11.333-1.417-16.15c-3.117-4.817-8.5-7.65-14.167-7.65H206.833c-9.35,0-17,7.65-17,17    s7.65,17,17,17H416.5l-62.9,144.5H164.333L94.917,33.698c-1.983-7.367-8.783-12.467-16.433-12.467H17c-9.35,0-17,7.65-17,17    S7.65,55.231,17,55.231z"></path>
                                                <path fill="#ffffff" d="M135.433,438.298c21.25,0,38.533-17.283,38.533-38.533s-17.283-38.533-38.533-38.533S96.9,378.514,96.9,399.764    S114.183,438.298,135.433,438.298z"></path>
                                                <path fill="#ffffff" d="M376.267,438.298c0.85,0,1.983,0,2.833,0c10.2-0.85,19.55-5.383,26.35-13.317c6.8-7.65,9.917-17.567,9.35-28.05    c-1.417-20.967-19.833-37.117-41.083-35.7c-21.25,1.417-37.117,20.117-35.7,41.083    C339.433,422.431,356.15,438.298,376.267,438.298z"></path>
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
							<c:choose>
								<c:when test="${isLogOn==true and not empty memberInfo }">
									<div class="w--60 mt-2 w-100-xs float-start float-none-xs mt-2">
										<a href="#"
											class="btn-toggle btn btn-light h-100 d-flex justify-content-center align-items-center"
											data-toggle="tooltip" data-original-title="찜 리스트에 담기"
											data-toggle-ajax-url-on="${contextPath}/myaccount/addFav.do?product_id=${vo.product_id}"
											data-toast-success-message="찜 리스트에 담겼습니다."
											data-toast-success-position="bottom-center"> <!-- heart icon -->
											<i class="m-0 fi fi-heart-empty"></i> <!-- text : mobile only -->
											<span class="pl-3 pr-3 d-block d-sm-none"> 찜 리스트에 담기 </span>
										</a>

									</div>

								</c:when>
								<c:otherwise>
								<div class="w--60 mt-2 w-100-xs float-start float-none-xs mt-2">
									<a href="#"
										class="js-ajax-modal btn btn-light h-100 d-flex justify-content-center align-items-center"
										data-toggle="tooltip" data-original-title="찜 리스트에 담기"
										data-href="${contextPath }/resources/_ajax/modal_signin_md.jsp?product_id=${vo.product_id}"
										data-ajax-modal-size="modal-md"
										data-ajax-modal-backdrop="static"
										data-ajax-modal-centered="true"> <i
										class="m-0 fi fi-heart-empty"></i> <span
										class="pl-3 pr-3 d-block d-sm-none"> 찜 리스트에 담기 </span>
									</a>
									</div>
								</c:otherwise>

							</c:choose>


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
			src="${contextPath}/resources/images/item_image/${vo.product_detail_image}" />

	</div>
</section>
<!-- /SPECIFICATIONS -->

<!-- 상품 문의   Accordion -->

<section class="border-top">
	<div class="container">

		<div class="accordion" id="accordionShadow">
			<h2 class="h4 text-primary mb-4 mt-5">상품 문의 게시판</h2>
			<p class="lead mb-5">
				상품에 대한 문의를 남기는 공간입니다.<br> 배송관련, 주문(취소/교환/환불)관련 문의는 1:1문의에 남겨주세요
			</p>


			<div class="card shadow-md b-0 mb-2">
				<div class="card-header mb-0 p-0 b-0 bg-transparent"
					id="cleanHeadingOne">
					<h2 class="mb-0">
						<button style="background-color: lightgray;"
							class="btn btn-link btn-block btn-lg text-align-start text-decoration-none text-dark"
							type="button" data-toggle="collapse"
							data-target="#shadowCollapseOne" aria-expanded="true"
							aria-controls="shadowCollapseOne">
							<span
								style="text-align: center; display: inline-block; width: 10%;">글번호</span>
							<span style="display: inline-block; width: 55%;">글제목</span> <span
								style="text-align: center; display: inline-block; width: 15%;">작성자</span>
							<span
								style="text-align: center; display: inline-block; width: 15%;">작성일</span>

						</button>
					</h2>
				</div>

				<c:if test="${empty qnaList }">
					<div id="shadowCollapseOne" aria-labelledby="cleanHeadingOne"
						data-parent="#accordionShadow">
						<div class="card-body">
							<span>등록된 게시글이 없습니다.</span>
						</div>
					</div>
				</c:if>
			</div>

			<form method="post"
				action="${contextPath }/product/updateQnaForm.do?product_id=${vo.product_id}&product_qna_num=${qnaList[0].product_qna_num}">

				<c:if test="${not empty qnaList[0] }">
					<div class="card shadow-md b-0 mb-2">
						<div class="card-header mb-0 p-0 b-0 bg-transparent"
							id="cleanHeadingTwo">
							<h2 class="mb-0">
								<button
									class="btn btn-link btn-block btn-lg text-align-start text-decoration-none text-dark collapsed"
									type="button" data-toggle="collapse"
									data-target="#shadowCollapseTwo" aria-expanded="false"
									aria-controls="shadowCollapseTwo">
									<span
										style="text-align: center; display: inline-block; width: 10%;">
										<c:out value="${qnaList[0].rowNum}" />
									</span>
									<!--  	 <span style="display: inline-block; width: 10%;"> <c:out value="${qnaList[0].product_qna_num}" /></span> -->
									<c:if test="${qnaList[0].parent_num != 0 }">
										<span style="display: inline-block; width: 4%;"
											class="badge badge-soft badge-pill badge-indigo">RE</span>
										<span style="display: inline-block; width: 51%;"><c:out
												value="${qnaList[0].title}" /> </span>
									</c:if>
									<c:if test="${qnaList[0].parent_num == 0 }">
										<span style="display: inline-block; width: 55%;"><c:out
												value="${qnaList[0].title}" /> </span>
										<!-- ${qna.title } -->
									</c:if>
									<span
										style="text-align: center; display: inline-block; width: 15%;"><c:out
											value="${qnaList[0].member_id}" /></span>
									<!-- ${qna.member_id } -->
									<span
										style="text-align: center; display: inline-block; width: 15%;"><c:out
											value="${qnaList[0].reg_date}" /></span>
									<!-- ${qna.reg_date } -->
									<span class="group-icon float-end"> <i
										class="fi fi-arrow-start-slim"></i> <i
										class="fi fi-arrow-down-slim"></i>
									</span>
								</button>
							</h2>
						</div>


						<div id="shadowCollapseTwo" class="collapse"
							aria-labelledby="cleanHeadingTwo" data-parent="#accordionShadow">
							<div class="card-body">

								${qnaList[0].contents}
								<p>
									<c:if test="${not empty qnaList[0].image1 }">
										<img
											src="${contextPath}/product/qnaDownload.do?qna_image=${qnaList[0].image1}">
					1. ${qnaList[0].product_qna_num } 2. ${qnaList[0].image1}
					 <img
											src="${contextPath}/resources/images/product_qna/${qnaList[0].product_qna_num}/${qnaList[0].image1}">
									</c:if>
									<c:if test="${not empty qnaList[0].image2 }">
										<img
											src="${contextPath}/product/qnaDownload.do?qna_image=${qnaList[0].image2}">
									</c:if>
									<c:if test="${not empty qnaList[0].image3 }">
										<img
											src="${contextPath}/product/qnaDownload.do?qna_image=${qnaList[0].image3}">
									</c:if>
								</p>

								<p>
									<c:choose>
										<c:when test="${member_id=='admin' }">
											<a
												href="${contextPath }/product/insertQnaForm.do?product_id=${vo.product_id}&product_qna_num=${qnaList[0].product_qna_num}">
												<button style="float: right;" type="button"
													class="btn btn-purple btn-soft mb-1">답변</button>
											</a>

										</c:when>
										<c:otherwise>
											<button style="float: right;" type="submit"
												class="btn btn-purple btn-soft mb-1">수정</button>

											<a
												href="${contextPath }/product/deleteBoardQna.do?product_id=${vo.product_id}&product_qna_num=${qnaList[0].product_qna_num}">
												<button style="float: right;" type="button"
													class="btn btn-purple btn-soft mb-1">삭제</button>
											</a>

										</c:otherwise>
									</c:choose>
								</p>

							</div>
						</div>
					</div>
				</c:if>
			</form>

			<form method="post"
				action="${contextPath }/product/updateQnaForm.do?product_id=${vo.product_id}&product_qna_num=${qnaList[1].product_qna_num}">
				<c:if test="${not empty qnaList[1] }">
					<div class="card shadow-md b-0 mb-2">
						<div class="card-header mb-0 p-0 b-0 bg-transparent"
							id="cleanHeadingThree">
							<h2 class="mb-0">
								<button
									class="btn btn-link btn-block btn-lg text-align-start text-decoration-none text-dark collapsed"
									type="button" data-toggle="collapse"
									data-target="#shadowCollapseThree" aria-expanded="false"
									aria-controls="shadowCollapseThree">
									<span
										style="text-align: center; display: inline-block; width: 10%;">
										<c:out value="${qnaList[1].rowNum}" />
									</span>
									<!--  <span style="display: inline-block; width: 10%;"> <c:out value="${qnaList[1].product_qna_num}" /></span>  -->
									<c:if test="${qnaList[1].parent_num != 0 }">
										<span style="dispaly: inline-block; width: 4%;"
											class="badge badge-soft badge-pill badge-indigo">RE</span>
										<span style="display: inline-block; width: 51%;"><c:out
												value="${qnaList[1].title}" /> </span>
									</c:if>
									<c:if test="${qnaList[1].parent_num == 0 }">
										<span style="display: inline-block; width: 55%;"><c:out
												value="${qnaList[1].title}" /> </span>
									</c:if>
									<!-- ${qna.title } -->
									<span
										style="text-align: center; display: inline-block; width: 15%;"><c:out
											value="${qnaList[1].member_id}" /></span>
									<!-- ${qna.member_id } -->
									<span
										style="text-align: center; display: inline-block; width: 15%;"><c:out
											value="${qnaList[1].reg_date}" /></span>
									<!-- ${qna.reg_date } -->
									<span class="group-icon float-end"> <i
										class="fi fi-arrow-start-slim"></i> <i
										class="fi fi-arrow-down-slim"></i>
									</span>
								</button>
							</h2>
						</div>

						<div id="shadowCollapseThree" class="collapse"
							aria-labelledby="cleanHeadingThree"
							data-parent="#accordionShadow">
							<div class="card-body">

								${qnaList[1].contents}

								<p>
									<c:if test="${not empty qnaList[1].image1 }">
										<img
											src="${contextPath}/product/qnaDownload.do?qna_image=${qnaList[1].image1}">
									</c:if>
									<c:if test="${not empty qnaList[1].image2 }">
										<img
											src="${contextPath}/product/qnaDownload.do?qna_image=${qnaList[1].image2}">
									</c:if>
									<c:if test="${not empty qnaList[1].image3 }">
										<img
											src="${contextPath}/product/qnaDownload.do?qna_image=${qnaList[1].image3}">
									</c:if>
								</p>

								<p>
									<c:choose>
										<c:when test="${member_id=='admin' }">
											<a
												href="${contextPath }/product/insertQnaForm.do?product_id=${vo.product_id}&product_qna_num=${qnaList[1].product_qna_num}">
												<button style="float: right;" type="button"
													class="btn btn-purple btn-soft mb-1">답변</button>
											</a>
										</c:when>
										<c:otherwise>
											<button style="float: right;" type="submit"
												class="btn btn-purple btn-soft mb-1">수정</button>

											<a
												href="${contextPath }/product/deleteBoardQna.do?product_id=${vo.product_id}&product_qna_num=${qnaList[1].product_qna_num}">
												<button style="float: right;" type="button"
													class="btn btn-purple btn-soft mb-1">삭제</button>
											</a>

										</c:otherwise>
									</c:choose>
								</p>
							</div>
						</div>
					</div>
				</c:if>
			</form>

			<form method="post"
				action="${contextPath }/product/updateQnaForm.do?product_id=${vo.product_id}&product_qna_num=${qnaList[2].product_qna_num}">
				<c:if test="${not empty qnaList[2] }">
					<div class="card shadow-md b-0 mb-2">
						<div class="card-header mb-0 p-0 b-0 bg-transparent"
							id="cleanHeadingFour">
							<h2 class="mb-0">
								<button
									class="btn btn-link btn-block btn-lg text-align-start text-decoration-none text-dark collapsed"
									type="button" data-toggle="collapse"
									data-target="#shadowCollapseFour" aria-expanded="false"
									aria-controls="shadowCollapseFour">
									<span
										style="text-align: center; display: inline-block; width: 10%;">
										<c:out value="${qnaList[2].rowNum}" />
									</span>
									<!--  	 <span style="display: inline-block; width: 10%;"> <c:out value="${qnaList[2].product_qna_num}" /></span>-->
									<!-- ${qna.product_qna_num } -->
									<c:if test="${qnaList[2].parent_num != 0 }">
										<span style="display: inline-block; width: 4%;"
											class="badge badge-soft badge-pill badge-indigo">RE</span>
										<span style="display: inline-block; width: 51%;"><c:out
												value="${qnaList[2].title}" /> </span>
									</c:if>
									<c:if test="${qnaList[2].parent_num == 0 }">
										<span style="display: inline-block; width: 55%;"><c:out
												value="${qnaList[2].title}" /> </span>
										<!-- ${qna.title } -->
									</c:if>
									<span
										style="text-align: center; display: inline-block; width: 15%; text-align: center;"><c:out
											value="${qnaList[2].member_id}" /></span>
									<!-- ${qna.member_id } -->
									<span
										style="text-align: center; display: inline-block; width: 15%;"><c:out
											value="${qnaList[2].reg_date}" /></span>
									<!-- ${qna.reg_date } -->
									<span class="group-icon float-end"> <i
										class="fi fi-arrow-start-slim"></i> <i
										class="fi fi-arrow-down-slim"></i>
									</span>
								</button>
							</h2>
						</div>

						<div id="shadowCollapseFour" class="collapse"
							aria-labelledby="cleanHeadingFour" data-parent="#accordionShadow">
							<div class="card-body">

								${qnaList[2].contents}

								<p>
									<c:if test="${not empty qnaList[2].image1 }">
										<img
											src="${contextPath}/product/qnaDownload.do?qna_image=${qnaList[2].image1}">
									</c:if>
									<c:if test="${not empty qnaList[2].image2 }">
										<img
											src="${contextPath}/product/qnaDownload.do?qna_image=${qnaList[2].image2}">
									</c:if>
									<c:if test="${not empty qnaList[2].image3 }">
										<img
											src="${contextPath}/product/qnaDownload.do?qna_image=${qnaList[2].image3}">
									</c:if>
								</p>

								<p>
									<c:choose>
										<c:when test="${member_id=='admin' }">
											<a
												href="${contextPath }/product/insertQnaForm.do?product_id=${vo.product_id}&product_qna_num=${qnaList[2].product_qna_num}">
												<button style="float: right;" type="button"
													class="btn btn-purple btn-soft mb-1">답변</button>
											</a>
										</c:when>
										<c:otherwise>
											<button style="float: right;" type="submit"
												class="btn btn-purple btn-soft mb-1">수정</button>

											<a
												href="${contextPath }/product/deleteBoardQna.do?product_id=${vo.product_id}&product_qna_num=${qnaList[2].product_qna_num}">
												<button style="float: right;" type="button"
													class="btn btn-purple btn-soft mb-1">삭제</button>
											</a>

										</c:otherwise>
									</c:choose>
								</p>

							</div>
						</div>
					</div>
				</c:if>
			</form>





			<!-- 글쓰기 -->
			<div>
				<br>
				<br> <a
					href="${contextPath }/product/insertQnaForm.do?product_id=${vo.product_id}">
					<button style="float: right;" type="button"
						class="btn btn-purple btn-soft mb-1">상품문의</button>
				</a> <br>
				<br>

			</div>
			<!-- 글쓰기 -->

			<!-- 
         <button style="float: right;"type="button" class="btn btn-purple btn-soft mb-1">  </button>
          -->

			<!-- pagination -->
			<div>
				<nav aria-label="pagination" class="mt-5">
					<ul
						class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">
						<%--[이전으로] 사용불가 또는 안보이게 : 첫번째 블록인경우 --%>
						<c:if test="${pvo.beginPage == 1}">
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true">Previous</a></li>
						</c:if>
						<c:if test="${pvo.beginPage != 1}">
							<li class="page-item"><a class="page-link"
								href="${contextPath}/product/productDetail.do?product_id=${vo.product_id }&cPage=${pvo.beginPage - 1 }">Previous</a>
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
									href="${contextPath}/product/productDetail.do?product_id=${vo.product_id }&cPage=${pageNo}">${pageNo }</a>
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
								href="${contextPath}/product/productDetail.do?product_id=${vo.product_id }&cPage=${pvo.endPage +1}">Next</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
			<!-- pagination -->

		</div>
</section>


<!-- 상품 후기 -->
<section class="border-top">
   <div class="container">
   
<div class="accordion" id="accordionShadow">
	 <h2 class="h4 text-primary mb-4 mt-5">상품 후기 게시판</h2>
         <p class="lead mb-5">
         	   상품에 대한 후기를 남기는 공간입니다.<br>
         	   배송관련, 주문(취소/교환/환불)관련 문의는 1:1문의에 남겨주세요
         </p>


	<div class="card shadow-md b-0 mb-2">
		<div class="card-header mb-0 p-0 b-0 bg-transparent" id="cleanHeadingOne">
			<h2 class="mb-0">
				<button style="background-color: lightgray;" class="btn btn-link btn-block btn-lg text-align-start text-decoration-none text-dark" 
						type="button" data-toggle="collapse" data-target="#shadowCollapseOne" aria-expanded="true" aria-controls="shadowCollapseOne">
					 <span style="text-align: center;display: inline-block; width: 10%;">글번호</span> <span
                        style="display: inline-block; width: 55%;">글제목</span> <span
                        style="text-align: center;display: inline-block; width: 15%;">작성자</span> <span
                        style="text-align: center;display: inline-block; width: 15%;">작성일</span>
					
				</button>
			</h2>
		</div>
		
		 <c:if test="${empty reviewList }">
		<div id="shadowCollapseOne"  aria-labelledby="cleanHeadingOne" data-parent="#accordionShadow">
			<div class="card-body">
				 <span>등록된 게시글이 없습니다.</span> 
			</div>
		</div>
		</c:if>
	</div>

<form method="post" 
	action="${contextPath }/product/updateQnaForm.do?product_id=${vo.product_id}&product_qna_num=${qnaList[0].product_qna_num}">

	 <c:if test="${not empty reviewList[0] }">
	<div class="card shadow-md b-0 mb-2">
		<div class="card-header mb-0 p-0 b-0 bg-transparent" id="cleanHeadingTwo">
			<h2 class="mb-0">
				<button class="btn btn-link btn-block btn-lg text-align-start text-decoration-none text-dark collapsed" 
						type="button" data-toggle="collapse" data-target="#shadowCollapseTwo" aria-expanded="false" aria-controls="shadowCollapseTwo">
					 <span style="text-align: center;display: inline-block; width: 10%;"> <c:out value="${reviewList[0].rowNum}" /></span> 
	                 <span style="display: inline-block; width: 55%;"><c:out value="${reviewList[0].title}" /> </span> <!-- ${qna.title } -->
	                 <span style="text-align: center; display: inline-block; width: 15%;"><c:out value="${reviewList[0].member_id}" /></span> <!-- ${qna.member_id } -->
	                 <span style="text-align: center;display: inline-block; width: 15%;"><c:out value="${reviewList[0].reg_date}" /></span> <!-- ${qna.reg_date } -->
					<span class="group-icon float-end">
						<i class="fi fi-arrow-start-slim"></i>
						<i class="fi fi-arrow-down-slim"></i>
					</span>
				</button>
			</h2>
		</div>

		<div id="shadowCollapseTwo" class="collapse" aria-labelledby="cleanHeadingTwo" data-parent="#accordionShadow">
			<div class="card-body">
			
				${reviewList[0].contents}
				<p>
					<c:if test="${not empty reviewList[0].image1 }">
					 <img src="${contextPath}/resources/images/review/${reviewList[0].image1}">
					</c:if>
					<c:if test="${not empty reviewList[0].image2 }">
					 <img src="${contextPath}/resources/images/review/${reviewList[0].image2}">
					</c:if>
					<c:if test="${not empty reviewList[0].image3 }">
					 <img src="${contextPath}/resources/images/review/${reviewList[0].image3}">
					</c:if>
				</p>
				
				<p>
				   <c:choose>
				   	<c:when test="${member_id=='admin' }">
				   		
				   			<button style="float: right;"type="button" class="btn btn-purple btn-soft mb-1">
			               		답변
			            	</button>
			           
			           
				   	</c:when>
				   	<c:otherwise>
						  <button style="float: right;"type="submit" class="btn btn-purple btn-soft mb-1">
			               	수정
			            </button>
	         		
			            	<button style="float: right;"type="button" class="btn btn-purple btn-soft mb-1">
			               	삭제
			            	</button>
				   	
				   	</c:otherwise>
				   </c:choose>
		        </p>	
		        
			</div>
		</div>
	</div>
	</c:if>
</form>

<form method="post" 
	action="${contextPath }/product/updateQnaForm.do?product_id=${vo.product_id}&product_qna_num=${qnaList[1].product_qna_num}">	
	 <c:if test="${not empty reviewList[1] }">
	<div class="card shadow-md b-0 mb-2">
		<div class="card-header mb-0 p-0 b-0 bg-transparent" id="cleanHeadingThree">
			<h2 class="mb-0">
				<button class="btn btn-link btn-block btn-lg text-align-start text-decoration-none text-dark collapsed" type="button" 
				data-toggle="collapse" data-target="#shadowCollapseThree" aria-expanded="false" aria-controls="shadowCollapseThree">
					  <span style="text-align: center;display: inline-block; width: 10%;"> <c:out value="${reviewList[1].rowNum}" /></span> 
	                  <span style="display: inline-block; width: 55%;"><c:out value="${reviewList[1].title}" /> </span>
	                 <span style="text-align: center;display: inline-block; width: 15%;"><c:out value="${reviewList[1].member_id}" /></span> <!-- ${qna.member_id } -->
	                 <span style="text-align: center;display: inline-block; width: 15%;"><c:out value="${reviewList[1].reg_date}" /></span> <!-- ${qna.reg_date } -->
					<span class="group-icon float-end">
						<i class="fi fi-arrow-start-slim"></i>
						<i class="fi fi-arrow-down-slim"></i>
					</span>
				</button>
			</h2>
		</div>

		<div id="shadowCollapseThree" class="collapse" aria-labelledby="cleanHeadingThree" data-parent="#accordionShadow">
			<div class="card-body">
				
				 ${reviewList[1].contents}
				
				<p>
					<c:if test="${not empty reviewList[1].image1 }">
					 <img src="${contextPath}/resources/images/review/${reviewList[1].image1}">
					</c:if>
					<c:if test="${not empty reviewList[1].image2 }">
					 <img src="${contextPath}/resources/images/review/${reviewList[1].image2}">
					</c:if>
					<c:if test="${not empty reviewList[1].image3 }">
					 <img src="${contextPath}/resources/images/review/${reviewList[1].image3}">
					</c:if>
				</p>
				
				<p>
				   <c:choose>
				   	<c:when test="${member_id=='admin' }">
				   			<button style="float: right;"type="button" class="btn btn-purple btn-soft mb-1">
			               		답변
			            	</button>
				   	</c:when>
				   	<c:otherwise>
						  <button style="float: right;"type="submit" class="btn btn-purple btn-soft mb-1">
			               	수정
			            	</button>
	         		
			            	<button style="float: right;"type="button" class="btn btn-purple btn-soft mb-1">
			               	삭제
			            	</button>
				   	
				   	</c:otherwise>
				   </c:choose>
		        </p>	
			</div>
		</div>
	</div>
	</c:if>
</form>

<form method="post" 
	action="${contextPath }/product/updateQnaForm.do?product_id=${vo.product_id}&product_qna_num=${qnaList[2].product_qna_num}">		
	 <c:if test="${not empty reviewList[2] }">
	<div class="card shadow-md b-0 mb-2">
		<div class="card-header mb-0 p-0 b-0 bg-transparent" id="cleanHeadingFour">
			<h2 class="mb-0">
				<button class="btn btn-link btn-block btn-lg text-align-start text-decoration-none text-dark collapsed" type="button" 
					data-toggle="collapse" data-target="#shadowCollapseFour" aria-expanded="false" aria-controls="shadowCollapseFour">
					 <span style="text-align: center;display: inline-block; width: 10%;"> <c:out value="${reviewList[2].rowNum}" /></span> 
	                 <span style="display: inline-block; width: 55%;"><c:out value="${reviewList[2].title}" /> </span> <!-- ${qna.title } -->
	                 <span style="text-align: center;display: inline-block; width: 15%; text-align: center;"><c:out value="${reviewList[2].member_id}" /></span> <!-- ${qna.member_id } -->
	                 <span style="text-align: center;display: inline-block; width: 15%;"><c:out value="${reviewList[2].reg_date}" /></span> <!-- ${qna.reg_date } -->
					<span class="group-icon float-end">
						<i class="fi fi-arrow-start-slim"></i>
						<i class="fi fi-arrow-down-slim"></i>
					</span>
				</button>
			</h2>
		</div>

		<div id="shadowCollapseFour" class="collapse" aria-labelledby="cleanHeadingFour" data-parent="#accordionShadow">
			<div class="card-body">
				
				 ${qnaList[2].contents}
				
				<p>
					<c:if test="${not empty reviewList[2].image1 }">
					 <img src="${contextPath}/resources/images/review/${reviewList[2].image1}">
					</c:if>
					<c:if test="${not empty reviewList[2].image2 }">
					 <img src="${contextPath}/resources/images/review/${reviewList[2].image2}">
					</c:if>
					<c:if test="${not empty reviewList[2].image3 }">
					 <img src="${contextPath}/resources/images/review/${reviewList[2].image3}">
					</c:if>
				</p>
				
				<p>
				   <c:choose>
				   	<c:when test="${member_id=='admin' }">
				   			<button style="float: right;"type="button" class="btn btn-purple btn-soft mb-1">
			               		답변
			            	</button>
				   	</c:when>
				   	<c:otherwise>
						  <button style="float: right;"type="submit" class="btn btn-purple btn-soft mb-1">
			               	수정
			            	</button>
	         		
			            	<button style="float: right;"type="button" class="btn btn-purple btn-soft mb-1">
			               	삭제
			            	</button>
				   	
				   	</c:otherwise>
				   </c:choose>
		        </p>	
		        
			</div>
		</div>
	</div>
	</c:if>
</form>
	
      
      
      
      
      <!-- 글쓰기 -->
      <div>
         <br><br>
         <a href="${contextPath}/product/insertReviewForm.do?product_id=${vo.product_id}" >
        	<button style="float: right;"type="button" class="btn btn-purple btn-soft mb-1">  
              	 상품후기
          	</button>
          </a>
         <br><br>
      </div>
      <!-- 글쓰기 -->
      
         <!-- 
         <button style="float: right;"type="button" class="btn btn-purple btn-soft mb-1">  </button>
          -->
      
      <!-- pagination -->
                     <div>
                     <nav aria-label="pagination" class="mt-5">
                        <ul class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">
                        <%--[이전으로] 사용불가 또는 안보이게 : 첫번째 블록인경우 --%>
                        <c:if test="${rePvo.beginPage == 1}">
                           <li class="page-item disabled">
                              <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                           </li>
                        </c:if>
                        <c:if test="${rePvo.beginPage != 1}">   
                           <li class="page-item">
                              <a class="page-link" href="${contextPath}/product/productDetail.do?product_id=${vo.product_id }&cPage=${pvo.beginPage - 1 }&nPage=${rePvo.beginPage-1}">Previous</a>
                           </li>
                        </c:if>
                        
                        <%-- 페이지 표시(시작페이지~끝페이지) --%>
                        <c:forEach var="pageNo" begin="${rePvo.beginPage }" end="${rePvo.endPage }">
                        <c:if test="${pageNo == rePvo.nowPage }">
                           <li class="page-item active">
                              <a class="page-link" href="#">${pageNo } <span class="sr-only">??</span></a>
                           </li>
                        </c:if>
                        <c:if test="${pageNo != rePvo.nowPage }">
                           <li class="page-item" aria-current="page">
                              <a class="page-link" href="${contextPath}/product/productDetail.do?product_id=${vo.product_id }&cPage=${pageNo}&nPag=${pageNo }e">${pageNo }</a>
                           </li>
                        </c:if>
                        </c:forEach>
                        
                        <%--[다음으로] 사용여부 처리 --%>
                        <c:if test="${rePvo.endPage >= rePvo.totalPage }">   
                           <li class="page-item disabled">
                              <a class="page-link">다음으로 </a>
                           </li>
                        </c:if> 
                        
                        <c:if test="${rePvo.endPage < rePvo.totalPage }">
                        
                           <li class="page-item">
                              <a class="page-link" href="${contextPath}/product/productDetail.do?product_id=${vo.product_id }&cPage=${pvo.endPage +1}&nPage=${rePvo.endPage +1}">Next</a>
                           </li>
                        </c:if>
                        </ul>
                     </nav>
                     </div>
                     <!-- pagination -->
      
   </div>
</section>




<!-- /#wrapper -->

<script src="${contextPath}/resources/assets/js/core.min.js"></script>


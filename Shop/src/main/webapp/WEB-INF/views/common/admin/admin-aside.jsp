<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />




				<!-- 

					SIDEBAR 

						Example gradients:
							.aside-primary
							.bg-gradient-default
							.bg-gradient-purple
							etc

							* Footer should also match
				-->
				<aside id="aside-main" class="aside-start aside-primary aside-hide-xs d-flex flex-column h-auto">


					<!-- 
						LOGO 
						visibility : desktop only
					-->
					<div class="d-none d-sm-block">
						<div class="clearfix d-flex justify-content-between">

							<!-- Logo : height: 60px max -->
							<a class="w-100 align-self-center navbar-brand p-3" href="${contextPath}/main/main.do">
								<img src="${contextPath}/resources/assets/images/logo/logo_light.svg" width="110" height="60" alt="...">
							</a>

						</div>
					</div>
					<!-- /LOGO -->


					<div class="aside-wrapper scrollable-vertical scrollable-styled-light align-self-baseline h-100 w-100">

						<!--

							All parent open navs are closed on click!
							To ignore this feature, add .js-ignore to .nav-deep
		
							Links height (paddings):
								.nav-deep-xs
								.nav-deep-sm
								.nav-deep-md  	(default, ununsed class)

							.nav-deep-hover 	hover background slightly different
							.nav-deep-bordered	bordered links


							++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
							IMPORTANT NOTE:
								Curently using ajax navigation!
								remove .js-ajax class to have regular links!
							++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
						-->
						<nav class="nav-deep nav-deep-dark nav-deep-hover pb-5">
							<ul class="nav flex-column">

								<li class="nav-item active">
									<a class="nav-link" href="${contextPath}/admin/main.do">
										<i class="fi fi-menu-dots"></i>
										요약
									</a>
								</li>

								<li class="nav-item">
									<a class="nav-link" href="${contextPath}/admin/member/memberList.do">
										<i class="fi fi-users"></i>
										회원관리
									</a>
								</li>


									<li class="nav-item">
										<a class="nav-link" href="#">
											<span class="group-icon float-end">
												<i class="fi fi-arrow-end-slim"></i>
												<i class="fi fi-arrow-down-slim"></i>
											</span>
											<i class="fi fi-shape-3dots"></i>
											상품관리
										</a>

										<ul class="nav flex-column fs--15">

											<li class="nav-item">
												<a class="nav-link js-ajax" href="util-text-backgrounds.html">
													상품목록
												</a>
											</li>
											<li class="nav-item">
												<a class="nav-link js-ajax" href="util-borders.html">
													상품입력
												</a>
											</li>

											<li class="nav-item">
												<a class="nav-link js-ajax" href="util-font.html">
													상품 카테고리
												</a>
											</li>											

										</ul>
									</li>



									<li class="nav-item">
										<a class="nav-link" href="#">
											<span class="group-icon float-end">
												<i class="fi fi-arrow-end-slim"></i>
												<i class="fi fi-arrow-down-slim"></i>
											</span>
											<i class="fi fi-layers"></i>
											주문관리
										</a>

										<ul class="nav flex-column fs--15">

											<li class="nav-item">
												<a class="nav-link js-ajax" href="plugins-vendor-bootstrap-select.html">
													주문내역
												</a>
											</li>
											<li class="nav-item">
												<a class="nav-link js-ajax" href="plugins-vendor-flickity.html">
													배송관리
												</a>
											</li>

										</ul>
									</li>






								<li class="nav-title mt-5">
									<h6 class="fs--15 mb-1 text-white font-weight-normal">고객센터</h6>
								</li>
								<li class="nav-item">
									<a class="nav-link js-ajax" href="#">
										<i class="fi fi-loud"></i>
										공지사항
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link js-ajax" href="">
										<i class="fi fi-task-list"></i>
										질문카테고리
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link js-ajax" href="">
										<i class="fi fi-squared-info"></i>
										자주하는 질문
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link js-ajax" href="">
										<i class="fi fi-box"></i>
										상품 문의
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link js-ajax" href="">
										<i class="fi fi-support-headphones"></i>
										1:1 문의
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link js-ajax" href="">
										<i class="fi fi-squared-minus"></i>
										배너
									</a>
								</li>




								<li class="nav-title mt-5">
									<h6 class="fs--15 mb-1 text-white font-weight-normal">로그</h6>
								</li>

								<li class="nav-item">
									
									<a class="nav-link text-white" href="../layout_1/index.html">
										<i class="nav-icon fi fi-check text-success"><!-- main icon --></i>
										<span class="badge opacity-2 font-weight-light float-end fs--11 mt-1">layout_1</span>
										Log
									</a>

								</li>

							</ul>
						</nav>

					</div>
				</aside>
				<!-- /SIDEBAR -->
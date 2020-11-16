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
<body class="layout-admin aside-sticky header-sticky">

		<div id="wrapper" class="d-flex align-items-stretch flex-column">

			<div id="wrapper_content" class="d-flex flex-fill">


				<!-- MIDDLE -->
				<div id="middle" class="flex-fill">

					<!--

						PAGE TITLE
					-->
					<div class="page-title bg-transparent b-0">

						<h1 class="h4 mt-4 mb-0 px-3 font-weight-normal">
							계정 설정
						</h1>
						
					</div>




					<form novalidate class="bs-validate d-block mb-7" method="post" action="#" enctype="multipart/form-data">
						
						<div class="row gutters-sm mb-3">
							




							<div class="col-12 mb-3">

								<!-- portlet -->
								<div class="portlet">

									<!-- portlet : header -->
									<div class="portlet-header">
										<span class="d-block text-dark text-truncate font-weight-medium">
											회원정보
										</span>
									</div>
									<!-- /portlet : header -->


									<!-- portlet : body -->
									<div class="portlet-body">

										<div class="row gutters-sm d-flex align-items-center">

											<div class="col-12 col-md-6">

												<div class="form-label-group mt-3">
													<input required id="member_id" name="member_id" type="text" value="${member_info.member_id }" class="form-control">
													<label for="member_id">아이디</label>
												</div>

											</div>

											<div class="col-12 col-md-6">

												<div class="form-label-group mt-3">
													<input required id="member_name" name="member_name" type="text" value="${member_info.member_name }" class="form-control" >
													<label for="member_name">이름</label>
												</div>

											</div>

											<div class="col-12 col-md-6">

												<div class="form-label-group mt-3">
													<input id="email" name="email" type="email" value="${member_info.email }" class="form-control">
													<label for="email">이메일</label>
												</div>

											</div>

											<div class="col-12 col-md-6">

												<div class="form-label-group mt-3">
													<input id="phone" name="phone" type="tel" value="${member_info.phone }" class="form-control">
													<label for="account_phone_number">휴대폰 번호</label>
												</div>

											</div>

											<div class="col-12 col-md-6">

												<div class="form-label-group mt-3">
													<input id="member_date" name="member_date" type="date" value="${member_info.member_date }" class="form-control">
													<label for="member_date">가입일</label>
												</div>

											</div>

											<div class="col-12 col-md-6">

												<div class="form-label-group mt-3">
													<input id="birthday" name="birthday" type="date" value="${member_info.birthday }" class="form-control">
													<label for="birthday">생일</label>
												</div>

											</div>


											<div class="col-12 col-md-6">

												<div class="form-label-group mt-3">
													<input id="point" name="point" type="number" value="${member_info.point }" class="form-control">
													<label for="point">포인트</label>
												</div>

											</div>

											<div class="col-12 col-md-3">

												<div class="form-label-group mt-3">
													<input class="form-control" type="text"  id="member_grade" data-toggle="dropdown" aria-expanded="true" 
													<c:choose>
													<c:when test="${member_info.member_id eq 'admin' }">
													value="관리자"
													</c:when>
													<c:when test="${member_info.pre_score >10000}">
													value="우수회원"
													</c:when>
													<c:otherwise>
													value="일반회원"
													</c:otherwise>
													</c:choose>
													readonly>													
													<label for ="member_grade">회원등급</label>
												</div>

											</div>

											<div class="col-12 col-md-3">

												<div class="form-label-group mt-3">
													<input id="this_score" name="this_score" type="number" value="${member_info.this_score }" class="form-control" readonly>
													<label for="this_score">실적</label> 
												</div>

											</div>

											<div class="col-12">

												<div class="form-label-group mt-3">
													<input placeholder="address" id="address" name="address" type="text" value="" class="form-control">
													<label for="address">주소</label>
												</div>

											</div>

										</div>

									</div>
									<!-- /portlet : body -->

								</div>
								<!-- /portlet -->

							</div>

						</div>


						<button type="submit" class="btn btn-primary">
							<i class="fi fi-check"></i>
							회원정보 변경
						</button>
						<!-- 회원삭제 버튼 -->
										<a 	href="${contextPath}/admin/member/deleteMember.do?member_id=${member_info.member_id}"										
											class="js-ajax-confirm btn btn-danger"

											data-ajax-confirm-size="modal-md" 
											data-ajax-confirm-centered="false" 

											data-ajax-confirm-callback-function=""
											data-ajax-confirm-mode="ajax" 
											data-ajax-confirm-method="GET" 

											data-ajax-confirm-title="Please Confirm" 
											data-ajax-confirm-body="Are you sure? Delete this item?" 

											data-ajax-confirm-btn-yes-text="Confirm" 
											data-ajax-confirm-btn-yes-class="btn-sm btn-danger" 
											data-ajax-confirm-btn-yes-icon="fi fi-check" 

											data-ajax-confirm-btn-no-text="Cancel" 
											data-ajax-confirm-btn-no-class="btn-sm btn-light" 
											data-ajax-confirm-btn-no-icon="fi fi-close"

											rel="nofollow">
												<i class="fi fi-shield-ok"></i>
												회원삭제
										</a>
						


					</form>





					<!-- PASSWORD RESET -->
					<div class="row gutters-sm mb-3">
						
						<div class="col-12 mb-3">


							<!-- portlet -->
							<div class="portlet">

								<!-- portlet : body -->
								<div class="portlet-body">

									<a id="passwordResetToggler" href="#passwordForm" data-toggle="collapse" class="btn-toggle btn btn-light scroll-to" data-offset="-300" data-speed="600" data-toggle-target="#passwordResetToggler" data-toggle-container-class="hide">
										<i class="fi fi-locked"></i>
										비밀번호 변경
									</a>

									<div id="passwordForm" class="collapse">

										<form novalidate class="bs-validate row" method="post" action="#">

											<div class="col-12 col-md-6 mb-3">
								
												<!-- portlet : header -->
												<div class="portlet-header pt-0 pb-5">
													<span class="d-block text-dark text-truncate font-weight-medium">
														회원 비밀번호
													</span>
												</div>
												<!-- /portlet : header -->

												<div class="row gutters-sm">

													<div class="col-12 col-xl-6 mb-3">

														<!-- new password -->
														<div class="input-group-over">
															<div class="form-label-group mb-3">
																<input required placeholder="New Password" id="account_new_password" name="account[current_password]" type="password" class="form-control">
																<label for="account_new_password">
																	<span class="text-danger">New</span>  비밀번호
																</label>
															</div>

															<!-- Show Password -->
															<a href="#" class="btn btn-password-type-toggle" data-target="#account_new_password" tabindex="-1">
																<span class="group-icon">
																	<i class="fi fi-eye m-0"></i>
																	<i class="fi fi-close m-0"></i>
																</span>
															</a>
														</div>
														<!-- /new password -->

													</div>

												</div>


												<button type="submit" class="btn btn-warning mb-3 d-block-xs w-100-xs">
													<i class="fi fi-check"></i>
													비밀번호 변경하기
												</button>


												<a id="passwordResetCancel" href="#passwordForm" data-toggle="collapse" class="btn-toggle btn btn-light mb-3 d-block-xs w-100-xs" data-toggle-temporized="10" data-toggle-target="#passwordResetToggler" data-toggle-container-class="hide active">
													<i class="fi fi-close"></i>
													취소
												</a>

											</div>


										</form>

									</div>

								</div>
								<!-- /portlet : body -->

							</div>
							<!-- /portlet -->


						</div>

					</div>
					<!-- /PASSWORD RESET -->

				</div>
				<!-- /MIDDLE -->

			</div>



			
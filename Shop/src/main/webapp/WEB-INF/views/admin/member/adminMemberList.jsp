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
							회원관리
						</h1>
						
					</div>




					<!-- PAGE LIST -->
					<div class="clearfix">
					
						<!-- portlet -->
						<div class="portlet">
							
							<!-- portlet : header -->
							<div class="portlet-header border-bottom">
							<form class="float-end row" method="get" action="#">
							<!-- 옵션으로 검색 -->
									<div class="row gutters-xs">

										<div class="col-6 col-lg-6">

											<div class="form-label-group mb-4">
												<select id="search" class="form-control bs-select" title="Bathrooms">
													<option value="0" selected="">ID</option>
													<option value="2">이름</option>
													<option value="3">등급</option>
												</select>
												<label for="s_baths">검색옵션</label>
											</div>

										</div>

										<div class="col-12 col-lg-6">

											<div class="form-label-group mb-4">
												<input placeholder="Max. Price" id="s_max_price" type="text" value="" class="form-control">
												<label for="s_max_price">입력</label>
											</div>

										</div>

									</div>
							<!-- 옵션으로 검색 끝 -->
							<!-- 날짜로 검색 -->
							<div class="float-end col-6 col-lg-5">
								<input autocomplete="off" type="text" name="my_daterange"
									class="form-control rangepicker" data-placement="left"
									data-ranges="false" data-date-start="01/16/2019"
									data-date-end="01/28/2019" data-date-format="MM/DD/YYYY"
									data-quick-locale='{
														"lang_apply"	: "검색",
														"lang_cancel"	: "취소",
														"lang_crange"	: "Custom Range",
														"lang_months" 	: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
														"lang_weekdays" : ["일", "월", "화", "수", "목", "금", "토"]
													}'>

							</div>
							<!-- 날짜로 검색 끝 -->
							
							
							</form>


					</div>
					<!-- /portlet : header -->


							<!-- portlet : body -->
							<div class="portlet-body pt-0">


								<form novalidate class="bs-validate" id="form_id" method="post" action="#!">


									<!-- 

										IMPORTANT
										The "action" hidden input is updated by javascript according to button params/action:
											data-js-form-advanced-hidden-action-id="#action"
											data-js-form-advanced-hidden-action-value="delete"

										In your backend, should process data like this (PHP example):

											if($_POST['action'] === 'delete') {

												foreach($_POST['item_id'] as $item_id) {
													// ... delete $item_id from database
												}

											}

									-->
									<input type="hidden" id="action" name="action" value=""><!-- value populated by js -->



									<div class="table-responsive">

										<table class="table table-align-middle border-bottom mb-6">

											<thead>
												<tr class="text-muted fs--13">
													<th class="w--30 hidden-lg-down">
<!-- 														<label class="form-checkbox form-checkbox-primary float-start">
															<input class="checkall" data-checkall-container="#item_list" type="checkbox" name="checkbox">
															<i></i>
														</label> -->
													</th>
													<span class="px-2 p-0-xs"></span>
													<th class="w--80 ">번호</th>
													<th class="w--150 ">아이디</th>
													<th class="w--150 ">이름</th>
													<th class="w--250 ">이메일</th>
													<th class="w--100 ">등급</th>
													<th class="w--100 ">상태</th>
													<th class="w--200 ">가입일</th>
													<th class="w--60">&nbsp;</th>
												</tr>
											</thead>

										<tbody id="item_list">
											<c:choose>
												<c:when test="${empty member_list}">
													<tr>
														<td colspan=5 class="fixed"><strong>조회된 회원이
																없습니다.</strong></td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach var="item" items="${member_list}" varStatus="item_num">
													<!-- item -->
														<tr id="message_id_2" class="text-muted">

															<!-- 체크박스 -->
															<td>
<!-- 															<label
																class="form-checkbox form-checkbox-secondary float-start">
																	<input type="checkbox" name="item_id[]" value="2">
																	<i></i>
															</label> -->
															</td>



															<td>${item_num.count}</td>
															<td><a href="${contextPath}/admin/member/memberDetail.do?member_id=${item.member_id}" class="font-weight-medium text-muted mx-2 m-0-xs">
															${item.member_id}</a>
															</td>
															<td><a href="${contextPath}/admin/member/memberDetail.do?member_id=${item.member_id}" class="font-weight-medium text-muted mx-2 m-0-xs">
															${item.member_name}
															</a></td>
															<td>${item.email}</td>
															<td><small
																class="badge badge-danger font-medium text-uppercase">우수회원</small>
															</td>

															<!-- 상태 -->
															<td>일반</td>

															<td>${item.member_date}</td>

<!-- 															
														<!-- /item -->
														</c:forEach>
														</c:otherwise>
														</c:choose>														
														
										</tbody>

										<tfoot>
												<tr class="text-muted fs--13">
													<th class="w--30 hidden-lg-down">
<!-- 														<label class="form-checkbox form-checkbox-primary float-start">
															<input class="checkall" data-checkall-container="#item_list" type="checkbox" name="checkbox">
															<i></i> -->
														</label>
													</th>
													<span class="px-2 p-0-xs"></span>
													<th class="w--80 ">번호</th>
													<th class="w--150 ">아이디</th>
													<th class="w--150 ">이름</th>
													<th class="w--250 ">이메일</th>
													<th class="w--100 ">등급</th>
													<th class="w--100 ">상태</th>
													<th class="w--200 ">가입일</th>
													<th class="w--60">&nbsp;</th>
												</tr>
											</tfoot>

										</table>

									</div>



									<!-- options and pagination -->
									<div class="row text-center-xs">

										<div class="hidden-lg-down col-12 col-xl-6">

											<!-- SELECTED ITEMS -->
											<!-- <div class="dropup">

												<a href="#" class="btn btn-sm btn-pill btn-light" data-toggle="dropdown" aria-expanded="false" aria-haspopup="true">
													<span class="group-icon">
														<i class="fi fi-dots-vertical-full"></i>
														<i class="fi fi-close"></i>
													</span>
													<span>설정</span> 
												</a>

												<div class="dropdown-menu dropdown-menu-clean dropdown-click-ignore max-w-250">

													<a	 href="#!" 
														class="dropdown-item text-truncate js-form-advanced-bulk" 
														data-js-form-advanced-bulk-hidden-action-id="#action" 
														data-js-form-advanced-bulk-hidden-action-value="myactionhere3" 
														data-js-form-advanced-bulk-container-items="#item_list" 
														data-js-form-advanced-bulk-required-selected="true" 
														data-js-form-advanced-bulk-required-txt-error="No Items Selected!" 
														data-js-form-advanced-bulk-required-txt-position="top-center" 
														data-js-form-advanced-bulk-submit-without-confirmation="true" 
														data-js-form-advanced-form-id="#form_id">
														<i class="fi fi-check"></i>
														Set Active
													</a>


													<a	 href="#!" 
														class="dropdown-item text-truncate js-form-advanced-bulk" 
														data-js-form-advanced-bulk-hidden-action-id="#action" 
														data-js-form-advanced-bulk-hidden-action-value="myactionhere3" 
														data-js-form-advanced-bulk-container-items="#item_list" 
														data-js-form-advanced-bulk-required-selected="true" 
														data-js-form-advanced-bulk-required-txt-error="No Items Selected!" 
														data-js-form-advanced-bulk-required-txt-position="top-center" 
														data-js-form-advanced-bulk-submit-without-confirmation="true" 
														data-js-form-advanced-form-id="#form_id">
														<i class="fi fi-close"></i>
														Set Inactive
													</a>


													<a	 href="#!" 
														class="dropdown-item text-truncate js-form-advanced-bulk" 
														data-js-form-advanced-bulk-hidden-action-id="#action" 
														data-js-form-advanced-bulk-hidden-action-value="delete" 
														data-js-form-advanced-bulk-container-items="#item_list" 
														data-js-form-advanced-bulk-required-selected="true" 
														data-js-form-advanced-bulk-required-txt-error="No Items Selected!" 
														data-js-form-advanced-bulk-required-txt-position="top-center" 
														data-js-form-advanced-bulk-required-custom-modal="" 
														data-js-form-advanced-bulk-required-custom-modal-content-ajax="" 
														data-js-form-advanced-bulk-required-modal-type="danger" 
														data-js-form-advanced-bulk-required-modal-size="modal-md" 
														data-js-form-advanced-bulk-required-modal-txt-title="Please Confirm" 
														data-js-form-advanced-bulk-required-modal-txt-subtitle="Selected Items: {{no_selected}}" 
														data-js-form-advanced-bulk-required-modal-txt-body-txt="Are you sure? Delete {{no_selected}} selected items?" 
														data-js-form-advanced-bulk-required-modal-txt-body-info="Please note: this is a permanent action!" 
														data-js-form-advanced-bulk-required-modal-btn-text-yes="Delete" 
														data-js-form-advanced-bulk-required-modal-btn-text-no="Cancel" 
														data-js-form-advanced-bulk-submit-without-confirmation="false" 
														data-js-form-advanced-form-id="#form_id">
														<i class="fi fi-thrash text-danger"></i>
														Delete
													</a>

												</div>

											</div> -->
											<!-- /SELECTED ITEMS -->

										</div>


										<div class="col-12 col-xl-6">

											<!-- pagination -->
											<nav aria-label="pagination">
												<ul class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">

													<li class="page-item disabled btn-pill ">
														<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Prev</a>
													</li>
													
													<li class="page-item active" aria-current="page">
														<a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
													</li>
													
													<li class="page-item">
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
									<!-- /options and pagination -->

								</form>

							</div>
							<!-- /portlet : body -->

						</div>
						<!-- /portlet -->
					
					</div>
					<!-- /PAGE LIST -->

				</div>
				<!-- /MIDDLE -->

			</div>


<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
  request.setCharacterEncoding("UTF-8");
%>
<script type="text/javascript">
	function fn_search(frm){
	    frm.method="post";
	    frm.action="${contextPath}/admin/member/memberList.do";
	    frm.submit();
		
	}
</script>
<body class="layout-admin aside-sticky header-sticky">

	<div id="wrapper" class="d-flex align-items-stretch flex-column">




		<div id="wrapper_content" class="d-flex flex-fill">

			<!-- MIDDLE -->
			<div id="middle" class="flex-fill">

				<!--

						PAGE TITLE
					-->
				<div class="page-title bg-transparent b-0">

					<h1 class="h4 mt-4 mb-0 px-3 font-weight-normal">회원관리</h1>

				</div>




				<!-- PAGE LIST -->
				<div class="clearfix">

					<!-- portlet -->
					<div class="portlet">

						<!-- portlet : header -->
						<div class="portlet-header border-bottom">
						
							<form name="search" method="post" class="float-end row">
							
							<!-- 날짜로 검색 -->
								<div class="float-end col-6 col-lg-5">
								
									<input autocomplete="off" type="text" name="search_daterange" 
										class="form-control rangepicker" data-placement="left"
										data-ranges="true" data-date-start="2020/10/01"
										data-date-format="YYYY/MM/DD"
										data-quick-locale='{
														"lang_apply"	: "선택",
														"lang_cancel"	: "취소",
														"lang_months" 	: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
														"lang_weekdays" : ["일", "월", "화", "수", "목", "금", "토"]
													}'>
													

								</div>
								<!-- 날짜로 검색 끝 -->
							
								<!-- 옵션으로 검색 -->
								<div class="row gutters-xs col-6">

									<div class="col-4 col-lg-4">

										<div class="form-label-group mb-4">
											<select name="search_type" id="search_type" class="form-control bs-select"
												title="search_type">
												<option value="member_id" selected="">ID</option>
												<option value="member_name">이름</option>
											</select> <label for="search_type">검색옵션</label>
										</div>
									</div>

									<div class="col-7 col-lg-7 ">

										<div class="form-label-group mb-4 row">
											<input placeholder="검색" name="search_word" type="text"
												value="" class="form-control col-9"> <label
												for="s_max_price">검색</label>
											<input class="btn btn-secondary col-3 fs--13" type="button"  value="검색" name="btn_search" style="padding:11px" onClick="fn_search(form)"  />
										</div>

									</div>

								</div>
								<!-- 옵션으로 검색 끝 -->



							</form>


						</div>
						<!-- /portlet : header -->


						<!-- portlet : body -->
						<div class="portlet-body pt-0">


							<form novalidate class="bs-validate" id="form_id" method="post"
								action="#!">


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
								<input type="hidden" id="action" name="action" value="">
								<!-- value populated by js -->



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
													<c:forEach var="item" items="${member_list}"
														varStatus="item_num">
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
															<td><a
																href="${contextPath}/admin/member/memberDetail.do?member_id=${item.member_id}"
																class="font-weight-medium text-muted mx-2 m-0-xs">
																	${item.member_id}</a></td>
															<td><a
																href="${contextPath}/admin/member/memberDetail.do?member_id=${item.member_id}"
																class="font-weight-medium text-muted mx-2 m-0-xs">
																	${item.member_name} </a></td>
															<td>${item.email}</td>
															<td>
															<c:choose>
															<c:when test="${item.member_id=='admin' }">
															<small class="badge badge-pink font-medium text-uppercase"> 관리자</small>														
															</c:when>
															<c:when test="${item.pre_score >10000}">															
															<small class="badge badge-danger font-medium text-uppercase">우수회원</small>
															</c:when>
															<c:otherwise>
															<small class="badge badge-primary font-medium text-uppercase">일반회원</small>															
															</c:otherwise>															
															</c:choose>
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

									</table>

								</div>



								<!-- options and pagination -->
								<div class="row text-center-xs">

									<div class="hidden-lg-down col-12 col-xl-6"></div>


									<div class="col-12 col-xl-6">

										<!-- pagination -->
										<nav aria-label="pagination">
											<ul
												class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">

												<li class="page-item disabled btn-pill "><a
													class="page-link" href="#" tabindex="-1"
													aria-disabled="true">Prev</a></li>

												<li class="page-item active" aria-current="page"><a
													class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
												</li>

												<li class="page-item"><a class="page-link" href="#">2</a>
												</li>

												<li class="page-item"><a class="page-link" href="#">3</a>
												</li>

												<li class="page-item"><a class="page-link" href="#">Next</a>
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
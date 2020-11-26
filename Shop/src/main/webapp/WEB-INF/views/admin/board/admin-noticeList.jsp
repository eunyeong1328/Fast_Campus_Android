<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>

				<!-- MIDDLE -->
				<div id="middle" class="flex-fill">

					<!--

						PAGE TITLE
					-->
					<div class="page-title bg-transparent b-0">

						<h1 class="h4 mt-4 mb-0 px-3 font-weight-normal">
							공지사항
						</h1>
						
					</div>




					<!-- PAGE LIST -->
					<div class="clearfix">
					
						<!-- portlet -->
						<div class="portlet">
							
							<!-- portlet : header -->
							<div class="portlet-header border-bottom">

								<div class="float-end">

									<a href="${contextPath}/adminboard/noticeInsert.do" class="js-ajax btn btn-sm btn-primary btn-pill px-2 py-1 fs--15">
										등록
									</a>

								</div>


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
														<label class="form-checkbox form-checkbox-primary float-start">
															<input class="checkall" data-checkall-container="#item_list" type="checkbox" name="checkbox">
															<i></i>
														</label>
													</th>
													<th>번호</th>
													<th>
														<span class="px-2 p-0-xs">
															제목
														</span>
													</th>
													<th class="w--200 hidden-lg-down">조회수</th>
													<th>작성날짜</th>
													<th class="w--200 hidden-lg-down">게시여부</th>
													<th class="w--60">&nbsp;</th>
												</tr>
											</thead>
											
											<c:if test="${empty NoticeList}">
												<tbody id="item_list">
													<tr>
														<td colspan="6">등록된 공지사항이 없습니다.</td>
													</tr>
												</tbody>
											</c:if>
											
											<c:if test="${not empty NoticeList}">
											<c:forEach var="notice" items="${NoticeList}">
											<tbody id="item_list">

												<!-- item -->
												<tr id="message_id_2" class="text-muted">

													<td class="hidden-lg-down">
														<label class="form-checkbox form-checkbox-secondary float-start">
															<input type="checkbox" name="item_id[]" value="2">
															<i></i>
														</label>
													</td>
													<td>${notice.notice_num}</td>
													<td>

														<a href="${contextPath}/adminboard/notice.do?notice_num=${notice.notice_num}&cPage=${paging.nowPage}" class="font-weight-medium text-muted mx-2 m-0-xs">
															${notice.title}
														</a>

														<!-- MOBILE ONLY -->
														<div class="fs--13 d-block d-xl-none">
															<span class="d-block text-muted">Visits: 0</span>
															<span class="badge badge-success font-weight-medium fs--12">Active</span>
															<span class="badge badge-danger font-weight-medium fs--12">Inactive</span>
														</div>
														<!-- /MOBILE ONLY -->

													</td>

													<td class="hidden-lg-down">${notice.views}</td>
													
													<td>${notice.reg_date}</td>
													
													<td class="hidden-lg-down">

														<small class="badge badge-success font-medium text-uppercase">active</small>
														<!-- <small class="badge badge-danger font-medium text-uppercase">inactive</small> -->

													</td>

													<td class="text-align-end">

														<div class="dropdown">

															<a href="#" class="btn btn-sm btn-light rounded-circle" data-toggle="dropdown" aria-expanded="false" aria-haspopup="true">
																<span class="group-icon">
																	<i class="fi fi-dots-vertical-full"></i>
																	<i class="fi fi-close"></i>
																</span>
															</a>


															<div class="dropdown-menu dropdown-menu-clean dropdown-click-ignore max-w-220">

																<a class="dropdown-item text-truncate" href="#!">
																	<i class="fi fi-check"></i>
																	Set Active
																</a>

																<a class="dropdown-item text-truncate" href="#!">
																	<i class="fi fi-close"></i>
																	Set Inactive
																</a>

																<a	 href="#!" 
																	class="dropdown-item text-truncate js-ajax-confirm" 
																	data-href="page-list.html" 
																	data-ajax-confirm-body="Delete this page?" 

																	data-ajax-confirm-mode="ajax" 
																	data-ajax-confirm-method="GET" 

																	data-ajax-confirm-btn-yes-class="btn-sm btn-danger" 
																	data-ajax-confirm-btn-yes-text="Delete" 
																	data-ajax-confirm-btn-yes-icon="fi fi-check" 

																	data-ajax-confirm-btn-no-class="btn-sm btn-light" 
																	data-ajax-confirm-btn-no-text="Cancel" 
																	data-ajax-confirm-btn-no-icon="fi fi-close"

																	data-ajax-confirm-success-target="#message_id_2" 
																	data-ajax-confirm-success-target-action="remove">
																	<i class="fi fi-thrash text-danger"></i>
																	Delete
																</a>

															</div>

														</div>

													</td>

												</tr>
												<!-- /item -->

											</tbody>
											</c:forEach>
											</c:if>

											<tfoot>
												<tr class="text-muted fs--13">
													<th class="w--30 hidden-lg-down">
														<label class="form-checkbox form-checkbox-primary float-start">
															<input class="checkall" data-checkall-container="#item_list" type="checkbox" name="checkbox">
															<i></i>
														</label>
													</th>
													<th>번호</th>
													<th>
														<span class="px-2 p-0-xs">
															제목
														</span>
													</th>
													<th class="w--200 hidden-lg-down">조회수</th>
													<th>작성날짜</th>
													<th class="w--200 hidden-lg-down">게시여부</th>
													<th class="w--60">&nbsp;</th>
												</tr>
											</tfoot>

										</table>

									</div>



									<!-- options and pagination -->
									<div class="row text-center-xs">

										<div class="hidden-lg-down col-12 col-xl-6">

											<!-- SELECTED ITEMS -->
											<div class="dropup">

												<a href="#" class="btn btn-sm btn-pill btn-light" data-toggle="dropdown" aria-expanded="false" aria-haspopup="true">
													<span class="group-icon">
														<i class="fi fi-dots-vertical-full"></i>
														<i class="fi fi-close"></i>
													</span>
													<span>Selected Items</span>
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

											</div>
											<!-- /SELECTED ITEMS -->

										</div>


										<div class="col-12 col-xl-6">

											<!-- pagination -->
											<nav aria-label="pagination">
												<ul class="pagination pagination-pill justify-content-end justify-content-center justify-content-md-end">
													<c:if test="${paging.beginPage == 1}">
														<li class="page-item disabled btn-pill ">
															<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Prev</a>
														</li>
													</c:if>
													<c:if test="${paging.beginPage != 1}">
														<li class="page-item">
															<a class="page-link" href="noticeList.do?cPage=${paging.endPage - 1 }" tabindex="-1" aria-disabled="true">Prev</a>
														</li>
													</c:if>
													
													<c:forEach var="pageNo" begin="${paging.beginPage }" end="${paging.endPage }">
														<c:if test="${pageNo == paging.nowPage }">
															<li class="page-item active" aria-current="page">
																<a class="page-link" href="#">${pageNo } <span class="sr-only">(current)</span></a>
															</li>
														</c:if>
														<c:if test="${pageNo != paging.nowPage }">
															<li class="page-item" aria-current="page">
																<a class="page-link" href="noticeList.do?cPage=${pageNo }">${pageNo } <span class="sr-only">(current)</span></a>
															</li>
														</c:if>
													</c:forEach>
													
													<c:if test="${paging.endPage >= paging.totalPage }">
														<li class="page-item disabled btn-pill ">
															<a class="page-link" href="#">Next</a>
														</li>
													</c:if>
													<c:if test="${paging.endPage < paging.totalPage }">
														<li class="page-item">
															<a class="page-link" href="noticeList.do?cPage=${paging.endPage + 1 }">Next</a>
														</li>
													</c:if>

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
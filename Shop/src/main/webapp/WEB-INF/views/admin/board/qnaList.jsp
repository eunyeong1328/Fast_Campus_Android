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

			<!-- MIDDLE -->
			<div id="middle" class="flex-fill">

				<!--

						PAGE TITLE
					-->
				<div class="page-title bg-transparent b-0">

					<h1 class="h4 mt-4 mb-0 px-3 font-weight-normal">상품 문의</h1>

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
												<option value="member_status">상태</option>
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


							
								<input type="hidden" id="action" name="action" value="">
								<!-- value populated by js -->



								<div class="table-responsive">

									<table class="table table-align-middle border-bottom mb-6">

										<thead>
											<tr class="text-muted fs--13">
												
												<span class="px-2 p-0-xs"></span>
												<th width="10%" style="text-align: center;">번호</th>
												<th width="15%"style="text-align: center;">상품아이디</th>
												<th width="15%"style="text-align: center;">회원아이디</th>
												<th width="40%">글제목</th>
												<th width="15%"style="text-align: center;">작성일</th>
											</tr>
										</thead>

										<tbody id="item_list">
											<c:choose>
												<c:when test="${empty qnaList}">
													<tr>
														<td colspan=5 class="fixed"><strong>문의글이 
																없습니다.</strong></td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach var="item" items="${qnaList}" varStatus="item_num">
														<!-- item -->
														<tr>
															<td width="10%" style="text-align: center;"> ${item.rowNum } </td>
															<td width="15%"style="text-align: center;"> ${item.product_id }</td>
															<td width="15%"style="text-align: center;"> ${item.member_id }</td>
															<td width="40%"> ${item.title }</td>
															<td width="15%"style="text-align: center;"> ${item.reg_date }</td>
														</tr>															
															
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

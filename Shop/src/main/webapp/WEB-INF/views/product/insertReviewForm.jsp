<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
  request.setCharacterEncoding("UTF-8");
%>
<section class="pt-5">
	<div class="container">
		<div id="wrapper" class="d-flex align-items-stretch flex-column">

			<!-- 여기부터 -->
			<div id="wrapper_content" class="d-flex flex-fill">

				<!-- MIDDLE -->
				<div id="middle" class="flex-fill">

					<!--

						PAGE TITLE
					-->
					<div class="page-title bg-transparent b-0">

						<h1 class="h4 mt-4 mb-0 px-3 font-weight-normal">PRODUCT Review</h1>
						<br>
						<p>
							&nbsp;&nbsp;&nbsp;&nbsp;상품에 대한 후기를 남기는 공간입니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;배송,
							주문(취소/교환/환불)관련 문의 및 요청사항은 1:1 문의에 남겨주세요.
					</div>

					<!--
				  	<form novalidate class="bs-validate" method="post" action="${contextPath }/product/addBoardQna.do" enctype="multipart/form-data">
-->
					<form class="bs-validate" method="post"
						action="${contextPath }/product/insertReview.do"
						enctype="multipart/form-data">

						<section>

							<div class="row gutters-sm">

								<div class="col-12 col-lg-12 col-xl-8 mb-5">


									<div class="form-label-group mb-3">
										<table style="color: gray;" class="table">
											<tbody>
												<tr>
													<th scope="row">작성자</th>
													<td>${memberInfo.member_id }</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td>${memberInfo.email }</td>
												</tr>
												<tr>
													<th scope="row">핸드폰</th>
													<td>${memberInfo.phone }</td>
												</tr>
											</tbody>
										</table>

									</div>
									<input type="hidden" name="member_id"value="${memberInfo.member_id }" /> 
									<input type="hidden" name="product_id" value="${product_id }" />
									 
									<input id="title" name="title" required type="text"
										placeholder="제목을 입력해주세요" class="form-control"> 
									<label	for="product_title"></label>

									<textarea name="contents"
										class="summernote-editor w-100 h--350"
										data-placeholder="문의사항을 적어주세요" data-min-height="350"
										data-max-height="2800" data-focus="false" data-lang="en-US"
										data-ajax-url="_ajax/demo.summernote.php"
										data-ajax-params="['action','editor:image:upload']"
										data-toolbar='[
												["style", ["style"]],
												["font", ["bold", "italic", "underline", "clear"]],
												["fontname", ["fontname"]],
												["color", ["color"]],
												["para", ["ul", "ol", "paragraph"]],
												["table", ["table"]],
												["help", ["help"]]
									]'></textarea>

									<br>
									<br> 
											<input type="submit" class="btn btn-purple btn-soft mb-1" value="후기등록">
											
											<input type="button" class="btn btn-purple btn-soft mb-1" value="취소">
									


									
								</div>


								<div class="col-12 col-lg-12 col-xl-4 mb-5">

									<!--
										PRODUCT IMAGES
									-->
									<div class="clearfix bg-light p-2 mb-2 rounded">

										<label
											class="btn btn-warning cursor-pointer position-relative">
											
											<input	name="file" 
													multiple="multiple"
													type="file" 

													data-file-ext="jpg,jpeg,png" 
													data-file-max-size-kb-per-file="3072" 
													data-file-max-size-kb-total="30720" 
													data-file-max-total-files="10" 

													data-file-ext-err-msg="Allowed:" 
													data-file-exist-err-msg="File already exists:" 
													data-file-size-err-item-msg="File too large!" 
													data-file-size-err-total-msg="Total allowed size exceeded!" 
													data-file-size-err-max-msg="Maximum allowed files:" 
													data-file-toast-position="top-center" 
													data-file-preview-container=".js-file-preview-container" 
													data-file-preview-img-height="100" 
													data-file-preview-show-info="true" 
													data-file-btn-clear="a.js-file-btn-clear" 
													data-file-preview-img-cover="true" 
													data-file-preview-class="shadow-md my-2 mr-3 rounded float-start" 
													class="custom-file-input absolute-full"/> 
 
 										<!--  
 											<input name="file" multiple="multiple" type="file"
											data-file-ext="jpg,jpeg,png"
											data-file-max-size-kb-per-file="3072"
											data-file-max-size-kb-total="30720"
											data-file-max-total-files="10"
											data-file-ext-err-msg="Allowed:"
											data-file-exist-err-msg="File already exists:"
											data-file-size-err-item-msg="File too large!"
											data-file-size-err-total-msg="Total allowed size exceeded!"
											data-file-size-err-max-msg="Maximum allowed files:"
											data-file-toast-position="top-center"
											data-file-preview-container=".js-file-preview-container"
											data-file-preview-img-height="100"
											data-file-preview-show-info="true"
											data-file-btn-clear="a.js-file-btn-clear"
											data-file-preview-img-cover="true"
											data-file-preview-class="shadow-md my-2 mr-3 rounded float-start" />
										-->
											<span class="group-icon"> <i
												class="fi fi-arrow-upload"></i> <i
												class="fi fi-circle-spin fi-spin"></i>
										</span> <span>Upload Images</span>

										</label>

										<!-- remove button -->
										<a href="#" title="Clear Files" data-toggle="tooltip"
											class="js-file-btn-clear hide btn btn-secondary mb-2"> <i
											class="fi fi-close m-0"></i>
										</a>

										<!-- info -->
										<small class="d-block text-muted"> Upload images (jpg,
											jpeg, png). </small>


										<div
											class="js-file-preview-container d-inline-block position-relative clearfix hide-empty">
											<!-- container -->
											<span data-id="0" data-file-name="bread2.jpg"
												data-file-size="162729" id="rand_Dqr"
												class="js-file-input-item bulkNo_gSXVA8M4 d-inline-block position-relative overflow-hidden text-center shadow-md my-2 mr-3 rounded float-start bg-cover"
												style="width: 100px; height: 100px; background-image: url(${contextPath}/resources/images/review/bread2.jpg);">

												<span
												class="js-file-input-preview-header text-white position-absolute w-100 top-0 left-0 right-0 clearfix overlay-dark overlay-opacity-2">
														<span class="text-truncate d-block fs--12 pl--5 pr--5">bread2.jpg</span>
												</span> 
											
											</span>
										</div>

									</div>

								</div>

							</div>

						</section>

					</form>

				</div>
				<!-- /MIDDLE -->

			</div>
			<!-- 여기까지 -->

		</div>
		<!-- /#wrapper -->
		<script src="${contextPath}/resources/assets/js/core.min.js"></script>
	</div>
</section>
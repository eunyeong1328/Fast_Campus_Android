<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
  request.setCharacterEncoding("UTF-8");
%>

				<!-- MIDDLE -->
				<div id="middle" class="flex-fill">

					<!--

						PAGE TITLE
					-->
					<div class="page-title bg-transparent b-0">

						<h1 class="h4 mt-4 mb-0 px-3 font-weight-normal">PRODUCT Q&A</h1>
						<br>
						<p>
							&nbsp;&nbsp;&nbsp;&nbsp;상품 문의에 대한 답변을  남기는 공간입니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>

					<!--
				  	<form novalidate class="bs-validate" method="post" action="${contextPath }/product/addBoardQna.do" enctype="multipart/form-data">
-->
					<form class="bs-validate" method="post"
						action="${contextPath }/admin/productQnaReInsert.do"
						enctype="multipart/form-data">

						<section>

							<div class="row gutters-sm">

								<div class="col-12 col-lg-12 col-xl-8 mb-5">


									<div class="form-label-group mb-3">
										<table style="color: gray;" class="table">
											<tbody>
												<tr>
													<th width="20" scope="row">작성자</th>
													<td>${memberInfo.member_id }</td>
												</tr>
											</tbody>
										</table>

									</div>
									
									<input type="hidden" name="member_id"value="${memberInfo.member_id }" /> 
									<input type="hidden" name="product_id" value="${product_id }" /> 
									<input type="hidden" name="qna_category_num" value="3" /> 
									<input type="hidden" name="parent_num" value="${parent_num }" />
									
									<input id="product_title" name="title" required type="text"
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
									
									<input type="submit" class="btn btn-purple btn-soft mb-1" value="답변등록">
									
									


									<!--  
											<a href="${contextPath }/product/productBoardQnaForm.do?product_id=${vo.product_id}">
												<button type="button" class="btn btn-purple btn-soft mb-1">
													이전으로
												</button>
											</a> 
										-->
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
													data-file-max-total-files="3" 

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
											
										</div>

									</div>

								</div>

							</div>

						</section>

					</form>

				</div>
				<!-- /MIDDLE -->

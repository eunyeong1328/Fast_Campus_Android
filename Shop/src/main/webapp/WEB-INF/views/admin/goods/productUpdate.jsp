<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가 페이지</title>
</head>
<body class="layout-admin aside-sticky header-sticky">

	<div id="wrapper" class="d-flex align-items-stretch flex-column">

		<div id="wrapper_content" class="d-flex flex-fill">

			<div id="middle" class="flex-fill">

				<form action="update.do" method="post" enctype="multipart/form-data">

					<section>
						PRODUCT
						<div>
							상품 아이디 <input class="form-control" type="text" name="product_id" readonly value="${one[0].product_id}"> 
						</div>
						<div>
							상품명 <input class="form-control" type="text" name="product_name" required="required" value="${one[0].product_name}">
						</div>
						<div>
							<textarea name="product_detail"
								class="summernote-editor w-100 h--350" 
								data-min-height="350" data-max-height="2800" data-focus="false"
								data-lang="en-US" data-ajax-url="_ajax/demo.summernote.php"
								data-ajax-params="['action','editor:image:upload']"
								data-toolbar='[
												["style", ["style"]],
												["font", ["bold", "italic", "underline", "clear"]],
												["fontname", ["fontname"]],
												["color", ["color"]],
												["para", ["ul", "ol", "paragraph"]],
												["table", ["table"]],
												["insert", ["link", "picture", "hr"]],
												["view", ["codeview"]],
												["help", ["help"]]
							]'>${one[0].product_detail}</textarea>
						</div>
					</section>

					<section>

						<div>
							판매 단위 <input class="form-control" type="text" name="sales_unit" required="required" value="${one[0].sales_unit}"><br><br> 
							상품 용량 <input class="form-control" type="text" name="product_size" required="required" value="${one[0].product_size}"><br><br>
							포장 타입 <input class="form-control" type="text" name="packing_type" required="required"	value="${one[0].packing_type}"><br><br> 
							거래처 <input class="form-control" type="text" name="supplier" required="required"	value="${one[0].supplier}"><br><br>
						</div>
					</section>
					<section>
						IMAGE
						<div>
							상품 이미지 <input type="file" name="image" required="required"><br><br> 
							상품 상세 이미지 <input type="file" name="detail_image"><br><br>
						</div>
					</section>

					<section>
						ITEM
						<div>
							제품 번호 <input class="form-control" type="text" name="item_num" readonly value="${one[0].item_num}"><br><br>
							
							등록 날짜 <input class="form-control" type="date" name="reg_date" required="required" value="${one[0].reg_date}"><br><br>

							재고 <input class="form-control" type="text" name="stock" required="required" value="${one[0].stock}"><br><br>
							
							단위 가격 <input class="form-control" type="text" name="unit_price" required="required" value="${one[0].unit_price}"><br><br>

							가격 <input class="form-control" type="text" name="price" required="required" value="${one[0].price}"><br><br> 
							
							할인율 <input class="form-control" type="text" name="discount" required="required" value="${one[0].discount}"><br><br>

							판매량 <input class="form-control" type="text" name="sales" readonly value="${one[0].sales}"><br><br>
						</div>
					</section>
		
					<section>
						<label>카테고리 설정</label>
							<div>
								<select required  name="product_category_num" class="form-control bs-select" data-live-search="true" title="선택해주세요">

									<option value="1" class="font-weight-medium">고기</option>
									<option value="2" class="font-weight-medium">채소</option>
									<option value="3" class="font-weight-medium">베이커리</option>
									<!-- <option value="4" class="font-weight-medium">기타</option> -->

								</select>

							
							</div>
					</section>
		
					<button type="submit" value="상품 추가" class="btn btn-primary"><i class="fi fi-check"></i>상품추가</button> <input type="reset" value="리셋" class="btn btn-primary">
					
				</form>

			</div>

		</div>

	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가 페이지</title>
<script>
	function option_add() {
		app = document.getElementById("op");
		app.innerHTML += "옵션명 : <input type=text name=option_name placeholder=option_name> 옵션 금액 : <input type=text name=option_price placeholder=option_price> 옵션 수량 : <input type=text name=option_quantity placeholder=option_quantity><br><br>";
	}
</script>
</head>
<body class="layout-admin aside-sticky header-sticky">

	<div id="wrapper" class="d-flex align-items-stretch flex-column">

		<div id="wrapper_content" class="d-flex flex-fill">

			<div id="middle" class="flex-fill">

				<form action="add.do" method="post" enctype="multipart/form-data">

					<section>
						PRODUCT
						<div>
							상품 아이디 <input type="text" name="product_id" required="required" placeholder="product_id"> 
							상품명 <input type="text" name="product_name" required="required" placeholder="product_name">

							<textarea name="product_detail"
								class="summernote-editor w-100 h--350" data-placeholder="상품 설명"
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
						]'></textarea>
						</div>
					</section>

					<section>

						<div>
							판매 단위 <input type="text" name="sales_unit" required="required" placeholder="sales_unit"><br><br> 
							상품 용량 <input type="text" name="product_size" required="required" placeholder="product_size"><br><br>
							포장 타입 <input type="text" name="packing_type" required="required"	placeholder="packing_type"><br><br> 
							거래처 <input type="text" name="supplier" required="required"	placeholder="supplier"><br><br>
						</div>
					</section>
					<section>
						IMAGE
						<div>
							상품 이미지 <input type="file" name="image" required="required"><br><br> 
							상품 상세 이미지 <input type="file" name="detail_image" required="required"><br><br>
						</div>
					</section>

					<section>
						OPTION  <input type="button" onclick="option_add()" value="옵션추가" />
						<div id="op"></div>

					</section>
					
					<section>
						ITEM
						<div>
							제품 번호 <input type="text" name="item_num" required="required" placeholder="item_num"><br><br>
							
							등록 날짜 <input type="date" name="reg_date" required="required" placeholder="reg_date"><br><br>

							재고 <input type="text" name="stock" required="required" placeholder="stock"><br><br>
							
							단위 가격 <input type="text" name="unit_price" required="required" placeholder="unit_price"><br><br>

							가격 <input type="text" name="price" required="required" placeholder="price"><br><br> 
							
							할인율 <input type="text" name="discount" required="required" placeholder="discount"><br><br>

							판매량 <input type="text" name="sales" disabled="disabled" value="0"><br><br>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function option_add() {
		app = document.getElementById("op");
		app.innerHTML += "<tr><td></td><td></td><td><input type=text name=option_name placeholder=option_name></td><td><input type=text name=option_price placeholder=option_price></td><td><input type=text name=option_quantity placeholder=option_quantity></td></tr>";
	}
</script>
</head>
<body class="layout-admin aside-sticky header-sticky">

	<div id="wrapper" class="d-flex align-items-stretch flex-column">

		<div id="wrapper_content" class="d-flex flex-fill">

			<div id="middle" class="flex-fill">

				<section>
					OPTION <input type="button" onclick="option_add()" value="옵션추가" />
					<div></div>

				</section>
				<form action="optionAdd.do">
					<section>

						<table class="table table-striped table-dark">
							<thead>
								<tr>
									<th>No</th>
									<th>product_id</th>
									<th>옵션명</th>
									<th>옵션 가격</th>
									<th>수량</th>
									<th>비고</th>
								</tr>
								<c:choose>
									<c:when test="${empty list}">
										<tr>
											<td colspan=8 class="fixed"><strong>조회된 상품이
													없습니다.</strong></td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="option" items="${list}" varStatus="option_num">
											<tr>
												<td>${option_num.count}</td>
												<td>${option.product_id}</td>
												<td>${option.option_name}</td>
												<td>${option.option_price}</td>
												<td>${option.option_quantity}</td>
												<td><a
													href="${contextPath}/admin/productOptionDelete.do?product_id=${option.product_id}&&option_name=${option.option_name}">삭제</a>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</thead>
							<tbody id="op">

							</tbody>
						</table>
						<button type="submit">옵션 추가</button>
					</section>
				</form>
			</div>

		</div>

	</div>
</body>
</html>
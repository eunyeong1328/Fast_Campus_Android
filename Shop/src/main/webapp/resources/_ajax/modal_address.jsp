<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath }"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  


	<!-- 

		SHIPPING ADDRESS 

	-->
	<form novalidate class="bs-validate" method="post" action="#">

		<div class="modal-header">
			<h2 class="modal-title fs--18 m-0">
				주소
			</h2>

			<button type="button" class="close pointer" data-dismiss="modal" aria-label="Close">
				<span class="fi fi-close fs--18" aria-hidden="true"></span>
			</button>
		</div>

		<div class="modal-body">

			<div class="row">

				<div class="col-12 col-sm-6 col-lg-6">

					<div class="form-label-group mb-3">
						<input required placeholder="First Name" id="addr_first_name" name="addr_first_name" type="text" class="form-control">
						<label for="addr_first_name"> 우편번호</label>
					</div>

				</div>
				
				<div class="col-12 col-sm-6 col-lg-6">

					<div class="form-label-group mb-3">
						<a href="javascript:execDaumPostcode()">우편번호검색</a>
					</div>

				</div>

<!--
				<div class="col-12 col-sm-6 col-lg-6">

					<div class="form-label-group mb-3">
						<input placeholder="Company Name" id="addr_company_name" name="addr_company_name" type="text" class="form-control">
						<label for="addr_company_name">íê¸ ì¸ì½ë© ìì</label>
					</div>

				</div> -->




				<div class="col-12 col-sm-12 col-lg-12 mb--20">

					<div class="form-label-group mb-3">
						<input required placeholder="Street and Number, P.O. Box, c/o." id="addr_address_1" name="addr_address_1" type="text" class="form-control">
						<label for="addr_address_1">도로명 주소</label>
					</div>

					<div class="form-label-group mb-3">
						<input placeholder="Apt, Suite, Unit, Building, Floor, etc" id="addr_address_2" name="addr_address_2" type="text" class="form-control">
						<label for="addr_address_2">지번 주소</label>
					</div>
					
					<div class="form-label-group mb-3">
						<input placeholder="Apt, Suite, Unit, Building, Floor, etc" id="addr_address_2" name="addr_address_2" type="text" class="form-control">
						<label for="addr_address_2">나머지 주소</label>
					</div>

				</div>








			</div>

		</div>

		<div class="modal-footer">
			<button type="submit" class="btn btn-sm btn-primary">
				<i class="fi fi-check"></i>
				변경사항 저장
			</button>

			<a href="#" class="btn btn-sm btn-secondary" data-dismiss="modal">
				<i class="fi fi-close"></i>
				취소
			</a>
		</div>

	</form>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('zipNo').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('load_address').value = fullRoadAddr; //도로명 주소
						document.getElementById('jibun_address').value = data.jibunAddress; //지번주소

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
						} else {
							document.getElementById('guide').innerHTML = '';
						}

					}
				}).open();
	}

	

	function fn_join_member(){ //가입하기 누른 후 비밀번호 불일치 시에 		
			alert("회원 가입을 진행합니다.");		
			return;
		}
	
</script>


	<div id="wrapper">
	
		<!-- PAGE TITLE -->
		<section class="bg-light p-0">
			<div class="container py-5">

				<h1 class="h3">회원가입</h1>

				<nav aria-label="breadcrumb">
					<ol class="breadcrumb fs--14">
						<li class="breadcrumb-item"><a href="${contextPath}/main/main.do">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Account</li>
					</ol>
				</nav>

			</div>
		</section>
		<!-- /PAGE TITLE -->



		<!-- FORM -->
		<section>
			<div class="container">


				<div class="row">

					<div
						class="col-12 col-sm-8 col-md-8 col-lg-6 offset-sm-2 offset-md-2 offset-lg-3">

						<!-- optional class: .form-control-pill -->
						<form class="bs-validate p-5 rounded shadow-xs" novalidate
							method="post" action="${contextPath}/member/addMember.do"
							data-error-toast-text="<i class='fi fi-circle-spin fi-spin float-start'></i> Please, complete all required fields!"
							data-error-toast-delay="3000"
							data-error-toast-position="top-right">


							<!--
								<p class="text-danger">
									Ups! Please check again
								</p>
								-->


							<div class="form-label-group mb-3">
								<input required placeholder="member_id" id="member_id"
											value="${memberInfo.member_id }" name="member_id"
											type="hidden" class="form-control" readonly>
							</div>

							<div class="input-group-over">
								<div class="form-label-group mb-3">
									<input required placeholder="Password" name="password"
													id="password_check1" value="${memberInfo.password }"
													type="hidden" class="form-control" readonly>
								</div>
								
								<div class="input-group-over">
									<div class="form-label-group mb-3">
										<input required placeholder="Password_check"
														name="Password_check" id="password_check2"
														value="${memberInfo.password }" type="hidden"
														class="form-control">
									</div>
									
									<input required placeholder="member_status" id="member_status"
											value="구글" name="member_status"
											type="hidden" class="form-control" readonly>
									
									
									<div class="form-label-group mb-3">
										<input required placeholder="Member Name" id="member_name"
														value="${memberInfo.member_name }" name="member_name"
														type="text" class="form-control" readonly> <label
														for="member_name">이름</label>
									</div>

									<div class="form-label-group mb-3">
										<input required placeholder="Email" id="email"
														value="${memberInfo.email }" name="email" type="text"
														label="아이디" class="form-control"
														style="margin-bottom: 0; display: inline-block" readonly>
													<label for="email">이메일</label>
									</div>

									<div class="form-label-group mb-3">
										<input required placeholder="Phone" id="phone" name="phone"
											type="tel" class="form-control"> <label for="phone">휴대폰
											번호</label>
									</div>

									<div class="form-label-group mb-3">
										<input required placeholder="Address" id="zipNo"
											name="zipNo" type="number" class="form-control"> <label
											for="zipNo">우편번호</label>
										<a href="javascript:execDaumPostcode()">우편번호검색</a>
									</div>

									<div class="form-label-group mb-3">
										<input required placeholder="Address" id="load_address"
											name="load_address" type="text" class="form-control"> <label
											for="load_address">도로명 주소</label>

									</div>

								</div>
								<div class="form-label-group mb-3">
									<input required placeholder="Address" id="jibun_address"
										name="jibun_address" type="text" class="form-control"> <label
										for="jibun_address">지번 주소</label>

								</div>

								<div class="form-label-group mb-3">
									<input required placeholder="Address" id="rest_address"
										name="rest_address" type="text" class="form-control"> <label
										for="rest_address">나머지 주소</label>

								</div>
								<div class="form-label-group mb-3">
									<input required placeholder="Birthday" id="birthday"
										name="birthday" type="date" class="form-control"> <label
										for="birthday">생년월일</label>
								</div>

							</div>


							<!-- GDPR CONSENT -->
							<div class="clearfix bg-light position-relative rounded p-4 mb-4">


								<label class="form-checkbox form-checkbox-primary"> <input
									required type="checkbox" name="checkbox"> <i></i> <span>
										본인은 만 14세 이상이며, <a href="page-terms-and-conditions.html"
										target="_blank">이용약관</a> 내용을 확인하였으며 이에 동의합니다.
								</span>
								</label>

							</div>
							<!-- /GDPR CONSENT -->

							<div class="row">

								<div class="col-12">
									<button type="submit" class="btn btn-primary btn-block" onClick = "fn_join_member()">
										가입하기</button>

								</div>
							</div>

						</form>

					</div>

				</div>


			</div>
		</section>
		<!-- /FORM -->


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

	function fn_overlapped() { //id 중복체크
		var _id = $("#_member_id").val();
		if (_id == '') {
			alert("ID를 입력하세요");
			return;
		}
		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/member/overlapped.do", //호출 후
			dataType : "text",
			data : {id : _id},
			success : function(data, textStatus) { //result로 true,false전달
				if (data == 'false') {
					alert("사용할 수 있는 ID입니다.");
					$('#btnOverlapped').prop("disabled", true);
					$('#_member_id').prop("disabled", true);
					$('#member_id').val(_id);
				} else {
					alert("사용할 수 없는 ID입니다.");
				}
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다.");
				ㅣ
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
			}
		});
	}
	
	function chkId(){//이메일 형식 체크하기	
		var email = document.getElementById("email").value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				if(exptext.test(email)==false){
					//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
					alert("이 메일형식이 올바르지 않습니다. \n 올바른 전자 메일 주소를 입력해주세요(알파벳+숫자@알파벳+숫자)");
					document.addjoin.email.focus();
					return false;
				}else{
					alert("사용이 가능합니다.");
				}
	}
	
	var compare_result = false;
	
	function fn_compare_pwd(){ //비밀번호 확인 체크폼
		var pwd1 = $("#password_check1").val();
		var pwd2 = $("#password_check2").val();
		var s_result = $('#s_result');
		
		if(pwd1 == pwd2){
			//alert(pwd1);
			//alert(pwd2);
			compare_result = true;
			 $('#s_result').text("비밀번호가 일치합니다.");
		}else{
			compare_result = false;
			 $('#s_result').text("비밀번호가 일치하지 않습니다.");
		}
	}

	function fn_join_member(){ //가입하기 누른 후 비밀번호 불일치 시에 
		if(compare_result == true){
			//회원 가입 요청
			alert("회원 가입을 진행합니다.");
		}else{
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
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
								<input required placeholder="_member_id" id="_member_id" value="${memberInfo.member_id }"
									name="_member_id" type="text" label="아이디"
									class="form-control col-md-9"
									style="margin-bottom: 0; display: inline-block"> <label
									for="_member_id">아이디</label>
									<input type = "hidden" name = "member_id" id ="member_id" />
									 <a class="btn btn-primary" href="javascript:fn_overlapped()">중복확인</a>
							</div>


							<div class="input-group-over">
								<div class="form-label-group mb-3">
									<input required placeholder="Password" name ="password" 
											id="password_check1" type="password" class="form-control"> 
									<label for="password">비밀번호(영문 숫자 6~15자 이내)</label>
								</div>
								
								<div class="input-group-over">
									<div class="form-label-group mb-3">
										<input required placeholder="Password_check" name = "Password_check"
											id="password_check2" type="text" class="form-control" onKeyUp = "fn_compare_pwd()">
										<label for="Password_check">비밀번호 확인</label>
										
										<span style = "text-size:10px" id = "s_result">비밀번호가 일치하지 않습니다.</span>
									</p>
									</div>
									
									
									
									<div class="form-label-group mb-3">
										<input required placeholder="Member Name" id="member_name"
											name="member_name" type="text" class="form-control">
										<label for="member_name">이름</label>
									</div>

									<div class="form-label-group mb-3">
										<input required placeholder="Email" id="email" name="email"
											type="text" label="아이디" class="form-control col-md-9"
											style="margin-bottom: 0; display: inline-block"> <label
											for="email">이메일</label> 
											<a class="btn btn-primary"
											href="javascript:chkId()">중복확인</a>
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



		<!-- CONNECT WITH -->
		<section class="py-5 border-top">
			<div class="container">
				<div class="row text-center-xs">

					<div class="col">
						<h3 class="m-0 font-weight-light">다른 방법으로 회원가입하기 </h3>
						<p class="m-0">Alternative ways to sign in!</p>
					</div>

					<div class="col-12 mt-4 d-block d-md-none">
						<!-- mobile spacer -->
					</div>

					<div class="col-12 col-md-6 col-lg-4 text-align-end">

						<div class="row">

							<div class="col-6">
								<a href="#"
									class="btn btn-sm btn-block btn-facebook transition-hover-top mt-1"
									rel="noopener"> <i class="fi fi-social-facebook"></i>
									facebook
								</a>
							</div>

							<div class="col-6">
<div class="g-signin2 " data-onsuccess="onSignIn" data-theme="dark"></div>
    <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      }
    </script>
								
							</div>

						</div>

					</div>

				</div>
			</div>
		</section>
		<!-- /CONNECT WITH -->


<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
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
			//회원 가입 요청0
			alert("회원 가입을 진행합니다.");
		}else{
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
	} 
</script>
</head>

<body>

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
								<input required placeholder="_member_id" id="_member_id"
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
											name="zipNo" type="email" class="form-control"> <label
											for="zipNo">우편번호</label>
										<a href="javascript:execDaumPostcode()">우편번호검색</a>
									</div>

									<div class="form-label-group mb-3">
										<input required placeholder="Address" id="load_address"
											name="load_address" type="email" class="form-control"> <label
											for="load_address">도로명 주소</label>

									</div>

								</div>
								<div class="form-label-group mb-3">
									<input required placeholder="Address" id="jibun_address"
										name="jibun_address" type="email" class="form-control"> <label
										for="jibun_address">지번 주소</label>

								</div>

								<div class="form-label-group mb-3">
									<input required placeholder="Address" id="rest_address"
										name="rest_address" type="email" class="form-control"> <label
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
						<h3 class="m-0 font-weight-light">Or &ndash; Connect With:</h3>
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
								<a href="#"
									class="btn btn-sm btn-block bg-googleplay transition-hover-top mt-1 text-white"
									rel="noopener"> <i>G</i> google
								</a>
							</div>

						</div>

					</div>

				</div>
			</div>
		</section>
		<!-- /CONNECT WITH -->




		<!-- Footer -->
		<footer id="footer" class="footer-dark">
			<div class="container">

				<div class="row">

					<div
						class="bg-distinct col-12 col-md-6 col-lg-4 text-center p-0 py-5">

						<div
							class="footer-svg-shape position-absolute absolute-top z-index-2 mt--n70 w-100 overflow-hidden pt--5">
							<svg viewBox="0 0 1440 28" fill="none"
								xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">
									<path
									d="M0 28H1440C1440 28 1154 3.21961e-10 720 1.30487e-09C286 2.28777e-09 0 28 0 28Z"></path>
								</svg>
						</div>

						<form method="post" action="#subscribe_url" class="px-4">

							<input type="hidden" name="action" value="subscribe"
								tabindex="-1">

							<p id="btnAriaFooterFormTitle" class="text-muted">Claim your
								candy now!</p>


							<div class="input-group-over input-group-pill mb-4">

								<input required class="form-control b-0" name="subscriber_email"
									type="email" value="" placeholder="email address..."
									aria-label="email address...">

								<button type="submit" class="btn bg-transparent shadow-none"
									aria-label="subscribe" aria-labelledby="btnAriaFooterFormTitle">
									<i class="fi fi-send fs--18"></i>
								</button>

							</div>


						</form>

						<div class="mt--12">

							<a href="#!"
								class="btn btn-sm btn-facebook transition-hover-top mb-2 rounded-circle"
								rel="noopener" aria-label="facebook page"> <i
								class="fi fi-social-facebook"></i>
							</a> <a href="#!"
								class="btn btn-sm btn-twitter transition-hover-top mb-2 rounded-circle"
								rel="noopener" aria-label="twitter page"> <i
								class="fi fi-social-twitter"></i>
							</a> <a href="#!"
								class="btn btn-sm btn-linkedin transition-hover-top mb-2 rounded-circle"
								rel="noopener" aria-label="linkedin page"> <i
								class="fi fi-social-linkedin"></i>
							</a> <a href="#!"
								class="btn btn-sm btn-youtube transition-hover-top mb-2 rounded-circle"
								rel="noopener" aria-label="youtube page"> <i
								class="fi fi-social-youtube"></i>
							</a>

						</div>

					</div>


					<div class="col-12 col-md-6 col-lg-8 py-5 fs--15 text-center-xs">

						<h3 class="fs--15 text-muted">SPY US! WE'VE GOT SECRETS!</h3>

						<ul class="mt--30 mb-0 breadcrumb bg-transparent p-0 block-xs">
							<li class="breadcrumb-item"><a href="contact-1.html">Contact</a></li>
							<li class="breadcrumb-item"><a href="about-us-1.html">About
									Us</a></li>
							<li class="breadcrumb-item"><a
								href="page-terms-and-conditions.html">Terms &amp; Conditions</a></li>
							<li class="breadcrumb-item"><a href="page-cookie.html">GDPR
									&amp; Cookies</a></li>
						</ul>

						<div class="text-muted mt--30">
							<p>
								Frontend? Admin? What if you don't need anymore to learn and
								work with two different templates on your projects? <b>What
									would you do if time really matter?</b> Both: frontend and admin
								uses exactly the same core and all elements can be used in both
								sides because... actually there are no such thing "two sides"
								with Smarty!
							</p>
						</div>

					</div>

				</div>

			</div>

			<div class="bg-distinct py-3 clearfix">

				<div class="container clearfix font-weight-light text-center-xs">

					<div class="fs--14 py-2 float-start float-none-xs m-0-xs">
						&copy; My Company Inc.</div>

					<ul class="list-inline mb-0 mt-2 float-end float-none-xs m-0-xs">
						<li class="list-inline-item m-0"><img width="38" height="24"
							class="lazy" data-src="assets/images/credit_card/visa.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="visa credit card icon"></li>

						<li class="list-inline-item m-0"><img width="38" height="24"
							class="lazy" data-src="assets/images/credit_card/mastercard.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="mastercard credit card icon"></li>

						<li class="list-inline-item m-0"><img width="38" height="24"
							class="lazy" data-src="assets/images/credit_card/discover.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="discover credit card icon"></li>

						<li class="list-inline-item m-0"><img width="38" height="24"
							class="lazy" data-src="assets/images/credit_card/amazon.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="amazon credit card icon"></li>

						<li class="list-inline-item m-0"><img width="38" height="24"
							class="lazy" data-src="assets/images/credit_card/paypal.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="paypal credit card icon"></li>

						<li class="list-inline-item m-0"><img width="38" height="24"
							class="lazy" data-src="assets/images/credit_card/skrill.svg"
							src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
							alt="skrill credit card icon"></li>

						<!-- more vendors on assets/images/credit_card/ -->

					</ul>

				</div>
			</div>

		</footer>
		<!-- /Footer -->


	</div>
	<!-- /#wrapper -->

	<script src="${contextPath}/resources/assets/js/core.min.js"></script>

</body>
</html>
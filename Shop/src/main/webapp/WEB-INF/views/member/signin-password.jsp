<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath }"  />
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<%
  request.setCharacterEncoding("UTF-8");
%>  

<script>
	function checkEmail(){
		var member_id = $("#member_id").val();
		var email = $("#email").val();

		$.ajax({
			type:"GET",
			url: "${contextPath}/member/signinCheck.do",
			async : false,
			data:{
				"member_id":member_id,
				"email":email
			},
			success:function(data,textStatus){
				if(data['check']){
					alert("입력하신 이메일로 발송 완료");
					$.ajax({
						type:"POST",
						url: "${contextPath}/member/findPwSendEmail.do",
						async : false,
						data: {
							"member_id":member_id,
							"email":email
						}
					})
					location.href="${contextPath}/member/login.do";		
					//window.location="${contextPath}/member/login";
				}else{
					alert("일치하는 정보가 없습니다.")
				}
			},
			error: function(data,textStatus){
				alert("에러가 발생했습니다.");
			},
			/* complete:function(data,textStatus){
				alert("작업을 완료했습니다.");
			} */
		}); 
	}
</script>

	<body>

		<div id="wrapper">
			<!-- /PAGE TITLE -->


			<!-- FORM -->
			<section>
				<div class="container">


					<div class="row">

						<div class="col-12 col-sm-8 col-md-8 col-lg-6 offset-sm-2 offset-md-2 offset-lg-3">

							<!-- optional class: .form-control-pill -->
							<form novalidate class="bs-validate p-5 rounded shadow-xs">

								<h2 class="h5 text-center mb-5 mt-3">
									비밀번호 찾기
								</h2>
								<p class="text-danger" style = "text-align:center; color: blue;" >
									입력된 정보로 임시 비밀번호가 전송됩니다.
								</p>
								
								<!-- <div class="form-label-group mb-3">
									<input required placeholder="member_name" id="member_name" name="member_name" type="text" class="form-control">
									<label for="account_email">이름</label>
								</div> -->

								<div class="form-label-group mb-3">
									<input required placeholder="member_id" id="member_id" name="member_id" type="text" class="form-control">
									<label for="account_email">아이디</label>
								</div>

								<div class="form-label-group mb-3">
									<input required placeholder="Email" id="email" name="email" type="email" class="form-control">
									<label for="account_email">이메일</label>
								</div>
								
								<div class="row">

									<div class="col-12 col-md-6 mt-4">
										<button type="submit" class="btn btn-primary btn-block" onclick = "checkEmail()">
											찾기
										</button>
									</div>

									<div class="col-12 col-md-6 mt-4 text-align-end text-center-xs">
										<!-- empty -->
									</div>

								</div>

							</form>
						</div>

					</div>

				</div>
			</section>
			<!-- /FORM -->




			<!-- Footer -->
			<footer id="footer" class="footer-dark">
				<div class="container">

					<div class="row">
						
						<div class="bg-distinct col-12 col-md-6 col-lg-4 text-center p-0 py-5">

							<div class="footer-svg-shape position-absolute absolute-top z-index-2 mt--n70 w-100 overflow-hidden pt--5">
								<svg viewBox="0 0 1440 28" fill="none" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">
									<path d="M0 28H1440C1440 28 1154 3.21961e-10 720 1.30487e-09C286 2.28777e-09 0 28 0 28Z"></path>
								</svg>
							</div>

							<form method="post" action="#subscribe_url" class="px-4"> 

								<input type="hidden" name="action" value="subscribe" tabindex="-1"> 
								
								<p id="btnAriaFooterFormTitle" class="text-muted">
									Claim your candy now!
								</p>
								
									
								<div class="input-group-over input-group-pill mb-4"> 
									
									<input required class="form-control b-0" name="subscriber_email" type="email" value="" placeholder="email address..." aria-label="email address...">
									
									<button type="submit" class="btn bg-transparent shadow-none" aria-label="subscribe" aria-labelledby="btnAriaFooterFormTitle"> 
										<i class="fi fi-send fs--18"></i> 
									</button>

								</div>


							</form>

							<div class="mt--12"> 

								<a href="#!" class="btn btn-sm btn-facebook transition-hover-top mb-2 rounded-circle" rel="noopener" aria-label="facebook page">
									<i class="fi fi-social-facebook"></i> 
								</a>

								<a href="#!" class="btn btn-sm btn-twitter transition-hover-top mb-2 rounded-circle" rel="noopener" aria-label="twitter page">
									<i class="fi fi-social-twitter"></i> 
								</a>

								<a href="#!" class="btn btn-sm btn-linkedin transition-hover-top mb-2 rounded-circle" rel="noopener" aria-label="linkedin page">
									<i class="fi fi-social-linkedin"></i> 
								</a>

								<a href="#!" class="btn btn-sm btn-youtube transition-hover-top mb-2 rounded-circle" rel="noopener" aria-label="youtube page">
									<i class="fi fi-social-youtube"></i> 
								</a>

							</div>

						</div>


						<div class="col-12 col-md-6 col-lg-8 py-5 fs--15 text-center-xs">

							<h3 class="fs--15 text-muted">SPY US! WE'VE GOT SECRETS!</h3>

							<ul class="mt--30 mb-0 breadcrumb bg-transparent p-0 block-xs"> 
								<li class="breadcrumb-item"><a href="contact-1.html">Contact</a></li> 
								<li class="breadcrumb-item"><a href="about-us-1.html">About Us</a></li> 
								<li class="breadcrumb-item"><a href="page-terms-and-conditions.html">Terms &amp; Conditions</a></li> 
								<li class="breadcrumb-item"><a href="page-cookie.html">GDPR &amp; Cookies</a></li> 
							</ul>

							<div class="text-muted mt--30">
								<p>
									Frontend? Admin? What if you don't need anymore to learn and work with two different templates on your projects? 
									<b>What would you do if time really matter?</b> Both: frontend and admin uses exactly the same core and all elements can be used in both sides because... actually there are no such thing "two sides" with Smarty!
								</p>
							</div>

						</div>

					</div>

				</div>

				<div class="bg-distinct py-3 clearfix">

					<div class="container clearfix font-weight-light text-center-xs">

						<div class="fs--14 py-2 float-start float-none-xs m-0-xs">
							&copy; My Company Inc.
						</div>

						<ul class="list-inline mb-0 mt-2 float-end float-none-xs m-0-xs"> 
							<li class="list-inline-item m-0"> 
								<img width="38" height="24" class="lazy" data-src="assets/images/credit_card/visa.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="visa credit card icon">
							</li> 

							<li class="list-inline-item m-0"> 
								<img width="38" height="24" class="lazy" data-src="assets/images/credit_card/mastercard.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="mastercard credit card icon">
							</li> 

							<li class="list-inline-item m-0"> 
								<img width="38" height="24" class="lazy" data-src="assets/images/credit_card/discover.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="discover credit card icon">
							</li>

							<li class="list-inline-item m-0"> 
								<img width="38" height="24" class="lazy" data-src="assets/images/credit_card/amazon.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="amazon credit card icon">
							</li>
							
							<li class="list-inline-item m-0"> 
								<img width="38" height="24" class="lazy" data-src="assets/images/credit_card/paypal.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="paypal credit card icon">
							</li>

							<li class="list-inline-item m-0"> 
								<img width="38" height="24" class="lazy" data-src="assets/images/credit_card/skrill.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="skrill credit card icon">
							</li>

							<!-- more vendors on assets/images/credit_card/ -->

						</ul>

					</div>
				</div>

			</footer>
			<!-- /Footer -->


		</div><!-- /#wrapper -->

		<!-- <script src="assets/js/core.min.js"></script> -->
		
	</body>
</html>
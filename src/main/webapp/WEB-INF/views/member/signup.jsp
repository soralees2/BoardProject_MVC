<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<jsp:include page="../common/head.jsp"></jsp:include>
<script>
	var idValidCheck = false;
	$(function () {
		$("#signupId").on("input", function(){
			$.ajax({
				url: "idCheck",
				type: "get",
				data : {
					"id" : $("#signupId").val()
				}
			}).done(function(resp){
				console.log(resp);
				if(resp == "0"){
					$("#id_checked").text("사용 가능한 아이디 입니다.").addClass("text-success").removeClass("text-danger");
				}else{
					$("#id_checked").text("사용 불가능한 아이디 입니다.").addClass("text-danger").removeClass("text-success");
					
				}
			}); 
		});
	});
</script>
</head>
<body>
	<div class="container">
		<section class="signup p-5 shadow bg-white rounded">
			<h2>회원가입</h2>
			<form action="signupProc" method="post" id="signUpForm">
				<div class="form-row align-items-center">
					<div class="col-12 col-sm-2 mb-2">
						<label class="mb-0" for="inlineFormInput">아이디</label>
					</div>
					<div class="col-8 col-sm-auto mb-2">
						<input type="text" class="form-control" name="id" id="signupId" placeholder="아이디를 입력해주세요.">
						
					</div>
					<div class="col-4 col-sm-auto mb-2">
						<span id="id_checked"></span>
					</div>
				</div>
				<div class="form-row align-items-cente">
					<div class="col-12 col-sm-2 mb-2">
						<label class="mb-0" for="">비밀번호</label>
					</div>
					<div class="col-12 col-sm-auto mb-2">
						<input type="password" class="form-control" name="pw" id="inp_pw01" placeholder="비밀번호를 입력해주세요.">
					</div>
				</div>
				<div class="form-row align-items-center">
					<div class="col-12 col-sm-2 mb-2">
						<label class="mb-0" for="">비밀번호 확인</label>
					</div>
					<div class="col-12 col-sm-auto mb-2">
						<input type="password" class="form-control" id="inp_pw02" placeholder="비밀번호를 입력해주세요.">
					</div>
					<div class="col-12 col-sm-auto pw-check mb-2">
						<span class="text-danger" id="pw-danger">비밀번호가 일치하지 않습니다!</span>
						<span class="text-success" id="pw-success">비밀번호가 일치합니다.</span>
					</div>
				</div>
				<div class="form-row align-items-center">
					<div class="col-12 col-sm-2 mb-2">
						<label class="mb-0" for="">이름</label>
					</div>
					<div class="col-12 col-sm-auto mb-2">
						<input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해주세요.">
					</div>
				</div>
				<div class="form-row align-items-center">
					<div class="col-12 col-sm-2 mb-2">
						<label class="mb-0" for="">전화번호</label>
					</div>
					<div class="col-12 col-sm-auto mb-2">
						<input type="text" class="form-control" name="phone" id="phone">
					</div>
				</div>
				<div class="form-row align-items-center">
					<div class="col-12 col-sm-2 mb-2">
						<label class="mb-0" for="">이메일</label>
					</div>
					<div class="col-12 col-sm-auto mb-2">
						<input type="email" class="form-control" id="email" name="email" placeholder="example01@gmail.com">
					</div>
				</div>
				<div class="form-row align-items-center">
					<div class="col-12 col-sm-2 mb-2">
						<label class="mb-0" for="">우편번호</label>
					</div>
					<div class="col-8 col-sm-auto mb-2">
						<input type="text" class="form-control" name="zipcode" id="zipcode">
					</div>
					<div class="col-4 col-sm-auto mb-2">
						<button type="button" class="btn btn-dark w-100" id="search">찾기</button>
					</div>
				</div>
				<div class="form-row align-items-center">
					<div class="col-12 col-sm-2 mb-2">
						<label class="mb-0" for="">주소1</label>
					</div>
					<div class="col-12 col-sm-10 mb-2">
						<input type="text" class="form-control" name="address1" id="address1" placeholder="주소를 입력해 주세요.">
					</div>
				</div>
				<div class="form-row align-items-center">
					<div class="col-12 col-sm-2 mb-2">
						<label class="mb-0" for="">주소2</label>
					</div>
					<div class="col-12 col-sm-10 mb-2">
						<input type="text" class="form-control" name="address2" id="address2" placeholder="주소를 입력해 주세요.">
					</div>
				</div>
				<div class="form-row align-items-center mt-5">
					<div class="col-6 text-center">
						<input type="button" class="btn btn-outline-primary w-100" value="회원가입" id="send">
					</div>
					<div class="col-6 text-center">
						<input type="reset" class="btn btn-outline-secondary w-100" value="다시입력">
					</div>
				</div>
			</form>
		</section>
	</div>
</body>

</html>
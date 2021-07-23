<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<jsp:include page="common/head.jsp"></jsp:include>
<script>
	$(function(){
		$("#signup").on("click", function(){
			location.href="/member/signup";
		})
		$("#logout").on("click", function(){
			location.href="/member/logout";
		})
	})
</script>
</head>
<body>
	<c:choose>
		<c:when test="${loginID == null}">
			<div class="loginBox p-4 shadow bg-white rounded">
				<h2 class="mb-5 text-center">로그인</h2>
				<form action="/member/loginProc" method="post">
					<div class="form-row mb-3">
						<div class="col-12 mb-2">
							<input type="text" class="form-control" name="id" placeholder="아이디를 입력해주세요.">
						</div>
						<div class="col-12">
							<input type="password" class="form-control" name="pw"placeholder="비밀번호를 입력해주세요.">
						</div>
					</div>
					<div class="form-row align-items-center mt-4">
						<div class="col-6 text-center">
							<button class="btn btn-outline-success w-100" id="login">로그인</button>
						</div>
						<div class="col-6 text-center">
							<button type="button" class="btn btn-outline-primary w-100" id="signup">회원가입</button>
						</div>
					</div>
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<div class="welcome text-center">
				<h2>환영합니다 <strong>${loginID}</strong> 님!</h2>
				<p>원하시는 기능을 선택해 주세요:)</p>
				<ul>
					<button id="memberList" class="btn btn-dark">회원명단</button>
					<button id="boardList" class="btn btn-success">게시판</button>
					<button id="modifyMyInfo" class="btn btn-primary">마이페이지</button>
					<button id="modifyPw" class="btn btn-info">비밀번호 변경</button>
					<button id="logout" class="btn btn-warning">로그아웃</button>
					<button id="memberOut" class="btn btn-danger">회원탈퇴</button>
				</ul>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>
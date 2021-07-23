window.onload = function(){

	// 비밀번호 일치 확인
	if(document.getElementById("inp_pw02")){
		document.getElementById("inp_pw02").onkeyup = function () {
			let chkPW = document.getElementById("inp_pw01").value;
			if (chkPW === this.value) {
				document.getElementById("pw-success").setAttribute("style", "display:block");
				document.getElementById("pw-danger").setAttribute("style", "display:none");
			} else {
				document.getElementById("pw-success").setAttribute("style", "display:none");
				document.getElementById("pw-danger").setAttribute("style", "display:block");
			}
		}
	}
	
	// 우편번호 입력
	if(document.getElementById("signUpForm")){
		document.getElementById("search").onclick = function () {
			new daum.Postcode({
				oncomplete: function (data) {
					let roadAddr = data.roadAddress;
		
					document.getElementById('zipcode').value = data.zonecode;
					document.getElementById("address1").value = roadAddr;
				}
			}).open();
		};
	}
	

	let idInput = document.getElementById("signupId");
	let pwInput = document.getElementById("inp_pw01");
	let nameInput = document.getElementById("name");
	let phoneInput = document.getElementById("phone");
	let emailInput = document.getElementById("email");
	
	let idReg = /^[a-z0-9_-]{5,20}$/;
	let pwReg = /^[^ㄱ-ㅎ]\S{8,16}$/;
	let nameRegex = /^[가-힣A-Za-z]+$/;
	let phoneRegex = /^\d{11}$/;
	let check = document.getElementById("signUpForm");
	let emailRegex = /^[A-Za-z0-9]+@[a-z]+[.][a-z]{3}/;
	
	if(document.getElementById("signUpForm")){ // 회원가입 
		
		document.getElementById("send").onclick = function () {
			let resultId = idReg.test(idInput.value);
			let resultPw = pwReg.test(pwInput.value);
			let resultName = nameRegex.test(nameInput.value);
			let resultPhone = phoneRegex.test(phoneInput.value);
			let resultEmail = emailRegex.test(emailInput.value);
			let idcheck;
		
			if (!resultId) {
				alert("아이디는 5-20자의 영문 소문자,숫자와 특수기호 (_),(-)만 사용 가능합니다.");
				return false;
			}
			if (!resultPw) {
				alert("비밀번호는 8-16자 영문 대,소문자,숫자와 특수기호를 사용하세요.");
				return false;
			}
			if (!resultName) {
				alert("이름은 한글과 영문 대,소문자를 사용하세요.(특수기호,공백 사용 불가)");
				return false;
			}
			if (!resultPhone) {
				alert("전화번호를 정확히 입력해주세요.");
				return false;
			}
			if (!resultEmail) {
				alert("이메일을 정확한 형식으로 입력해주세요.");
				return false;
			}
			/*
			if (idValidCheck == false) {
				alert("아이디 중복확인을 해주세요!");
				return false;
			}
			*/
			document.getElementById("signUpForm").submit();
		};

	}else if(document.getElementById("pwModiForm")){ // 비밀번호 변경

		document.getElementById("send").onclick = function () {
			let resultPw = pwReg.test(pwInput.value);

			if (!resultPw) {
				alert("비밀번호는 8-16자 영문 대,소문자,숫자와 특수기호를 사용하세요.");
				return false;
			}
			document.getElementById("pwModiForm").submit();
		};

	}else if(document.getElementById("myInfocheckForm")){ //회원 정보 수정
		
		document.getElementById("send").onclick = function () {
			let resultPw = pwReg.test(pwInput.value);
			let resultName = nameRegex.test(nameInput.value);
			let resultPhone = phoneReg.test(phoneInput.value);
			let resultEmail = emailRegex.test(emailInput.value);		
			
			if (!resultPw) {
				alert("비밀번호는 8-16자 영문 대,소문자,숫자와 특수기호를 사용하세요.");
				return false;
			}
			if (!resultName) {
				alert("이름은 한글과 영문 대,소문자를 사용하세요.(특수기호,공백 사용 불가)");
				return false;
			}
			if (!resultPhone) {
				alert("전화번호를 정확히 입력해주세요.");
				return false;
			}
			if (!resultEmail) {
				alert("이메일을 정확한 형식으로 입력해주세요.");
				return false;
			}
			document.getElementById("myInfocheckForm").submit();
		};
	}
}


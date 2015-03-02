<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="reset.css" rel="stylesheet" type="text/css" />
<link href="list-layout.css" rel="stylesheet" type="text/css" />
<link href="list-style.css" rel="stylesheet" type="text/css" />
<link href="list-deploy.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="modernizr.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>

<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>


<script type="text/javascript">

    $(function () {

        $(document).tooltip();

    });

    </script>

<!--<script type="text/javascript">
            function changetxt() {
            if ($('.pwd').val() == "Enter Your Password Here" ) {
            $('.pwd').val('');
            $('.pwd').css('color', 'black' );
            }
            }
            function textboxtype() {
            if ($('.pwd').val().length < 1) {
            $('.pwd').val('Enter Your Password Here');
            $('.pwd').css('color', 'gray');
        }
    }
    </script>-->
</head>
<body>

	<!----<헤더 영역>----------------------------------------------------------->

	<header id="header">
		<div class="content-wrapper">
			<h1 id="logo">
				<a href=""><img src="images/logo_brown.png" alt="튠에이" /></a>
			</h1>
			<section class="header-item-container">
				<h1 class="hidden">머리말</h1>
				<nav id="member-menu">
					<h1 class="hidden">회원 메뉴</h1>
					<ul class="clearfix">
						<li class="member-menu-item"><a class="member-menu-item-text"
							href="">Join</a></li>
						<li class="member-menu-item"><a class="member-menu-item-text"
							href="">Login</a></li>
					</ul>
				</nav>
			</section>
		</div>
	</header>

	<!----<메인 메뉴 영역>----------------------------------------------------------->

	<aside id="main-menu">
		<div class="content-wrapper">
			<div class="main-menu-item-container">
				<h2 class="hidden">메인 메뉴</h2>
				<nav id="main-menu-list">
					<h3 class="hidden">메인 목록</h3>
					<ul class="clearfix">
						<li class="main-menu-item"><a class="main-menu-item-text"
							href="">Orchestra</a></li>
						<li class="main-menu-item"><a class="main-menu-item-text"
							href="">Concert</a></li>
						<li class="main-menu-item"><a class="main-menu-item-text"
							href="">Video</a></li>
						<li class="main-menu-item"><a class="main-menu-item-text"
							href="">Community</a></li>
						<li class="main-menu-item"><a class="main-menu-item-text"
							href="">About us</a></li>
						<li class="main-menu-item-market"><a
							class="main-menu-item-text" href="">Market</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</aside>

	<!----<바디 영역>----------------------------------------------------------->

	<div id="body">
		<div class="content-wrapper clearfix">



			<main id="main">

			<h2 id="main-title-info">개인 회원가입</h2>
			<div class="main-line"></div>

			<div id="main-join">
				<form action="joinProc.jsp" method="post">
					<fieldset>
						<legend class="hidden">정보수정필드</legend>
						<div class="clearfix">
							<label id="main-join-title-aside" for="Id">아이디</label>
						</div>
						<div class="clearfix-same">
							<input id="main-join-text" type="text" name="Id"
								title="아이디는 10자미만으로 입력 해 주세요." />
							<form id="main-join-button" action="checkIdProc.jsp" method="post">
								<input class="main-newline" type="submit" value="중복확인" />
								<!-- <a class="main-newline" href="checkIdProc.jsp">중복확인</a> -->
							</form>
							<div>
							<span style="color: red;">${checkMsg}</span>
						</div>

						</div>


						<div class="clearfix">
							<label id="main-join-title-aside" for="Pw">비밀번호</label>
						</div>
						<div class="clearfix-same">
							<input id="main-join-text" class="pwd" type="text" name="Pw"
								onfocus="this.value=''"
								onblur="if(this.value==''){this.type='text';}"
								value="비밀번호 8~10자리를 입력 해 주세요." />

						</div>


						<div class="clearfix">
							<label id="main-join-title-aside" for="rePw">비밀번호 재입력</label>
						</div>

						<div class="clearfix-same">
							<input id="main-join-text" type="text" name="rePw" />
						</div>
						<div>
							<span style="color: red;">${msg}</span>
						</div>


						<div class="clearfix">
							<label id="main-join-title-aside" for="fam_name">성명 이름</label> <label
								id="main-join-title-gender" for="last_name">성</label> <label
								id="main-join-title-gender2" for="gender">성별</label>
						</div>
						<div class="clearfix-same">
							<input id="main-name-text" type="text" name="fam_name" /> <input
								id="main-lastname-text" type="text" name="last_name" /> <select
								id="main-join-button2" name="field">
								<option>남자</option>
								<option>여자</option>
							</select>
						</div>



						<div class="clearfix">
							<label id="main-join-title-aside" for="nicname">닉네임</label>
						</div>
						<div class="clearfix-same">
							<input id="main-name-text" type="text" name="nicname" />
							<p id="main-join-button">
								<a class="main-newline" href="">중복확인</a>
							</p>
						</div>



						<div class="clearfix">
							<label id="main-join-title-aside" for="birth">생년월일</label>
						</div>
						<div class="clearfix-same">
							<input id="main-join-text" type="text" name="birth" />
						</div>


						<div class="clearfix">
							<label id="main-join-title-aside" for="email">E-mail</label>
						</div>
						<div class="clearfix-same">
							<input id="main-join-text" type="text" name="email" />
						</div>



						<div class="clearfix">
							<label id="main-join-title-aside" for="phone">연락처</label>
						</div>
						<div class="clearfix-same">
							<input id="main-join-text" type="text" name="phone" />
						</div>


						<div class="clearfix">
							<label id="main-join-title-aside" for="address">거주지</label>
						</div>

						<div class="clearfix-same">
							<input id="main-name-address" type="text" name="address" />
						</div>

						<div class="clearfix-final">
							<p id="main-join-final">
								<input type="submit" value="가입" />
							</p>
						</div>
					</fieldset>
				</form>
			</div>

			</main>

			</main>
		</div>
	</div>

	<!----<풋터 영역>----------------------------------------------------------->

	<footer id="footer">
		<div class="content-wrapper clearfix">
			<div id="logo-footer-container">
				<h2 id="logo-footer">
					<img src="images/logo-footer.png" alt="회사 정보" />
				</h2>
			</div>
			<div id="company-info-container">
				<div id="company-info">
					<h3 class="hidden">소유자정보</h3>
					<dl class="clearfix">
						<dt class="company-info-item item-title item-newline">팀장</dt>
						<dd class="company-info-item item-data">김경현</dd>
						<dt class="company-info-item item-title item-newline">이메일</dt>
						<dd class="company-info-item item-data">kyunghyun96@naver.com</dd>
						<dt class="company-info-item item-title item-newline">전화번호</dt>
						<dd class="company-info-item item-data">010-2231-5935</dd>
					</dl>
				</div>

				<div id="copyright">
					<h3 class="hidden">저작권정보</h3>
					<p>Copyright@tune-A.com 2015 -....</p>
				</div>
			</div>
		</div>
	</footer>

	<!----<퀵메뉴 영역>----------------------------------------------------------->
	<!--<aside id="quick-menu">
        <h1>QUICK MENU</h1>

        <nav>
            <h1>자주가는 메뉴</h1>
            <ul>
                <li>오케스트라 소개</li>
                <li>공연 소개</li>
                <li>공연 영상</li>
                <li>게시판</li>
            </ul>
        </nav>

        <nav>
            <h1>스크롤 메뉴</h1>
            <ul>
                <li>맨 위로 △</li>
                <li>아래로 ▽</li>
            </ul>
        </nav>
    </aside>-->
</body>
</html>
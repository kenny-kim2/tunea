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
    <link href="login-list-style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="modernizr.js">

    </script>
    <script type="text/javascript" src="http://www.linuxstudy.pe.kr/~digiko/style/jquery-1.4.2.min.js"></script>
    <!--  <link href="css/normalize.css" rel="stylesheet" type="text/css"/> -->
    <link href="css/datepicker.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
    <!--<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>-->
  
   <!-------------------로그인 자바,스타일영역------------>
    <script type="text/javascript">

    function wrapWindowByMask() {
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();

        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $('#mask').css({ 'width': maskWidth, 'height': maskHeight });
        //마스크의 투명도 처리
        $('#mask').fadeTo("slow", 0.5);
    }

    $(document).ready(function () {
        //wrapWindowByMask();
        //불투명 배경 띄우기
           $('#test').show();
        wrapWindowByMask();
        
        
        $('.openMask').click(function (e) {
            e.preventDefault();
            wrapWindowByMask();
        });
    });

    // 팝업 , 불투명 배경 띄우기
  /*   function clicktest() {
        $('#test').show();
        wrapWindowByMask();
    }
 */
    function btnexit() {
        $('#test').hide();
        $('#mask').hide();

    }
    </script>
    <style type="text/css">
        #mask {
            position: absolute;
            z-index: 9000;
            background-color: #000;
            display: none;
            left: 0;
            top: 0;
        }
    </style>
  
      


        


</head>
<body>
   

    <!------------------------------------------------로그인 팝업----------------------->
    <!--<input type="button" onclick="clicktest();" value="블러테스트" />-->
    <div id="mask"></div>
    <div style="background:#ffffff; width: 300px; height: 400px; position: absolute; top:250px; left:600px; display: none; z-index:10001; border:1px;border-radius:5px;" id="test">
        <img id="btn-close" src="images/btn-close02.png"   onclick="btnexit();"  />

        <!--  <h1 id="main-title"><로그인></h1>-->

        <div>
            <!--<h2 class="hidden">로그인 폼</h2>-->
            
            <div>
				<span style="color:red;">${msg}</span>
			</div>
            <form action="loginProc.jsp" method="post">
                <div id="main-logo">
                    <img src="images/logo.png" />
                </div>
                <fieldset>
                    <!--<legend class="hidden">로그인 필드</legend>-->
                    <div class="main-item-text">
                        <label class="main-info-item" name=>ID</label>
                    </div>
                    
                    <input class="login-table-textbox" type="text" name="uid" onfocus="this.value=''"
                           onblur="if(this.value==''){this.type='text';}" value="아이디 8~10자리를 입력 해 주세요." />
                    <br />


                    <div class="main-item-text">
                        <label class="main-info-item" for=" pwd">PW</label>
                    </div>
                    <input class="login-table-textbox" type="password" name="pwd" onfocus="this.value=''"
                           onblur="if(this.value==''){this.type='password';}" value="비밀번호 8~10자리를 입력 해 주세요." />
                    <br />

                        
                       <input id="login-btn" type="submit" value="로그인"/>
                   
                </fieldset>
            </form>
        </div>
        <nav id="main-member">
            <!--<h1 class="hidden">회원 가입 및 정보찾기</h1>-->
            <ul>
                <li class="main-member-item"><a class="main-member-item-text" href="info_search.html">ID/PW 찾기</a></li>
                <li class="main-member-item"><a class="main-member-item-text" href="join.html">회원 가입</a></li>
            </ul>
        </nav>









    </div>

   
</body>
</html>
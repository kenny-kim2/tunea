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
        
        $('.openMask').click(function (e) {
            e.preventDefault();
            wrapWindowByMask();
        });
    });

    // 팝업 , 불투명 배경 띄우기
     function clicktest() {
        $('#test').show();
        wrapWindowByMask();
    }
 
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
  <!---------------------------------<퀵 메뉴>--------------------------->
  
   

    <div id="quick" style="position:absolute; z-index:2;top:0;left:1300px;width:150px;height:200px;">
        <div id="clickme" style="text-align:center; font-family: 맑은 고딕, 고딕, sans-serif; font-size:15px;font-weight: bold; color: #313131;cursor:pointer;">▽Quick Menu▽</div>
        <div id="quickmenu" class="hidden" style="border:2px solid #cbb48b; border-radius:5px; background:white !important;">
            <div style="padding-top:10px; text-align:center; font-family: 맑은 고딕, 고딕, sans-serif; font-size:20px;font-weight: bold; color: #313131; ">퀵메뉴</div>
            <div style="padding-top:20px; text-align:center; font-family: 맑은 고딕, 고딕, sans-serif; font-size:12px;font-weight: bold; color: #313131;">동영상</div>
            <div style="padding-top:10px; text-align:center; text-align:center; font-family: 맑은 고딕, 고딕, sans-serif; font-size:12px;font-weight: bold; color: #313131;">오케스트라</div>
            <div style="padding-top:10px; text-align:center; font-family: 맑은 고딕, 고딕, sans-serif; font-size:12px;font-weight: bold; color: #313131;">커뮤니티</div>
            <div style="padding-top:10px; text-align:center; font-family: 맑은 고딕, 고딕, sans-serif; font-size:12px;font-weight: bold; color: #313131;">콘서트</div>

            <div style="padding-top:10px; text-align:center; font-family: 맑은 고딕, 고딕, sans-serif; font-size:12px;font-weight: bold; color: #313131;"><a href="#top">▲맨위로</a></div>
            <div style="padding-top:5px; text-align:center; font-family: 맑은 고딕, 고딕, sans-serif; font-size:12px;font-weight: bold; color: #313131;"><a onclick="window.scrollTo(0,document.body.scrollHeight);" style="cursor:pointer;">▼맨아래로</a></div>
        </div>
    </div>

     
   

        <script type="text/javascript">

            $(function () {
                $("#datepicker_1month").click(function () {

                    // Getter

                    /* 		var maxDate = $("#datepicker_next").datepicker( "option", "maxDate");
                            var minDate = $("#datepicker_pre").datepicker( "option", "minDate"); */

                    nowdate = new Date();

                    if (nowdate.getMonth() == 0)
                        var preDate = nowdate.getFullYear() + "-" + "12" + "-" + nowdate.getDate();
                    else
                        var preDate = nowdate.getFullYear() + "-" + (nowdate.getMonth()) + "-" + nowdate.getDate();

                    var nextDate = nowdate.getFullYear() + "-" + (nowdate.getMonth() + 1) + "-" + nowdate.getDate();


                    // Setter
                    $("#datepicker_pre").val(preDate);
                    $("#datepicker_next").val(nextDate);




                });
            });


        </script>
        <script type="text/javascript">
            $("#clickme").click(function () {

                $("#quickmenu").animate({

                    backgroundColor: "#aa0000",

                    color: "#fff",



                    //left: "+=50",

                    height: "toggle"

                }, 500, function () {
                  
                    // Animation complete.

                   



                });

            });

        </script>


        <script type="text/javascript">
            $(function () {
                $('#datepicker_pre').datepicker({
                    inline: true,
                    //nextText: '&rarr;',
                    //prevText: '&larr;',
                    showOtherMonths: true,
                    changeYear: true,
                    changeMonth: true,
                    //dateFormat: 'dd MM yy',
                    dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                    //showOn: "button",
                    //buttonImage: "img/calendar-blue.png",
                    //buttonImageOnly: true,
                    maxDate: '0d',
                    dateFormat: 'yy-mm-dd',
                    onClose: function (selectedDate) {

                        $('#datepicker_next').datepicker("option", "minDate", selectedDate);

                    }


                });
            });










            $(function () {
                $('#datepicker_next').datepicker({
                    inline: true,
                    //nextText: '&rarr;',
                    //prevText: '&larr;',
                    showOtherMonths: true,
                    changeYear: true,
                    changeMonth: true,
                    //dateFormat: 'dd MM yy',
                    dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                    //showOn: "button",
                    //buttonImage: "img/calendar-blue.png",
                    //buttonImageOnly: true,
                    maxDate: '+0d',
                    dateFormat: 'yy-mm-dd',
                   

                    onClose: function (selectedDate) {

                        /* var defaultDate = $( ".selector" ).datepicker( "option", "defaultDate" ); */

                        $('#datepicker_pre').datepicker("option", "maxDate", selectedDate);


                    }





                });
            });




        </script>

    <script type="text/javascript">
    var quick_menu = $('#quick');
    var quick_top = 300;

    /* quick menu initialization */
    quick_menu.css('top', $(window).height());
    $(window).resize(function () {
        quick_menu.stop();
        quick_menu.animate({ "left": $(document).scrollLeft() + $('.quick-content').offset().left + 20 + $('.quick-content').width() + "px" }, 100);
    });

    $(document).ready(function () {
        quick_menu.animate({ "top": $(document).scrollTop() + quick_top + "px" }, 500);
        quick_menu.animate({ "left": $(document).scrollLeft() + $('.quick-content').offset().left + 20 + $('.quick-content').width() + "px" }, 100);

        $(window).scroll(function () {
            quick_menu.stop();
            quick_menu.animate({ "top": $(document).scrollTop() + quick_top + "px" }, 500);
        });
    });

    </script>







        <script type="text/javascript">

            $(function () {
                $("#check_all").click(function () {
                    if ($("#check_all").prop("checked")) {
                        $("input[type=checkbox]").prop("checked", true);
                    }
                    else {
                        $("input[type=checkbox]").prop("checked", false);
                    }
                })
            })

        </script>


</head>
<body>
      <!----<헤더 영역>----------------------------------------------------------->

        <header id="header">
            <div class="content-wrapper quick-content">
                <h1 id="logo"><a href=""><img src="images/logo_brown.png" alt="튠에이" /></a></h1>
                <section class="header-item-container">
                    <h1 class="hidden">머리말</h1>
                    <nav id="member-menu">
                        <h1 class="hidden">회원 메뉴</h1>
                        <ul class="clearfix">
                            <li class="member-menu-item"><a class="member-menu-item-text" href="">Join</a></li>
                           <li class="member-menu-item"><a class="member-menu-item-text" onclick="clicktest();">Login</a></li> 
                        <!--   <li class="member-menu-item"><a class="member-menu-item-text" href="login.jsp">Login</a></li> -->
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
                            <li class="main-menu-item"><a class="main-menu-item-text" href="">Orchestra</a></li>
                            <li class="main-menu-item"><a class="main-menu-item-text" href="">Concert</a></li>
                            <li class="main-menu-item"><a class="main-menu-item-text" href="">Video</a></li>
                            <li class="main-menu-item"><a class="main-menu-item-text" href="">Community</a></li>
                            <li class="main-menu-item"><a class="main-menu-item-text" href="">About us</a></li>
                            <li class="main-menu-item-market"><a class="main-menu-item-text" href="">Market</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </aside>

        <!----<바디 영역>----------------------------------------------------------->

        <div id="body">
            <div class="content-wrapper clearfix">
                <aside id="sub-menu">
                    <h1 class="hidden">서브 메뉴</h1>
                    <nav id="sub-menu-list">
                        <h2 class="hidden">서브 목록</h2>

                    </nav>
                </aside>

                <main id="main">
                    <h2 id="main-title">쪽지</h2>
                    <div class="main-line">


                    </div>



                    <div>
                        <h3 class="hidden">간편옵션</h3>
                    </div>
                    <div id="message-option">
                        <ol>
                            <li class="message-option-item"><label for="allcheck">전체선택</label> <input id="check_all" type="checkbox" name="allcheck" /></li>
                            <!--<li class="message-option-cal" style="padding-right:30px;">날짜범위</li>-->
                            <li class="message-option-cal">
                                <input style="width:120px; background:none; border:2px solid #cbb48b;" type="button" id="datepicker_pre" value="날짜 선택" />~
                            </li>
                            <li class="message-option-cal">
                                <input style="width:120px; background:none; border:2px solid #cbb48b;" type="button" id="datepicker_next" value="날짜 선택" />
                                <!--<br /><br />
                <input style="width:100px; background:none; border:2px solid #cbb48b;" type="button" id="datepicker_1month" value="1개월" />-->
                            </li>
                        </ol>
                    </div>


                    <!--<div id="orch-search-container">
                        <div id="search-form">
                            <h3 class="hidden">오케스트라 찾기 검색 폼</h3>
                            <form>
                                <fieldset>
                                    <legend class="hidden">오케스트라 찾기 검색 필드</legend>
                                    <label for="field" class="hidden">검색분류</label>
                                    <select class="search-field" name="field">
                                        <option>서울</option>
                                        <option>부산</option>
                                        <option>대구</option>
                                        <option>인천</option>
                                        <option>광주</option>
                                        <option>대전</option>
                                        <option>울산</option>
                                        <option>세종</option>
                                        <option>경기</option>
                                        <option>강원</option>
                                        <option>충북</option>
                                        <option>충남</option>
                                        <option>전북</option>
                                        <option>전남</option>
                                        <option>경북</option>
                                        <option>경남</option>
                                        <option>제주</option>
                                    </select>
                                    <label for="district" class="hidden">지역검색</label>
                                    <input class="search-input" type="text" name="district" />
                                    <input class="search-button" type="submit" value="검색" />
                                </fieldset>
                            </form>
                        </div>
                    </div>-->
                    <!----------------------------시작-->
                    <div>
                        <h3 class="hidden">쪽지보기페이지</h3>
                        <table>
                            <tr>
                                <td>

                                    <table id="table-frame">


                                        <tr id="message-header">
                                            <td class="message-left title"><a>쪽지</a></td>
                                            <td class="message-right">N</td>
                                        </tr>
                                        <tr class="msg-name">
                                            <td class="message-left writer">보낸사람</td>
                                            <td class="message-date date">2015.01.17</td>
                                        </tr>

                                        <tr>
                                            <td colspan=2>
                                                <div class="message-content msgcontent">
                                                    <a href="view.html">
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan=2 align=right><input type="checkbox" name="partcheck" /></td>
                                        </tr>
                                    </table>
                                </td>


                                <td>

                                    <table id="table-frame">


                                        <tr id="message-header">
                                            <td class="message-left title"><a>쪽지</a></td>
                                            <td class="message-right">N</td>
                                        </tr>
                                        <tr class="msg-name">
                                            <td class="message-left writer">보낸사람</td>
                                            <td class="message-date date">2015.01.17</td>
                                        </tr>

                                        <tr>
                                            <td colspan=2>
                                                <div class="message-content msgcontent">
                                                    <a href="view.html">
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan=2 align=right><input type="checkbox" name="partcheck" /></td>
                                        </tr>
                                    </table>
                                </td>


                                <td>

                                    <table id="table-frame">


                                        <tr id="message-header">
                                            <td class="message-left title"><a>쪽지</a></td>
                                            <td class="message-right">N</td>
                                        </tr>
                                        <tr class="msg-name">
                                            <td class="message-left writer">보낸사람</td>
                                            <td class="message-date date">2015.01.17</td>
                                        </tr>

                                        <tr>
                                            <td colspan=2>
                                                <div class="message-content msgcontent">
                                                    <a href="view.html">
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan=2 align=right><input type="checkbox" name="partcheck" /></td>
                                        </tr>
                                    </table>

                                </td>

                            </tr>


                            <tr>
                                <td>

                                    <table id="table-frame">


                                        <tr id="message-header">
                                            <td class="message-left title"><a>쪽지</a></td>
                                            <td class="message-right">N</td>
                                        </tr>
                                        <tr class="msg-name">
                                            <td class="message-left writer">보낸사람</td>
                                            <td class="message-date date">2015.01.17</td>
                                        </tr>

                                        <tr>
                                            <td colspan=2>
                                                <div class="message-content msgcontent">
                                                    <a href="view.html">
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan=2 align=right><input type="checkbox" name="partcheck" /></td>
                                        </tr>
                                    </table>
                                </td>


                                <td>

                                    <table id="table-frame">


                                        <tr id="message-header">
                                            <td class="message-left title"><a>쪽지</a></td>
                                            <td class="message-right">N</td>
                                        </tr>
                                        <tr class="msg-name">
                                            <td class="message-left writer">보낸사람</td>
                                            <td class="message-date date">2015.01.17</td>
                                        </tr>

                                        <tr>
                                            <td colspan=2>
                                                <div class="message-content msgcontent">
                                                    <a href="view.html">
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan=2 align=right><input type="checkbox" name="partcheck" /></td>
                                        </tr>
                                    </table>
                                </td>


                                <td>

                                    <table id="table-frame">


                                        <tr id="message-header">
                                            <td class="message-left title"><a>쪽지</a></td>
                                            <td class="message-right">N</td>
                                        </tr>
                                        <tr class="msg-name">
                                            <td class="message-left writer">보낸사람</td>
                                            <td class="message-date date">2015.01.17</td>
                                        </tr>

                                        <tr>
                                            <td colspan=2>
                                                <div class="message-content msgcontent">
                                                    <a href="view.html">
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan=2 align=right><input type="checkbox" name="partcheck" /></td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>



                            <tr>
                                <td>

                                    <table id="table-frame">


                                        <tr id="message-header">
                                            <td class="message-left title"><a>쪽지</a></td>
                                            <td class="message-right">N</td>
                                        </tr>
                                        <tr class="msg-name">
                                            <td class="message-left writer">보낸사람</td>
                                            <td class="message-date date">2015.01.17</td>
                                        </tr>

                                        <tr>
                                            <td colspan=2>
                                                <div class="message-content msgcontent">
                                                    <a href="view.html">
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan=2 align=right><input type="checkbox" name="partcheck" /></td>
                                        </tr>
                                    </table>
                                </td>


                                <td>


                                    <table id="table-frame">


                                        <tr id="message-header">
                                            <td class="message-left title"><a>쪽지</a></td>
                                            <td class="message-right">N</td>
                                        </tr>
                                        <tr class="msg-name">
                                            <td class="message-left writer">보낸사람</td>
                                            <td class="message-date date">2015.01.17</td>
                                        </tr>

                                        <tr>
                                            <td colspan=2>
                                                <div class="message-content msgcontent">
                                                    <a href="view.html">
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan=2 align=right><input type="checkbox" name="partcheck" /></td>
                                        </tr>
                                    </table>
                                </td>


                                <td>

                                    <table id="table-frame">


                                        <tr id="message-header">
                                            <td class="message-left title"><a>쪽지</a></td>
                                            <td class="message-right">N</td>
                                        </tr>
                                        <tr class="msg-name">
                                            <td class="message-left writer">보낸사람</td>
                                            <td class="message-date date">2015.01.17</td>
                                        </tr>

                                        <tr>
                                            <td colspan=2>
                                                <div class="message-content msgcontent">
                                                    <a href="view.html">
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan=2 align=right><input type="checkbox" name="partcheck" /></td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>


                            <tr>
                                <td>

                                    <table id="table-frame">


                                        <tr id="message-header">
                                            <td class="message-left title"><a>쪽지</a></td>
                                            <td class="message-right">N</td>
                                        </tr>
                                        <tr class="msg-name">
                                            <td class="message-left writer">보낸사람</td>
                                            <td class="message-date date">2015.01.17</td>
                                        </tr>

                                        <tr>
                                            <td colspan=2>
                                                <div class="message-content msgcontent">
                                                    <a href="view.html">
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan=2 align=right><input type="checkbox" name="partcheck" /></td>
                                        </tr>
                                    </table>
                                </td>


                                <td>


                                    <table id="table-frame">


                                        <tr id="message-header">
                                            <td class="message-left title"><a>쪽지</a></td>
                                            <td class="message-right">N</td>
                                        </tr>
                                        <tr class="msg-name">
                                            <td class="message-left writer">보낸사람</td>
                                            <td class="message-date date">2015.01.17</td>
                                        </tr>

                                        <tr>
                                            <td colspan=2>
                                                <div class="message-content msgcontent">
                                                    <a href="view.html">
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan=2 align=right><input type="checkbox" name="partcheck" /></td>
                                        </tr>
                                    </table>

                                </td>


                                <td>
                                    <table id="table-frame">


                                        <tr id="message-header">
                                            <td class="message-left title"><a>쪽지</a></td>
                                            <td class="message-right">N</td>
                                        </tr>
                                        <tr class="msg-name">
                                            <td class="message-left writer">보낸사람</td>
                                            <td class="message-date date">2015.01.17</td>
                                        </tr>

                                        <tr>
                                            <td colspan=2>
                                                <div class="message-content msgcontent">
                                                    <a href="view.html">
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                        진바보임종진바보임종진바보 진바보임종진바보임종진바보
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan=2 align=right><input type="checkbox" name="partcheck" /></td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                        </table>
                    </div>

                    <div id="pager-container">
                        <div class="pager">
                            <h3 class="hidden">페이저</h3>
                            <p class="pager-item"><img src="images/btn-prev.png" alt="이전" /></p>
                            <ul class="pager-list">
                                <li class="pager-item"><a href="" class="text-highlight">1</a></li>
                                <li class="pager-item"><a href="">2</a></li>
                                <li class="pager-item"><a href="">3</a></li>
                                <li class="pager-item"><a href="">4</a></li>
                                <li class="pager-item"><a href="">5</a></li>
                            </ul>
                            <p class="pager-item"><img src="images/btn-next.png" alt="다음" /></p>
                        </div>
                    </div>

                    <h3 class="hidden">등록 메뉴</h3>
                    <div id="request-option">
                        <ol>
                            <li class="request-item"><a href="send.html">쪽지 쓰기</a></li>
                            <li class="request-item"><a href="list.html">삭제</a></li>
                        </ol>
                    </div>







                </main>
            </div>
        </div>


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

    <!----<풋터 영역>---------------------------------------------------------->

    <footer id="footer">
        <div class="content-wrapper clearfix">
            <div id="logo-footer-container">
                <h2 id="logo-footer"><img src="images/logo-footer.png" alt="회사 정보" /></h2>
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

    <!----<���޴� ����>----------------------------------------------------------->
    <!--<aside id="quick-menu">
        <h1>QUICK MENU</h1>

        <nav>
            <h1>���ְ��� �޴�</h1>
            <ul>
                <li>���ɽ�Ʈ�� �Ұ�</li>
                <li>���� �Ұ�</li>
                <li>���� ����</li>
                <li>�Խ���</li>
            </ul>
        </nav>

        <nav>
            <h1>��ũ�� �޴�</h1>
            <ul>
                <li>�� ���� ��</li>
                <li>�Ʒ��� ��</li>
            </ul>
        </nav>
    </aside>-->
</body>
</html>

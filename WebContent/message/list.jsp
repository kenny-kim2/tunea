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
    <!----------------Ÿ��Ʋ�����߱�----------->
    <!--<script type="text/javascript">

    $(function () {

        $(document).tooltip();

    });

    </script>-->
    <!-------------------�α��� �ڹ�,��Ÿ�Ͽ���------------>
    <script type="text/javascript">

        function wrapWindowByMask() {
            //ȭ���� ���̿� �ʺ� ���Ѵ�.
            var maskHeight = $(document).height();
            var maskWidth = $(window).width();

            //����ũ�� ���̿� �ʺ� ȭ�� ������ ����� ��ü ȭ���� ä���.
            $('#mask').css({ 'width': maskWidth, 'height': maskHeight });
            //����ũ�� ���� ó��
            $('#mask').fadeTo("slow", 0.8);
        }

        $(document).ready(function () {
            //wrapWindowByMask();
            //������ ��� ����
            $('.openMask').click(function (e) {
                e.preventDefault();
                wrapWindowByMask();
            });
        });

        // �˾� , ������ ��� ����
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

    <!---------------------------------<�� �޴�>--------------------------->



    <div id="quick" style="position:absolute; z-index:2;top:0;left:1300px;width:150px;height:200px;">
        <div id="clickme" style="text-align:center; font-family: ���� ���, ���, sans-serif; font-size:15px;font-weight: bold; color: #313131;cursor:pointer;">��Quick Menu��</div>
        <div id="quickmenu" class="hidden" style="border:2px solid #cbb48b; border-radius:5px; background:white !important;">
            <div style="padding-top:10px; text-align:center; font-family: ���� ���, ���, sans-serif; font-size:20px;font-weight: bold; color: #313131; ">���޴�</div>
            <div style="padding-top:20px; text-align:center; font-family: ���� ���, ���, sans-serif; font-size:12px;font-weight: bold; color: #313131;">������</div>
            <div style="padding-top:10px; text-align:center; text-align:center; font-family: ���� ���, ���, sans-serif; font-size:12px;font-weight: bold; color: #313131;">���ɽ�Ʈ��</div>
            <div style="padding-top:10px; text-align:center; font-family: ���� ���, ���, sans-serif; font-size:12px;font-weight: bold; color: #313131;">Ŀ�´�Ƽ</div>
            <div style="padding-top:10px; text-align:center; font-family: ���� ���, ���, sans-serif; font-size:12px;font-weight: bold; color: #313131;">�ܼ�Ʈ</div>

            <div style="padding-top:10px; text-align:center; font-family: ���� ���, ���, sans-serif; font-size:12px;font-weight: bold; color: #313131;"><a href="#top">�������</a></div>
            <div style="padding-top:5px; text-align:center; font-family: ���� ���, ���, sans-serif; font-size:12px;font-weight: bold; color: #313131;"><a onclick="window.scrollTo(0,document.body.scrollHeight);" style="cursor:pointer;">��ǾƷ���</a></div>
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
    <!----<��� ����>----------------------------------------------------------->

    <header id="header">
        <div class="content-wrapper quick-content">
            <h1 id="logo"><a href=""><img src="images/logo_brown.png" alt="ƪ����" /></a></h1>
            <section class="header-item-container">
                <h1 class="hidden">�Ӹ���</h1>
                <nav id="member-menu">
                    <h1 class="hidden">ȸ�� �޴�</h1>
                    <ul class="clearfix">
                        <li class="member-menu-item"><a class="member-menu-item-text" href="">Join</a></li>
                        <li class="member-menu-item"><a class="member-menu-item-text" onclick="clicktest();">Login</a></li>
                    </ul>
                </nav>
            </section>
        </div>
    </header>

    <!----<���� �޴� ����>----------------------------------------------------------->

    <aside id="main-menu">
        <div class="content-wrapper">
            <div class="main-menu-item-container">
                <h2 class="hidden">���� �޴�</h2>
                <nav id="main-menu-list">
                    <h3 class="hidden">���� ���</h3>
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

    <!----<�ٵ� ����>----------------------------------------------------------->

    <div id="body">
        <div class="content-wrapper clearfix">
            <aside id="sub-menu">
                <h1 class="hidden">���� �޴�</h1>
                <nav id="sub-menu-list">
                    <h2 class="hidden">���� ���</h2>

                </nav>
            </aside>

            <main id="main">
                <h2 id="main-title">����</h2>
                <div class="main-line">


                </div>



                <div>
                    <h3 class="hidden">����ɼ�</h3>
                </div>
                <div id="message-option">
                    <ol>
                        <li class="message-option-item"><label for="allcheck">��ü����</label> <input id="check_all" type="checkbox" name="allcheck" /></li>
                        <!--<li class="message-option-cal" style="padding-right:30px;">��¥����</li>-->
                        <li class="message-option-cal">
                            <input style="width:120px; background:none; border:2px solid #cbb48b;" type="button" id="datepicker_pre" value="��¥ ����" />~
                        </li>
                        <li class="message-option-cal">
                            <input style="width:120px; background:none; border:2px solid #cbb48b;" type="button" id="datepicker_next" value="��¥ ����" />
                            <!--<br /><br />
                            <input style="width:100px; background:none; border:2px solid #cbb48b;" type="button" id="datepicker_1month" value="1����" />-->
                        </li>
                    </ol>
                </div>


                <!--<div id="orch-search-container">
                    <div id="search-form">
                        <h3 class="hidden">���ɽ�Ʈ�� ã�� �˻� ��</h3>
                        <form>
                            <fieldset>
                                <legend class="hidden">���ɽ�Ʈ�� ã�� �˻� �ʵ�</legend>
                                <label for="field" class="hidden">�˻��з�</label>
                                <select class="search-field" name="field">
                                    <option>����</option>
                                    <option>�λ�</option>
                                    <option>�뱸</option>
                                    <option>��õ</option>
                                    <option>����</option>
                                    <option>����</option>
                                    <option>���</option>
                                    <option>����</option>
                                    <option>���</option>
                                    <option>����</option>
                                    <option>���</option>
                                    <option>�泲</option>
                                    <option>����</option>
                                    <option>����</option>
                                    <option>���</option>
                                    <option>�泲</option>
                                    <option>����</option>
                                </select>
                                <label for="district" class="hidden">�����˻�</label>
                                <input class="search-input" type="text" name="district" />
                                <input class="search-button" type="submit" value="�˻�" />
                            </fieldset>
                        </form>
                    </div>
                </div>-->
                <!----------------------------����-->
                <div>
                    <h3 class="hidden">��������������</h3>
                    <table>
                        <tr>
                            <td>

                                <table id="table-frame">


                                    <tr id="message-header">
                                        <td class="message-left title"><a>����</a></td>
                                        <td class="message-right">N</td>
                                    </tr>
                                    <tr class="msg-name">
                                        <td class="message-left writer">�������</td>
                                        <td class="message-date date">2015.01.17</td>
                                    </tr>

                                    <tr>
                                        <td colspan=2>
                                            <div class="message-content msgcontent">
                                                <a href="view.html">
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
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
                                        <td class="message-left title"><a>����</a></td>
                                        <td class="message-right">N</td>
                                    </tr>
                                    <tr class="msg-name">
                                        <td class="message-left writer">�������</td>
                                        <td class="message-date date">2015.01.17</td>
                                    </tr>

                                    <tr>
                                        <td colspan=2>
                                            <div class="message-content msgcontent">
                                                <a href="view.html">
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
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
                                        <td class="message-left title"><a>����</a></td>
                                        <td class="message-right">N</td>
                                    </tr>
                                    <tr class="msg-name">
                                        <td class="message-left writer">�������</td>
                                        <td class="message-date date">2015.01.17</td>
                                    </tr>

                                    <tr>
                                        <td colspan=2>
                                            <div class="message-content msgcontent">
                                                <a href="view.html">
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
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
                                        <td class="message-left title"><a>����</a></td>
                                        <td class="message-right">N</td>
                                    </tr>
                                    <tr class="msg-name">
                                        <td class="message-left writer">�������</td>
                                        <td class="message-date date">2015.01.17</td>
                                    </tr>

                                    <tr>
                                        <td colspan=2>
                                            <div class="message-content msgcontent">
                                                <a href="view.html">
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
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
                                        <td class="message-left title"><a>����</a></td>
                                        <td class="message-right">N</td>
                                    </tr>
                                    <tr class="msg-name">
                                        <td class="message-left writer">�������</td>
                                        <td class="message-date date">2015.01.17</td>
                                    </tr>

                                    <tr>
                                        <td colspan=2>
                                            <div class="message-content msgcontent">
                                                <a href="view.html">
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
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
                                        <td class="message-left title"><a>����</a></td>
                                        <td class="message-right">N</td>
                                    </tr>
                                    <tr class="msg-name">
                                        <td class="message-left writer">�������</td>
                                        <td class="message-date date">2015.01.17</td>
                                    </tr>

                                    <tr>
                                        <td colspan=2>
                                            <div class="message-content msgcontent">
                                                <a href="view.html">
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
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
                                        <td class="message-left title"><a>����</a></td>
                                        <td class="message-right">N</td>
                                    </tr>
                                    <tr class="msg-name">
                                        <td class="message-left writer">�������</td>
                                        <td class="message-date date">2015.01.17</td>
                                    </tr>

                                    <tr>
                                        <td colspan=2>
                                            <div class="message-content msgcontent">
                                                <a href="view.html">
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
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
                                        <td class="message-left title"><a>����</a></td>
                                        <td class="message-right">N</td>
                                    </tr>
                                    <tr class="msg-name">
                                        <td class="message-left writer">�������</td>
                                        <td class="message-date date">2015.01.17</td>
                                    </tr>

                                    <tr>
                                        <td colspan=2>
                                            <div class="message-content msgcontent">
                                                <a href="view.html">
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
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
                                        <td class="message-left title"><a>����</a></td>
                                        <td class="message-right">N</td>
                                    </tr>
                                    <tr class="msg-name">
                                        <td class="message-left writer">�������</td>
                                        <td class="message-date date">2015.01.17</td>
                                    </tr>

                                    <tr>
                                        <td colspan=2>
                                            <div class="message-content msgcontent">
                                                <a href="view.html">
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
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
                                        <td class="message-left title"><a>����</a></td>
                                        <td class="message-right">N</td>
                                    </tr>
                                    <tr class="msg-name">
                                        <td class="message-left writer">�������</td>
                                        <td class="message-date date">2015.01.17</td>
                                    </tr>

                                    <tr>
                                        <td colspan=2>
                                            <div class="message-content msgcontent">
                                                <a href="view.html">
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
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
                                        <td class="message-left title"><a>����</a></td>
                                        <td class="message-right">N</td>
                                    </tr>
                                    <tr class="msg-name">
                                        <td class="message-left writer">�������</td>
                                        <td class="message-date date">2015.01.17</td>
                                    </tr>

                                    <tr>
                                        <td colspan=2>
                                            <div class="message-content msgcontent">
                                                <a href="view.html">
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
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
                                        <td class="message-left title"><a>����</a></td>
                                        <td class="message-right">N</td>
                                    </tr>
                                    <tr class="msg-name">
                                        <td class="message-left writer">�������</td>
                                        <td class="message-date date">2015.01.17</td>
                                    </tr>

                                    <tr>
                                        <td colspan=2>
                                            <div class="message-content msgcontent">
                                                <a href="view.html">
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
                                                    ���ٺ��������ٺ��������ٺ� ���ٺ��������ٺ��������ٺ�
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
                        <h3 class="hidden">������</h3>
                        <p class="pager-item"><img src="images/btn-prev.png" alt="����" /></p>
                        <ul class="pager-list">
                            <li class="pager-item"><a href="" class="text-highlight">1</a></li>
                            <li class="pager-item"><a href="">2</a></li>
                            <li class="pager-item"><a href="">3</a></li>
                            <li class="pager-item"><a href="">4</a></li>
                            <li class="pager-item"><a href="">5</a></li>
                        </ul>
                        <p class="pager-item"><img src="images/btn-next.png" alt="����" /></p>
                    </div>
                </div>

                <h3 class="hidden">��� �޴�</h3>
                <div id="request-option">
                    <ol>
                        <li class="request-item"><a href="send.html">���� ����</a></li>
                        <li class="request-item"><a href="list.html">����</a></li>
                    </ol>
                </div>







            </main>
        </div>
    </div>


    <!--------------------------------------------------�α��� �˾�----------------------->
    <!--<input type="button" onclick="clicktest();" value="���׽�Ʈ" />-->

    <div id="mask"></div>
    <div style="background:#ffffff; width: 300px; height: 400px; position: absolute; top:250px; left:500px; display: none; z-index:10001; border:1px;border-radius:5px;" id="test">
        <img id="btn-close" src="images/btn-close02.png"   onclick="btnexit();"  />

        <!--  <h1 id="main-title">< �α��� ></h1>-->

        <div>
            <!--<h2 class="hidden">�α��� ��</h2>-->
            
            <div>
				<span style="color:red;">${msg}</span>
			</div>
            <form action="loginProc.jsp" method="post">
                <div id="main-logo">
                    <img src="images/logo.png" />
                </div>
                <fieldset>
                    <!--<legend class="hidden">�α��� �ʵ�</legend>-->
                    <div class="main-item-text">
                        <label class="main-info-item" name=>ID</label>
                    </div>
                    
                    <input class="login-table-textbox" type="text" name="uid" onfocus="this.value=''"
                           onblur="if(this.value==''){this.type='text';}" value="���̵� 8~10�ڸ��� �Է� �� �ּ���." />
                    <br />


                    <div class="main-item-text">
                        <label class="main-info-item" for=" pwd">PW</label>
                    </div>
                    <input class="login-table-textbox" type="password" name="pwd" onfocus="this.value=''"
                           onblur="if(this.value==''){this.type='password';}" value="��й�ȣ 8~10�ڸ��� �Է� �� �ּ���." />
                    <br />

                    <input id="login-btn" type="submit" value="�α���" />

                </fieldset>
            </form>
        </div>
        <nav id="main-member">
            <!--<h1 class="hidden">ȸ�� ���� �� ����ã��</h1>-->
            <ul>
                <li class="main-member-item"><a class="main-member-item-text" href="info_search.html">ID/PW ã��</a></li>
                <li class="main-member-item"><a class="main-member-item-text" href="join.html">ȸ�� ����</a></li>
            </ul>
        </nav>









    </div>

    <!----<ǲ�� ����>----------------------------------------------------------->

    <footer id="footer">
        <div class="content-wrapper clearfix">
            <div id="logo-footer-container">
                <h2 id="logo-footer"><img src="images/logo-footer.png" alt="ȸ�� ����" /></h2>
            </div>
            <div id="company-info-container">
                <div id="company-info">
                    <h3 class="hidden">����������</h3>
                    <dl class="clearfix">
                        <dt class="company-info-item item-title item-newline">����</dt>
                        <dd class="company-info-item item-data">�����</dd>
                        <dt class="company-info-item item-title item-newline">�̸���</dt>
                        <dd class="company-info-item item-data">kyunghyun96@naver.com</dd>
                        <dt class="company-info-item item-title item-newline">��ȭ��ȣ</dt>
                        <dd class="company-info-item item-data">010-2231-5935</dd>
                    </dl>
                </div>

                <div id="copyright">
                    <h3 class="hidden">���۱�����</h3>
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

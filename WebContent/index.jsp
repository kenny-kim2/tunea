<%@page import="com.tunea.model.OrchInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.tunea.jdbcdao.JdbcMainDao"%>
<%@page import="com.tunea.dao.MainDao"%>
<%@page import="com.tunea.jdbcdao.JdbcConcertDao"%>
<%@page import="com.tunea.jdbcdao.JdbcGroupVideoDao"%>
<%@page import="com.tunea.jdbcdao.JdbcOrchBoardDao"%>
<%@page import="com.tunea.dao.OrchInfoDao"%>
<%@page import="com.tunea.jdbcdao.JdbcNoticeDao"%>
<%@page import="com.tunea.dao.NoticeDao"%>
<%@page import="com.tunea.dao.GroupVideoDao"%>
<%@page import="com.tunea.model.GroupVideo"%>
<%@page import="com.tunea.dao.ConcertDao"%>

<%@page import="com.tunea.model.Concert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%
	MainDao mdao = new JdbcMainDao();
	
	List<GroupVideo> vlist = mdao.getMainVideos();
	application.setAttribute("vlist", vlist);
	
	Concert con = mdao.getMainConcert();
	application.setAttribute("con", con);
	
	List<Concert> conList = mdao.getMainConcerts();
	application.setAttribute("conList", conList);
	
	OrchInfo minfo = mdao.getMainOrchInfo();
	application.setAttribute("minfo", minfo);
	
	
	//결정후 수정
	/* List<Notice> = */ 
	
 %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Tune-A</title>
    <link href="css/main-bind.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/modernizr.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
    <script type="text/javascript" src="js/etcMove.js"></script>
    <!--<script type="text/javascript" src="js/videoMove.js"></script>-->

    
    <!--<link rel='stylesheet' type='text/css' href='http://arshaw.com/css/main.css?6' />-->
    <link rel='stylesheet' type='text/css' href='http://arshaw.com/css/fullcalendar.css?3' />

    <link rel='stylesheet' type='text/css' href='http://arshaw.com/js/fullcalendar-1.6.3/fullcalendar/fullcalendar.css' />
    <script type='text/javascript' src='http://arshaw.com/js/fullcalendar-1.6.3/jquery/jquery-1.10.2.min.js'></script>
    <script type='text/javascript' src='http://arshaw.com/js/fullcalendar-1.6.3/jquery/jquery-ui-1.10.3.custom.min.js'></script>
    <script type='text/javascript' src='http://arshaw.com/js/fullcalendar-1.6.3/fullcalendar/fullcalendar.min.js'></script>
    <script type='text/javascript'>
        $(document).ready(function () {

            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();

            $('#calendar').fullCalendar({

                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                editable: true,
                events: [{
                    title: 'All Day Event',
                    start: new Date(y, m, 1),
                    url: 'http://www.naver.com'

                }, {
                    title: 'Long Event',
                    start: new Date(y, m, d - 5),
                    end: new Date(y, m, d - 2)
                }, {
                    id: 999,
                    title: 'Repeating Event',
                    start: new Date(y, m, d - 3, 16, 0),
                    allDay: false
                }, {
                    id: 999,
                    title: 'Repeating Event',
                    start: new Date(y, m, d + 4, 16, 0),
                    allDay: false
                }, {
                    title: 'Meeting',
                    start: new Date(y, m, d, 10, 30),
                    allDay: false
                }, {
                    title: 'Lunch',
                    start: new Date(y, m, d, 12, 0),
                    end: new Date(y, m, d, 14, 0),
                    allDay: false
                }, {
                    title: 'Birthday Party',
                    start: new Date(y, m, d + 1, 19, 0),
                    end: new Date(y, m, d + 1, 22, 30),
                    allDay: false
                }, {
                    title: 'Click for Google',
                    start: new Date(y, m, 28),
                    end: new Date(y, m, 29),
                    url: 'http://google.com/'
                }]
                ////
                ,
                eventColor: '#cbb48b',
                eventTextColor: '#553b20',
                eventBorderColor: '#8e6844'

                ////
            });

        });
    </script>
</head>
<body>

    <!----<헤더 영역>----------------------------------------------------------->

    <header id="header">
        <div class="content-wrapper">
            <h1 id="logo"><a href=""><img src="images/logo.png" alt="튠에이" /></a></h1>
            <section class="header-item-container">
                <h1 class="hidden">머리말</h1>
                <nav id="member-menu">
                    <h1 class="hidden">회원 메뉴</h1>
                    <ul class="clearfix">
                        <li class="member-menu-item"><a class="member-menu-item-text" href="member/join.jsp">Join</a></li>
                        <li class="member-menu-item"><a class="member-menu-item-text" href="member/login.jsp">Login</a></li>
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
                        <li class="main-menu-item"><a class="main-menu-item-text" href="orchestra/list.jsp">Orchestra</a></li>
                        <li class="main-menu-item"><a class="main-menu-item-text" href="concert/list.html">Concert</a></li>
                        <li class="main-menu-item"><a class="main-menu-item-text" href="video/group_list.jsp">Video</a></li>
                        <li id="community-btn" class="main-menu-item"><a class="main-menu-item-text" href="board/notice/list.jsp">Community</a></li>
                        <li class="main-menu-item"><a class="main-menu-item-text" href="">About us</a></li>
                        <li class="main-menu-item-market"><a class="main-menu-item-text" href="">Market</a></li>
                    </ul>
                </nav>
            </div>

        </div>
    </aside>
    <div>
        <div class="content-wrapper">
            <div class="menus">
                <h3 class="hidden">메인 목록</h3>
                <!--<ul class="clearfix">
            <li class="main-menu-item"><a class="main-menu-item-text" href="orchestra/list.jsp">Orchestra</a></li>
            <li class="main-menu-item"><a class="main-menu-item-text" href="concert/list.jsp">Concert</a></li>
            <li class="main-menu-item"><a class="main-menu-item-text" href="video/group_list.jsp">Video</a></li>
            <li id="community-btn" class="main-menu-item"><a class="main-menu-item-text" href="board/notice/list.jsp">Community</a></li>
            <li class="main-menu-item"><a class="main-menu-item-text" href="">About us</a></li>
            <li class="main-menu-item-market"><a class="main-menu-item-text" href="">Market</a></li>
        </ul>-->
            </div>
        </div>
    </div>

  <!----<바디 영역>----------------------------------------------------------->

    <div id="body">
        <div class="content-wrapper clearfix">
            <main id="main">
               
                <!-------------------------------비디오 부분------------------------------------------>
                <div class="video">
                    <div class="video-btn video-btn-1"></div>
                    <div class="video-btn video-btn-2"></div>
                    <div class="video-btn video-btn-3"></div>

                    <ul class="video-list">
                    	<c:forEach items="${vlist}" var="v" begin="0" end="3" >
                    		<li class="video-item">
                            <div style="background:url(images/video-image.png) no-repeat center;background-size: 100%;" onclick="location.href = 'video/group_view.jsp'">
                                <h2 class="hidden">Video</h2>
                                <div class="video-content">
                                    <h3 class="hidden">videotitle</h3>
                                    <p class="video-content-title"><a class="video-content-title-text" href="video/group_view.jsp"><nobr>${v.title}</nobr></a></p>
                                    <h3 class="hidden">videoinfo</h3>
                                    <p class="video-content-info"><a class="video-content-info-text" href="video/group_view.jsp">작성자: ${v.id}  조회수 : ${v.hit}   ${v.w_date}</a></p>
                                </div>
                            </div>
                        </li>                        
                        </c:forEach>
                    </ul>
                </div>
                <!----------------------------소속 오케스트라, 공연, 공연일정-------------------------------------->
                <div id="etc" class="clearfix">
                    <!--<h2>Etc</h2>-->
                    <div class="etc-table rmargin15">
                        <h3>소속 오케스트라&gt;</h3>
                        <div class="etc-list" style="background:url(images/orch-image.png) center no-repeat; background-size:100% 100%;" onclick="location.href = 'orchestra/page.jsp'">
                            <div class="etc-list-info">
                                <p class="etc-list-title">${minfo.name}</p>
                                <p class="etc-list-content">
                                ${minfo.content}
                                </p>

                            </div>
                        </div>
                    </div>
                    <div class="etc-table rmargin15">
                        <h3>공연&gt;</h3>
                        <div class="etc-list" style="background:url(images/performance-image.png) center no-repeat; background-size:100% 100%;" onclick="location.href = 'concert/view.jsp'">
                            <div class="etc-list-info">
                                <p class="etc-list-title">${con.title}</p>
                                <p class="etc-list-content">
                                ${con.content}
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="etc-table">
                        <h3>공연 일정&gt;</h3>
                        <div class="etc-list">
                            <div id='calendar' style='font-size: 10px'></div>
                        </div>
                    </div>
                </div>
                <!------------------인기글, 최신글----------------------->
                <div id="board" class="clearfix">
                    <h2 class="hidden">Board</h2>
                    <div class="board-table rmargin16">
                        <h3>인기글&gt;</h3>
                        <table class="board-container">
                            <thead>
                                <tr>
                                    <th class="board-title">제목</th>
                                    <th class="board-writer">작성자</th>
                                    <th class="board-regdate">작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="board-title"><a href="board/notice/view.jsp"><nobr>건의합니다.</nobr></a></td>
                                    <td class="board-writer"><nobr>김경현</nobr></td>
                                    <td class="board-regdate">2015.01.04</td>
                                </tr>
                                <tr>
                                    <td class="board-title"><a href="board/notice/view.jsp"><nobr>건의합니다.</nobr></a></td>
                                    <td class="board-writer"><nobr>김경현</nobr></td>
                                    <td class="board-regdate">2015.01.04</td>
                                </tr>
                                <tr>
                                    <td class="board-title"><a href="board/notice/view.jsp"><nobr>건의합니다.</nobr></a></td>
                                    <td class="board-writer"><nobr>김경현</nobr></td>
                                    <td class="board-regdate">2015.01.04</td>
                                </tr>
                                <tr>
                                    <td class="board-title"><a href="board/notice/view.jsp"><nobr>건의합니다.</nobr></a></td>
                                    <td class="board-writer"><nobr>김경현</nobr></td>
                                    <td class="board-regdate">2015.01.04</td>
                                </tr>
                                <tr>
                                    <td class="board-title"><a href="board/notice/view.jsp"><nobr>건의합니다.건의합니다.건의합니다.건의합니다.건의합니다.건의합니다.건의합니다.건의합니다.</nobr></a></td>
                                    <td class="board-writer"><nobr>김경현김경현김경현김경현김경현김경현김경현</nobr></td>
                                    <td class="board-regdate">2015.01.04</td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                    <div class="board-table">
                        <h3>최신글&gt;</h3>
                        <table class="board-container">
                            <thead>
                                <tr>
                                    <th class="board-title">제목</th>
                                    <th class="board-writer">작성자</th>
                                    <th class="board-regdate">작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="board-title"><a href="board/notice/view.jsp"><nobr>건의합니다.</nobr></a></td>
                                    <td class="board-writer"><nobr>김경현</nobr></td>
                                    <td class="board-regdate">2015.01.04</td>
                                </tr>
                                <tr>
                                    <td class="board-title"><a href="board/notice/view.jsp"><nobr>건의합니다.</nobr></a></td>
                                    <td class="board-writer"><nobr>김경현</nobr></td>
                                    <td class="board-regdate">2015.01.04</td>
                                </tr>
                                <tr>
                                    <td class="board-title"><a href="board/notice/view.jsp"><nobr>건의합니다.</nobr></a></td>
                                    <td class="board-writer"><nobr>김경현</nobr></td>
                                    <td class="board-regdate">2015.01.04</td>
                                </tr>
                                <tr>
                                    <td class="board-title"><a href="board/notice/view.jsp"><nobr>건의합니다.</nobr></a></td>
                                    <td class="board-writer"><nobr>김경현</nobr></td>
                                    <td class="board-regdate">2015.01.04</td>
                                </tr>
                                <tr>
                                    <td class="board-title"><a href="board/notice/view.jsp"><nobr>건의합니다.</nobr></a></td>
                                    <td class="board-writer"><nobr>김경현</nobr></td>
                                    <td class="board-regdate">2015.01.04</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!----<풋터 영역>----------------------------------------------------------->

        <footer id="footer">
        <div class="content-wrapper clearfix">
            <div id="logo-footer-container">
                <h2 id="logo-footer"><a href="../index.html"><img src="images/logo-footer.png" alt="회사 정보" /></a></h2>
            </div>
            <div id="company-info-container">
                <div id="company-info">
                    <h3 class="hidden">소유자정보</h3>
                    <dl class="clearfix">
                        <dt class="company-info-item item-title">팀장</dt>
                        <dd class="company-info-item item-data">김경현</dd>
                        <dt class="company-info-item item-title">이메일</dt>
                        <dd class="company-info-item item-data">kyunghyun96@naver.com</dd>
                        <dt class="company-info-item item-title">전화번호</dt>
                        <dd class="company-info-item item-data">010-2231-5935</dd>
                    </dl>
                </div>

                <div id="copyright">
                    <h3 class="hidden">저작권정보</h3>
                    <p>Copyright 2015. tune-A.com All Rights Reserved.</p>
                </div>
            </div>
        </div>
    </footer>

    <!----<퀵메뉴 영역>----------------------------------------------------------->

    <aside id="quick-menu">
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
    </aside>
</body>
</html>

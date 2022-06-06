<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="persistence.Control.NoticeControl" %>
<%@ page import="java.util.List" %>
<%@ page import="persistence.Entity.Notice" %>



<!DOCTYPE html>
<html>

<head>
    <title>소공 체육센터</title>
</head>
<body>
<%
    NoticeControl dao = new NoticeControl();
    List<Notice> list = dao.noticeList();
%>
<style>
    *{
        list-style: none;
        /* 밑줄나오지 않게 하는 것 */
        text-decoration: none;
        border-collapse: collapse;
        margin: 0;
        padding: 0;
        color: black;
    }
    .header{
        display: flex;
        width: 1280px;
        margin: auto;
        height:90px;
        border: 2px solid;
    }
    .logo{
        margin: 0 auto;
        font-size: 24px;
        width: 200px;
        line-height: 90px;
    }
    .logo h1{
        line-height: 90px;
        text-align: center;
    }
    .nav{
        display: flex;
        line-height: 90px;
        width: 1000px;
    }
    .nav li{
        margin-left: 80px;
    }
    .form{
        display: inline-flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        min-height: 100vh;
    }
    .box {
        border: 1px solid;
        width: 360px;
        height: 620px;
        margin: 50px auto;
        background-color: white;
        border-radius: 3px;
    }
    .box1 {
        border: 1px solid;
        width: 900px;
        height: 500px;
        margin: 50px auto;
        background-color: white;
        border-radius: 3px;
    }
    h1 {
        text-align: center;
        padding-top: 15px;
    }
    form {
        width: 300px;
        margin-left: 20px;
    }
    form label {
        display: flex;
        margin-top: 20px;
        font-size: 18px;
    }
    form input {
        width: 100%;
        padding: 7px;
        border: none;
        border: 1px solid gray;
        border-radius: 6px;
        outline: none;
    }
    input[type="button"] {
        width: 80px;
        height: 35px;
        margin-top: 20px;
        border: none;
        background-color: #49c1a2;
        color: white;
        font-size: 18px;
    }
</style>

<div class="wrap">
    <!-- 상단 배너? 클래스명 -->
    <div class="intro">
        <!-- 검색, 상단 배너의 container -->
        <div class="header">
            <div class="logo">
                <a href="/"> 소공 체육센터 </a>
            </div>
            <ul class="nav">
                <li> <a href="/Member/MemberScreen.jsp">회원관리</a>  </li>
                <li> <a href="/Instructor/InstructorScreen.jsp">강사관리</a> </li>
                <li> <a href="/Lesson/LessonScreen.jsp">강습관리</a> </li>
                <li> <a href="/Notice/NoticeScreen.jsp">공지관리</a> </li>
                <li> <a href="/Locker/InsertLockerScreen.jsp">사물함관리</a> </li>
                <li> <a href="/Sale/SalesManagement.jsp">매출관리</a> </li>
            </ul>
        </div>
    </div>
</div>

<div class="box1">
    <h1>공지사항</h1>
    <form>
        <table border = "1" style="width: 850px; height: 1cm;">
            <tr>
                <th width="10%"><strong>번호</strong></th>
                <th width="45%"><strong>제목</strong></th>
                <th width="45%"><strong>등록날짜</strong></th>
            </tr>
            <%
                for (int i = 0 ; i<list.size(); i++) {
            %>
            <tr>
                <td><%=list.get(i).getnoticeNo()%></td>
                <td><a href="/Notice/NoticeView.jsp?noticeNo=<%=list.get(i).getnoticeNo()%>"><%=list.get(i).getnoticeTitle()%></a></td>
                <td><%=list.get(i).getnoticeUpdateTime()%></td>
            </tr>
            <%
                }
            %>
            <tr>
                <td colspan="3" align="right">
                    <input type="button" value="글쓰기" onclick="location.href='/Notice/NoticeRegistrationScreen.jsp'">
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
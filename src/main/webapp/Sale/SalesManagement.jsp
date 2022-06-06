
<%@ page import="persistence.MyBatisConnectionFactory" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<style>
    table, th, td {
        border: 1px solid #bcbcbc;
    }
    table {
        margin: 0 auto;
        width: 1200px;
    }

    /*===============================================*/
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

    .inner-nav {
        margin-top: 30px;
        display: flex;
        line-height: 50px;
        width: 1000px;
    }

    .inner-nav li{
        padding: 10px;
        margin-left: 80px;
        border: 1px solid #AFAFAF;
        background-color: #FAFAFA;
    }

    .logo{
        margin: 0 auto;
        font-size: 24px;
        width: 200px;
        line-height: 90px;
    }

    .nav{
        display: flex;
        line-height: 90px;
        width: 1000px;

    }

    .nav li{
        margin-left: 80px;
    }



    .searchArea{
        margin-top: 40px;
        margin-left: 300px;
    }

    input[type=text]{
        width: 200px;
        height: 40px;
        vertical-align: top;
        padding-left: 10px;
    }
    #searchBtn{
        margin-left: -7px;
        height: 44px;
        width: 50px;
    }

    #registerBtn{
        margin-left: 550px;
        height: 44px;
        width: 80px;
    }
    /*===============================================*/

    .row{
        margin-top: 50px;
    }


    .container {
        width: 1000px;
        margin: 0 auto;
    }
</style>
<head>
    <title>소공 체육센터</title>
</head>
<body>

<div class="wrap">
    <div class="intro">
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

<div class="container">
    <ul class="inner-nav">
        <li> <a href="/Sale/PeriodSale.jsp">기간별 매출 조회</a></li>
        <li> <a href="/Sale/LessonSale.jsp">강습별 매출 조회</a> </li>
    </ul>
</div>



</body>
</html>
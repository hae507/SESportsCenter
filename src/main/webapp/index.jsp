<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <title>소공 체육센터</title>
</head>

<body>

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

</style>

<div class="wrap">
    <div class="intro">
        <div class="header">
            <div class="logo">
                <a href="/"> 소공 체육센터 </a>
            </div>
            <ul class="nav">
<%--                href에 각자 "/jsp파일"을 넣어주시면 됩니다--%>
                <li> <a href="/MemberScreen.jsp">회원관리</a>  </li>
                <li> <a href="">강사관리</a> </li>
                <li> <a href="">강습관리</a> </li>
                <li> <a href="">공지관리</a> </li>
                <li> <a href="">사물함관리</a> </li>
                <li> <a href="">매출관리</a> </li>
            </ul>
        </div>
    </div>
</div>

</body>
</html>
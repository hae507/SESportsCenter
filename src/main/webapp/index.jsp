<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
<head>
    <title>소공 체육센터</title>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    a {
        text-decoration: none;
        color: black;
    }
    a:visited {
        color: blue;
    }
    ul {
        list-style-type: none;
    }
    div,
    ul,
    li {
        border: 1px solid black;
    }
    .hd_fixed {
        max-width: 1170px;
        margin: 0 auto;
    }
    .hd_cotent {
        display: flex;
        height: 90px;
        align-items: stretch;
    }
    .hd_cotent .logo {
        flex-shrink: 0;
        flex-grow: 0;
    }
    .hd_cotent .logo h1 {
        line-height: 90px;
        text-align: center;
    }
    .hd_cotent .gnb_menu {
        height: 100%;
        margin: 0 auto;
        width: 900px;
    }
    .hd_cotent .gnb_menu ul {
        display: flex;
        height: 100%;
        justify-content: center;
        align-items: stretch;
    }
    .hd_cotent .gnb_menu ul li {
        flex: 0 0 13%;
        line-height: 80px;
        text-align: center;
    }
    .hd_cotent .gnb_menu ul li a {
        display: inline-block;
        height: 100%;
    }

</style>
<body>
<div class="hd_fixed">
    <div class="hd_cotent">
        <div class="logo">
            <h1>소공 체육센터</h1>
        </div>
        <div class="gnb_menu">
            <ul>
                <li class="dp1">
                    <a href="./Member.jsp">회원관리</a>
                </li>
                <li class="dp1">
                    <a href="#none">강사관리</a>
                </li>
                <li class="dp1">
                    <a href="#none">강습관리</a>
                </li>
                <li class="dp1">
                    <a href="#none">공지관리</a>
                </li>
                <li class="dp1">
                    <a href="#none">사물함 관리</a>
                </li>
                <li class="dp1">
                    <a href="#none">매출 관리</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>

</html>
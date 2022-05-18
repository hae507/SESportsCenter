<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head></head>

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

    /* .searchArea{
        width: 300px;
        height: 40px;
        background-color: rgb(0,0,0,0.5);
        border-radius: 5px;
        margin-top: 24px;
    }

    .searchArea form input{
        border: none;
        width: 250px;
        height: 40px;
        padding-left: 10px;
        background-color: white;
    }

    .searchArea form span{
        width: 50px;
        color: white;
        font-weight: bold;
        cursor: pointer;

    } */

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
                <hi>소공 체육센터</hi>
            </div>
            <!-- 지금 말고 나중에 검색기능에서 빼서 쓰면 될듯 -->
            <!-- <div class="searchArea">
                <form>
               <input type="search" placeholder="Search">
               <span>검색</span>
           </form>
           </div> -->
            <ul class="nav">
                <li> <a href="/Member.jsp">회원관리</a>  </li>
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
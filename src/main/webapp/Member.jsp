<%@ page import="persistence.DAO.MemberDAO" %>
<%@ page import="persistence.MyBatisConnectionFactory" %>
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
    /*===============================================*/
</style>
<head>
    <title>소공 체육센터</title>
</head>
<body>

<% MemberDAO memberDAO = new MemberDAO(MyBatisConnectionFactory.getSqlSessionFactory()); %>

<div class="wrap">
    <div class="intro">
        <div class="header">
            <div class="logo">
                <a href="/"> 소공 체육센터 </a>
            </div>
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

<div class=""container>
    <div class="row">
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center">No.</th>
                <th style="background-color: #eeeeee; text-align: center">ID</th>
                <th style="background-color: #eeeeee; text-align: center">이름</th>
                <th style="background-color: #eeeeee; text-align: center">비밀번호</th>
                <th style="background-color: #eeeeee; text-align: center">전화번호</th>
            </tr>
            </thead>
<%--            속도 엄청 오래걸림... 왜지?--%>
            <% for(int i=0; i< memberDAO.getMemberCount(); i++){ %>
            <%--            if문 10보다 작으면 빈칸으로? 10넘어가면 다름 페이지로? --%>
            <tbody>
            <td><%= i + 1 %></td>
            <td><%= memberDAO.inquiryMember().get(i).getId() %></td>
            <td><%= memberDAO.inquiryMember().get(i).getName() %></td>
            <td><%= memberDAO.inquiryMember().get(i).getPassword() %></td>
            <td><%= memberDAO.inquiryMember().get(i).getPhoneNum() %></td>
            </tbody>

            <% }%>


        </table>
    </div>

</div>


</body>
</html>
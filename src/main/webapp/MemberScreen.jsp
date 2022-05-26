<%@ page import="persistence.Control.MemberControl" %>
<%@ page import="persistence.MyBatisConnectionFactory" %>
<%@ page import="persistence.Entity.Member" %>
<%@ page import="java.util.List" %>
<%@ page import="persistence.Control.MemberControl" %>
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
</style>
<head>
    <title>소공 체육센터</title>
</head>
<body>

<% MemberControl memberControl = new MemberControl(MyBatisConnectionFactory.getSqlSessionFactory()); %>

<div class="wrap">
    <div class="intro">
        <div class="header">
            <div class="logo">
                <a href="/"> 소공 체육센터 </a>
            </div>
            <ul class="nav">
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

<div class="searchArea">
    <form method="post" action="InquiryMember.jsp">
<%--        <input type="hidden" name="boardId" value="${param.boardId}" />--%>

<%--        <input value="${param.searchKeyword}" type="text" name="searchKeyword" placeholder="이름 입력">--%>
        <input type="text" name="keyword" placeholder="이름 입력">
<%--        <button id="searchBtn" onclick="search()">검색</button>--%>
        <button id="searchBtn"> 검색 </button>
        <input id="registerBtn" type="button" value="회원등록" onclick="location.href='/RegisterMemberScreen.jsp'"/>
    </form>
</div>
    <% String keyword = request.getParameter("searchKeyword"); %>


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
            <% String k = request.getParameter("keyword");
                System.out.println("keyword : " + k);%>

            <% List<Member> list = memberControl.inquiryMember(); %>

            <% for(int i=0; i< list.size(); i++){ %>
            <%--            if문 10보다 작으면 빈칸으로? 10넘어가면 다름 페이지로? 이건 나중에 하기--%>
            <tbody>
            <td><%= i + 1 %></td>
            <td><%= list.get(i).getId() %></td>
            <td><%= list.get(i).getName() %></td>
            <td><%= list.get(i).getPassword() %></td>
            <td><%= list.get(i).getPhoneNum() %></td>
            </tbody>

            <% }%>


<%--        <script>--%>
<%--                function search(){--%>
<%--                    return(--%>
<%--                    <% List<MemberDTO> inquiryList = memberControl.inquiryMemberByName(keyword);%>--%>

<%--                    <%  for(int i=0; i< inquiryList.size(); i++){ %>--%>
<%--                    <tbody>--%>
<%--                    <td><%= i + 1 %></td>--%>
<%--                    <td><%= inquiryList.get(i).getId() %></td>--%>
<%--                    <td><%= inquiryList.get(i).getName() %></td>--%>
<%--                    <td><%= inquiryList.get(i).getPassword() %></td>--%>
<%--                    <td><%= inquiryList.get(i).getPhoneNum() %></td>--%>
<%--                    </tbody>--%>
<%--                    <% }%>--%>
<%--                    );--%>
<%--                }--%>
<%--            </script>--%>

        </table>
    </div>

</div>

</body>
</html>
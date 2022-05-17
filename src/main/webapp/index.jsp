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
</style>
<head>
    <title>소공 체육센터</title>
</head>
<body>
<h1>
    소공 체육센터
</h1>
<% MemberDAO test = new MemberDAO(MyBatisConnectionFactory.getSqlSessionFactory()); %>
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
            <tbody>
<%--            전체 개수 세서 게시판밑에 페이지수 만들기--%>
            <% for(int i=0; i< 10; i++){ %>
<%--            if문 써서 개수(현재10)보다 작으면 빈칸으로 두게 해야함--%>
            <td>1123</td>
            <td><%= test.getAllMember().get(i).getId() %></td>
            <td><%= test.getAllMember().get(i).getName() %></td>
            <td><%= test.getAllMember().get(i).getPassword() %></td>
            <td>
                <%= test.getAllMember().get(i).getPhoneNum() %>
            </td>
            <% }%>

            </tbody>
        </table>
        <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
    </div>

</div>


</body>
</html>
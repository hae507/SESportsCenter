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
<% MemberDAO memberDAO = new MemberDAO(MyBatisConnectionFactory.getSqlSessionFactory()); %>

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
        <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
    </div>

</div>


</body>
</html>
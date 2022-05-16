<%@ page import="persistence.DAO.MemberDAO" %>
<%@ page import="persistence.MyBatisConnectionFactory" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>소공 체육센터</title>
</head>
<body>
<h1>
    소공 체육센터
</h1>

<% MemberDAO test = new MemberDAO(MyBatisConnectionFactory.getSqlSessionFactory()); %>
<%= test.getAllMember() %>

</body>
</html>
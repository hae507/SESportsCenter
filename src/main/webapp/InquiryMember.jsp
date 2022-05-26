<%@ page import="persistence.Control.MemberControl" %>
<%@ page import="persistence.MyBatisConnectionFactory" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
</head>
<body>
<%
    MemberControl memberControl = new MemberControl(MyBatisConnectionFactory.getSqlSessionFactory());

    request.setCharacterEncoding("utf-8");

    String keyword = request.getParameter("keyword");
//    System.out.println(keyword);
        %>

        <script>
            alert("검색완료");
            location.href="/MemberScreen.jsp";
            history.back();
        </script>
        <%


%>

</body>
</html>
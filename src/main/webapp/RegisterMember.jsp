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

    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String password2 = request.getParameter("password2");
    String phoneNum = request.getParameter("phoneNum");

    if(!password.equals(password2)){
                %>
                <script>
                    alert("비밀번호가 다릅니다 다시 확인하여 주세요");
                    location.href="/RegisterMemberScreen.jsp";
                    history.back();
                </script>
                <%
    }

    boolean success = memberControl.registerMember(id, name, password, phoneNum);

    if(success){
        %>
            <script>
                alert("회원가입 성공");
                location.href="/MemberScreen.jsp";
            </script>
        <%
    }
    else{
        %>
            <script>
                alert("회원가입 실패. 중복된 아이디가 존재합니다.");
                location.href="/RegisterMemberScreen.jsp";
                history.back();
            </script>
        <%
    }
%>
</body>
</html>

<%@ page import="persistence.Control.InstructorControl" %>
<%@ page import="persistence.MyBatisConnectionFactory" %>
<%@ page import="persistence.Entity.Instructor" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
</head>
<body>
<%
    InstructorControl instructorControl = new InstructorControl(MyBatisConnectionFactory.getSqlSessionFactory());
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String pw2 = request.getParameter("pw2");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String ssn = request.getParameter("ssn");
    String address = request.getParameter("address");


    if(!pw.equals(pw2)) {
%>
<script>
    alert("비밀번호가 다릅니다 다시 확인하여 주세요");
    location.href="/Instructor/ShowCreateInstructorView.jsp";
    history.back();
</script>
<%
    }
    List<Instructor> list = instructorControl.readInstructor();
    {
        boolean success = true;
        for(int i=0; i< list.size(); i++) {
            if(id.equals(list.get(i).getInstructorId())){
                success = false;
            }
        }
        if(success == true){
            instructorControl.createInstructor(id,pw,name,phone,ssn,address);

%>
<script>
    alert("회원가입 성공");
    location.href="/Instructor/InstructorScreen.jsp";
</script>
<% }
else{
%>

<script>
    alert("회원가입 실패. 중복된 아이디가 존재합니다.");
    location.href="/Instructor/ShowCreateInstructorView.jsp";
    history.back();
</script>

<%
        }}
%>
</body>
</html>

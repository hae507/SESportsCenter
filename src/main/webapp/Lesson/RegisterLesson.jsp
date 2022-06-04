<%@ page import="persistence.Control.LessonControl" %>
<%@ page import="persistence.MyBatisConnectionFactory" %>
<%@ page import="persistence.Entity.Lesson" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
</head>
<body>
 <%
     LessonControl lessonControl = new LessonControl(MyBatisConnectionFactory.getSqlSessionFactory());
     request.setCharacterEncoding("utf-8");

     String LessonId = request.getParameter("LessonId");
     int instructorNum = Integer.parseInt(request.getParameter("instructorNum"));
     //String instructorNum = request.getParameter("instructorNum");
     String LessonName = request.getParameter("LessonName");
     String LessonTime = request.getParameter("LessonTime");
     String LessonDay = LessonTime.substring(0,1);
     LessonTime = LessonTime.substring(1);


     boolean checkDuplicate = lessonControl.checkDuplicateLesson(instructorNum, LessonDay, LessonTime);
     if (checkDuplicate) {
        %>
         <script>
             alert("동일 시간대 동일 강사가 강습등록은 불가능합니다.");
             location.href="/Lesson/RegisterLessonScreen.jsp";
             history.back();
         </script>
        <%
     }
     else {
         int LessonPrice = Integer.parseInt(request.getParameter("LessonPrice"));
         int LessonDCRate = Integer.parseInt(request.getParameter("LessonDCRate"));
         String SportsCenterName = request.getParameter("SportsCenterName");

         boolean success = lessonControl.registerLesson(LessonId, instructorNum, LessonName, LessonDay, LessonTime, LessonPrice, LessonDCRate, SportsCenterName);
         if(success){
            %>
             <script>
                 alert("강습등록 성공");
                 location.href="/Lesson/LessonScreen.jsp";
             </script>
             <%
         }
         else{
             %>
             <script>
                 alert("강습등록 실패");
                 location.href="/Lesson/RegisterLessonScreen.jsp";
                 history.back();
             </script>
            <%
         }
     }
 %>
</body>
</html>

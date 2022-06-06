<%@ page import="persistence.Entity.Notice" %>
<%@ page import="persistence.Control.NoticeControl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String noticeTitle = request.getParameter("noticeTitle");
    String noticeContents = request.getParameter("noticeContents");

    Notice dto = new Notice();
    dto.setNoticeTitle(noticeTitle);
    dto.setNoticeContents(noticeContents);

    NoticeControl dao = new NoticeControl();
    int res = dao.noticeRegistration(dto);
    if (res>0) {
%>
    <script type="text/javascript">
        alert("공지를 등록했습니다")
        location.href="/Notice/NoticeScreen.jsp"
    </script>
<%
    } else {
%>
    <script type="text/javascript">
        alert("공지등록을 실패했습니다")
        location.href="/Notice/NoticeRegistrationScreen.jsp"
    </script>
<%
    }
%>
</body>
</html>

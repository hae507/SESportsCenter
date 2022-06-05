<%@ page import="persistence.MyBatisConnectionFactory" %>
<%@ page import="persistence.Control.EnrollLockerControl" %>
<%@ page import="persistence.Entity.EnrollLocker" %>
<%@ page import="java.sql.Date" %>
<%@ page import="persistence.Control.LockerControl" %>
<%@ page import="persistence.Control.MemberControl" %>
<%@ page import="persistence.Entity.Member" %>
<%@ page import="persistence.Entity.Locker" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
<% LockerControl lockerControl = new LockerControl(MyBatisConnectionFactory.getSqlSessionFactory()); %>
<% MemberControl memberControl = new MemberControl(MyBatisConnectionFactory.getSqlSessionFactory()); %>
<% EnrollLockerControl enrollLockerControl = new EnrollLockerControl(MyBatisConnectionFactory.getSqlSessionFactory()); %>
<% EnrollLocker enrollLocker = new EnrollLocker(); %>

<%
    String id = request.getParameter("id");
    String lockerId = request.getParameter("lockerId");
    String temp = request.getParameter("rentalPeriod");
    Date rentalPeriod = Date.valueOf(temp);

    Member member = memberControl.findById(id);
    Locker locker = lockerControl.findByLockerId(lockerId);
    enrollLocker.setId(id);
    enrollLocker.setLockerId(lockerId);
    enrollLocker.setRentalPeriod(rentalPeriod);
    EnrollLocker findByDate = enrollLockerControl.findByDate(enrollLocker);
    EnrollLocker findByLocker = enrollLockerControl.findByLocker(enrollLocker);

    if(member == null){ %>
<script>
    alert("회원 아이디가 존재하지 않습니다.");
    location.href="/Locker/LockerRentalScreen.jsp";
</script>
<%  }
else if(locker == null){ %>
<script>
    alert("사물함 아이디가 존재하지 않습니다.");
    location.href="/Locker/LockerRentalScreen.jsp";
</script>
<%  }
else if(findByLocker != null){ %>
<script>
    alert("해당 날짜의 사물함 신청 불가합니다.");
    location.href="/Locker/LockerRentalScreen.jsp";
</script>
<%  }
else{
    if(findByDate != null){ %>
<script>
    alert("회원은 해당 날짜에 신청한 사물함이 존재합니다.");
    location.href="/Locker/LockerRentalScreen.jsp";
</script>

<%      } else {
    request.setCharacterEncoding("utf-8");

    enrollLocker.setId(request.getParameter("id"));
    enrollLocker.setLockerId(request.getParameter("lockerId"));
    enrollLocker.setRentalPeriod(Date.valueOf(request.getParameter("rentalPeriod")));
    enrollLockerControl.lockerRental(enrollLocker);
}
%>
<script>
    alert("사물함 신청 성공");
    location.href="/Locker/InsertLockerScreen.jsp";
</script>
<%  } %>


</body>
</html>
<%@ page import="persistence.MyBatisConnectionFactory" %>
<%@ page import="persistence.Control.LockerControl" %>
<%@ page import="persistence.Entity.Locker" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
</head>

<body>
<% LockerControl lockerDAO = new LockerControl(MyBatisConnectionFactory.getSqlSessionFactory()); %>
<% Locker locker = new Locker(); %>
<%
    request.setCharacterEncoding("utf-8");

    locker.setLockerId(request.getParameter("lockerId"));
    locker.setLockerLocation(request.getParameter("lockerLocation"));
    locker.setRentalAmount(Integer.parseInt(request.getParameter("rentalAmount")));
    locker.setCenterName(request.getParameter("centerName"));
    lockerDAO.insertLocker(locker);

    response.sendRedirect("/Locker/InsertLockerScreen.jsp");

%>
</body>
</html>

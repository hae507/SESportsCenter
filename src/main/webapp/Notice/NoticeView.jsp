<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="persistence.Control.NoticeControl" %>
<%@ page import="persistence.Entity.Notice" %>

<!DOCTYPE html>
<html>

<head>
  <title>소공 체육센터</title>
</head>
<body>
<%
  int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
  NoticeControl dao = new NoticeControl();
  Notice dto = dao.noticeView(noticeNo);
%>
<style>
  *{
    list-style: none;
    /* 밑줄나오지 않게 하는 것 */
    text-decoration: none;
    border-collapse: collapse;
    margin: 0;
    padding: 0;
    color: black;
  }
  .header{
    display: flex;
    width: 1280px;
    margin: auto;
    height:90px;
    border: 2px solid;
  }
  .logo{
    margin: 0 auto;
    font-size: 24px;
    width: 200px;
    line-height: 90px;
  }
  .logo h1{
    line-height: 90px;
    text-align: center;
  }
  .nav{
    display: flex;
    line-height: 90px;
    width: 1000px;
  }
  .nav li{
    margin-left: 80px;
  }
  .form{
    display: inline-flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    min-height: 100vh;
  }
  .box {
    border: 1px solid;
    width: 360px;
    height: 620px;
    margin: 50px auto;
    background-color: white;
    border-radius: 3px;
  }
  .box1 {
    border: 1px solid;
    width: 900px;
    height: 500px;
    margin: 50px auto;
    background-color: white;
    border-radius: 3px;
  }
  h1 {
    text-align: center;
    padding-top: 15px;
  }
  form {
    width: 300px;
    margin-left: 20px;
  }
  form label {
    display: flex;
    margin-top: 20px;
    font-size: 18px;
  }
  form input {
    width: 100%;
    padding: 7px;
    border: none;
    border: 1px solid gray;
    border-radius: 6px;
    outline: none;
  }
  input[type="button"] {
    width: 40px;
    height: 30px;
    margin-top: 20px;
    border: none;
    background-color: #939393;
    color: white;
    font-size: 14px;
    text-align: center;
  }
  input[type="text"] {
    width: 800px;
    height: 30px;
    vertical-align: top;
    padding-left: 10px;
  }
</style>

<div class="wrap">
  <!-- 상단 배너? 클래스명 -->
  <div class="intro">
    <!-- 검색, 상단 배너의 container -->
    <div class="header">
      <div class="logo">
        <a href="/"> 소공 체육센터 </a>
      </div>
      <ul class="nav">
        <li> <a href="/MemberScreen.jsp">회원관리</a>  </li>
        <li> <a href="">강사관리</a> </li>
        <li> <a href="">강습관리</a> </li>
        <li> <a href="/NoticeScreen.jsp">공지관리</a> </li>
        <li> <a href="">사물함관리</a> </li>
        <li> <a href="">매출관리</a> </li>

      </ul>
    </div>
  </div>
</div>

<div class="box1">
  <h1>공지사항</h1>
  <form>
    <table border = "1" width="850">
      <tr>
        <th>제목</th>
        <td><%=dto.getnoticeTitle()%></td>
      </tr>
      <tr>
        <th>내용</th>
        <td><textarea style="resize: none" rows="20" cols="110" readonly="readonly"><%=dto.getnoticeContents()%></textarea></td>
      </tr>
      <tr>
        <td colspan="2" align="right">
          <input type="button" value="목록" onclick="location.href='/Notice/NoticeScreen.jsp'">
        </td>
      </tr>
    </table>
  </form>
</div>

</body>
</html>
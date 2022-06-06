
<%@ page import="persistence.MyBatisConnectionFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="persistence.Control.LessonControl" %>
<%@ page import="persistence.Entity.Sale" %>
<%@ page import="persistence.Control.MemberControl" %>
<%@ page import="persistence.Control.SalesControl" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="javax.swing.text.DateFormatter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="persistence.Entity.Lesson" %>
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

    /*===============================================*/
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

    .inner-nav {
        margin-top: 30px;
        display: flex;
        line-height: 50px;
        width: 1000px;
    }

    .inner-nav li{
        padding: 10px;
        margin-left: 80px;
        border: 1px solid #AFAFAF;
        background-color: #FAFAFA;
    }

    .logo{
        margin: 0 auto;
        font-size: 24px;
        width: 200px;
        line-height: 90px;
    }

    .nav{
        display: flex;
        line-height: 90px;
        width: 1000px;

    }

    .nav li{
        margin-left: 80px;
    }



    .searchArea{
        margin-top: 40px;
        margin-left: 300px;
    }

    input[type=text]{
        width: 200px;
        height: 40px;
        vertical-align: top;
        padding-left: 10px;
    }
    #searchBtn{
        margin-left: -7px;
        height: 44px;
        width: 50px;
    }

    .searchBtn {
        margin-left: 20px;
    }

    #registerBtn{
        margin-left: 550px;
        height: 44px;
        width: 80px;
    }
    /*===============================================*/

    .row{
        margin-top: 50px;
    }


    .container {
        width: 1000px;
        margin: 30px auto;
    }

    .inputBox {
        width: 1000px;
        margin: 0 auto;
    }

    .inputBox form div {
        display: flex;
        margin-bottom: 5px;
    }

    label {
        width: 100px;
        text-align: center;
        margin-right: 5px;
    }

</style>
<head>
    <title>소공 체육센터</title>
</head>
<body>

<div class="wrap">
    <div class="intro">
        <div class="header">
            <div class="logo">
                <a href="/"> 소공 체육센터 </a>
            </div>
            <ul class="nav">
                <li> <a href="/Member/MemberScreen.jsp">회원관리</a>  </li>
                <li> <a href="/Instructor/InstructorScreen.jsp">강사관리</a> </li>
                <li> <a href="/Lesson/LessonScreen.jsp">강습관리</a> </li>
                <li> <a href="/Notice/NoticeScreen.jsp">공지관리</a> </li>
                <li> <a href="/Locker/InsertLockerScreen.jsp">사물함관리</a> </li>
                <li> <a href="/Sale/SalesManagement.jsp">매출관리</a> </li>
            </ul>
        </div>
    </div>
</div>

<div class="container">
    <ul class="inner-nav">
        <li> <a href="/Sale/PeriodSale.jsp">기간별 매출 조회</a></li>
        <li> <a href="/Sale/LessonSale.jsp">강습별 매출 조회</a> </li>
    </ul>
</div>

<div class="inputBox">
    <form method="post" action="/Sale/LessonSale.jsp">
        <select name="lessonName">
            <option value="">전체 선택</option>

<%
    LessonControl lessonControl = new LessonControl(MyBatisConnectionFactory.getSqlSessionFactory());

    List<Lesson> lessonList = lessonControl.inquiryLesson();
    if(lessonList.size() != 0) {
        for(int i=0; i<lessonList.size(); i++) {
%>

            <option value="<%=lessonList.get(i).getLessonName()%>"><%=lessonList.get(i).getLessonName()%></option>
            <%
        }
    }%>
        </select>
        <button class="searchBtn"> 조회하기 </button>
    </form>
</div>

<%
    SalesControl salesControl = new SalesControl();

    request.setCharacterEncoding("utf-8");
    String lessonName = request.getParameter("lessonName");

    List<Sale> saleList = salesControl.getSalesByLessonName(lessonName);


%>

<% if(lessonName != null && !lessonName.equals("")) {%>
<div class="container">
    <h1>검색 키워드 : <%=lessonName%></h1>
</div>
<%}%>

<div class=""container>
    <div class="row">
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center">No.</th>
                <th style="background-color: #eeeeee; text-align: center">강좌명</th>
                <th style="background-color: #eeeeee; text-align: center">체육센터</th>
                <th style="background-color: #eeeeee; text-align: center">날짜</th>
                <th style="background-color: #eeeeee; text-align: center">금액</th>
            </tr>
            </thead>


            <% int amount = 0;%>
            <% int i = 0;%>
            <% for(i=0; i< saleList.size(); i++){ %>
            <tbody>
            <td><%= i + 1%></td>
            <td><%= saleList.get(i).getPaymentItem()%></td>
            <td><%= saleList.get(i).getCenter()%></td>
            <td><%= saleList.get(i).getDate()%></td>
            <td><%= saleList.get(i).getAmount()%></td>
            <% amount += saleList.get(i).getAmount();%>
            </tbody>

            <%}%>

            <% if(i == 0) {%>
            <tbody>
            <td colspan="5">항목이 존재하지 않습니다.</td>
            </tbody>
            <%}%>

            <tfoot>
            <td colspan="4" style="background-color: #eeeeee; text-align: center">합계</td>
            <td>총 <%=amount%>원</td>
            </tfoot>


        </table>
    </div>

</div>


</body>
</html>

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
                <li> <a href="/MemberScreen.jsp">회원관리</a>  </li>
                <li> <a href="">강사관리</a> </li>
                <li> <a href="">강습관리</a> </li>
                <li> <a href="">공지관리</a> </li>
                <li> <a href="">사물함관리</a> </li>
                <li> <a href="">매출관리</a> </li>
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
    <form method="post" action="/Sale/PeriodSale.jsp">
        <div>
            <label>from : </label>
            <input type="date" name="from" placeholder="from">
        </div>
        <div>
            <label>&nbsp;to&nbsp;: </label>
            <input type="date" name="to" placeholder="to">
            <button class="searchBtn"> 조회하기 </button>
        </div>
    </form>
</div>

<div class=""container>
    <div class="row">
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center">No.</th>
                <th style="background-color: #eeeeee; text-align: center">항목</th>
                <th style="background-color: #eeeeee; text-align: center">체육센터</th>
                <th style="background-color: #eeeeee; text-align: center">날짜</th>
                <th style="background-color: #eeeeee; text-align: center">금액</th>
            </tr>
            </thead>

            <%
                SalesControl salesControl = new SalesControl();

                request.setCharacterEncoding("utf-8");
                String from = request.getParameter("from");
                String to = request.getParameter("to");

                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-mm-dd");

                List<Sale> saleList = new ArrayList<>();
                LocalDate fromDate;
                LocalDate toDate;


            %>


            <%if(from != null && to != null) {

                if(!from.equals("") && !to.equals("")) {
                    String[] fromArray = from.split("-");
                    fromDate = LocalDate.of(
                            Integer.parseInt(fromArray[0]),
                            Integer.parseInt(fromArray[1]),
                            Integer.parseInt(fromArray[2])
                    );
                    String[] toArray = to.split("-");
                    toDate = LocalDate.of(
                            Integer.parseInt(toArray[0]),
                            Integer.parseInt(toArray[1]),
                            Integer.parseInt(toArray[2])
                    );

                    saleList = salesControl.getSalesByPeriod(fromDate, toDate);
                }
            }%>

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

            <% if(i == 0) { %>
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
<%@ page import="persistence.Control.MemberControl" %>
<%@ page import="persistence.MyBatisConnectionFactory" %>
<%@ page import="persistence.Entity.Member" %>
<%@ page import="java.util.List" %>
<%@ page import="persistence.Control.MemberControl" %>
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

    #registerBtn{
        margin-left: 550px;
        height: 44px;
        width: 80px;
    }
    /*===============================================*/

    .row{
        margin-top: 50px;
    }
</style>
<head>
    <title>소공 체육센터</title>
</head>
<body>

<% MemberControl memberControl = new MemberControl(MyBatisConnectionFactory.getSqlSessionFactory()); %>

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

<div class="searchArea">
    <form method="post" action="/Member/MemberScreen.jsp">
        <select name="type">
        <option value="이름">이름</option>
        <option value="ID">ID</option>
        <option value="비밀번호">비밀번호</option>
        <option value="전화번호 뒷자리">전화번호 뒷자리</option>
<%--            무조건 010-1111-1111 형식으로 넣어달라고 적기?--%>
        </select>
        <input type="text" name="keyword" placeholder="검색어 입력">
<%--        <button id="searchBtn" onclick="search()">검색</button>--%>
        <button id="searchBtn"> 검색 </button>
        <input id="registerBtn" type="button" value="회원등록" onclick="location.href='/Member/RegisterMemberScreen.jsp'"/>
    </form>
</div>
<%--    <% String keyword = request.getParameter("searchKeyword"); %>--%>

<div class=""container>
    <div class="row">
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center">No.</th>
                <th style="background-color: #eeeeee; text-align: center">ID</th>
                <th style="background-color: #eeeeee; text-align: center">이름</th>
                <th style="background-color: #eeeeee; text-align: center">비밀번호</th>
                <th style="background-color: #eeeeee; text-align: center">전화번호</th>
            </tr>
            </thead>
            <% request.setCharacterEncoding("utf-8");
                String keyword = request.getParameter("keyword");
                System.out.println("위 keyword : " + keyword);%>

            <% if(keyword == null){

            List<Member> list = memberControl.inquiryMember(); %>

            <% for(int i=0; i< list.size(); i++){ %>
            <%--            if문 10보다 작으면 빈칸으로? 10넘어가면 다름 페이지로? 이건 나중에 하기--%>
            <tbody>
            <td><%= i + 1 %></td>
            <td><%= list.get(i).getId() %></td>
            <td><%= list.get(i).getName() %></td>
            <td><%= list.get(i).getPassword() %></td>
            <td><%= list.get(i).getPhoneNum() %></td>
            </tbody>

            <%
                }
            } else {
                String type = request.getParameter("type");
                    System.out.println("type : " + type);
                    List<Member> list = null;
                    if(type.equals("이름")) {
                        list = memberControl.inquiryMemberByName(keyword);
                    } else if(type.equals("ID")){
                        list = memberControl.inquiryMemberById(keyword);
                    } else if(type.equals("비밀번호")){
                        list = memberControl.inquiryMemberByPw(keyword);
                    } else if(type.equals("전화번호 뒷자리")){
                        list = memberControl.inquiryMemberByPhoneNum(keyword);
                    }
//                    System.out.println("keyword : " + keyword);
            %>
            <% for(int i=0; i< list.size(); i++){ %>
            <%--            if문 10보다 작으면 빈칸으로? 10넘어가면 다름 페이지로? 이건 나중에 하기--%>
            <tbody>
            <td><%= i + 1 %></td>
            <td><%= list.get(i).getId() %></td>
            <td><%= list.get(i).getName() %></td>
            <td><%= list.get(i).getPassword() %></td>
            <td><%= list.get(i).getPhoneNum() %></td>
            </tbody>
            <%
                }
            }
            %>


        </table>
    </div>

</div>

</body>
</html>
    <%@ page import="persistence.Control.InstructorControl" %>
    <%@ page import="persistence.MyBatisConnectionFactory" %>
    <%@ page import="persistence.Entity.Instructor" %>
    <%@ page import="java.util.List" %>
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
            margin-left: 1250px;
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
            margin-left: 5px;
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

    <% InstructorControl instructorControl = new InstructorControl(MyBatisConnectionFactory.getSqlSessionFactory()); %>

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
        <form method="post" action="/Instructor/InstructorScreen.jsp">
            <%--        <input type="hidden" name="boardId" value="${param.boardId}" />--%>

            <%--        <input value="${param.searchKeyword}" type="text" name="searchKeyword" placeholder="이름 입력">--%>
            <input type="text" name="keyword" placeholder="이름 입력">
<%--                    <button id="searchBtn" onclick="search()">검색</button>--%>
            <button  id="searchBtn"> 검색 </button>
            <input id="registerBtn" type="button" value="강사등록" onclick="location.href='ShowCreateInstructorView.jsp'"/>
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
                    <th style="background-color: #eeeeee; text-align: center">비밀번호</th>
                    <th style="background-color: #eeeeee; text-align: center">이름</th>
                    <th style="background-color: #eeeeee; text-align: center">전화번호</th>
                    <th style="background-color: #eeeeee; text-align: center">주민번호</th>
                    <th style="background-color: #eeeeee; text-align: center">주소</th>
                </tr>
                </thead>

                <% request.setCharacterEncoding("utf-8");
                    String keyword = request.getParameter("keyword");
                    System.out.println("위 keyword : " + keyword);%>

                <% if(keyword == null){
                    List<Instructor> list = instructorControl.readInstructor(); %>
                <% for(int i=0; i< list.size(); i++){ %>

                <tbody>
                <td><%= i + 1 %></td>
                <td><%= list.get(i).getInstructorId() %></td>
                <td><%= list.get(i).getInstructorPw() %></td>
                <td><%= list.get(i).getInstructorName() %></td>
                <td><%= list.get(i).getInstructorPhone() %></td>
                <td><%= list.get(i).getInstructorSsn() %></td>
                <td><%= list.get(i).getInstructorAdd() %></td>
                </tbody>

                <%
                    }
                } else {
                    List<Instructor> list = instructorControl.readInstructorByName(keyword);
                    System.out.println("keyword : " + keyword);
                %>
                <% for(int i=0; i< list.size(); i++){ %>

                <tbody>
                <td><%= i + 1 %></td>
                <td><%= list.get(i).getInstructorId() %></td>
                <td><%= list.get(i).getInstructorPw() %></td>
                <td><%= list.get(i).getInstructorName() %></td>
                <td><%= list.get(i).getInstructorPhone() %></td>
                <td><%= list.get(i).getInstructorSsn() %></td>
                <td><%= list.get(i).getInstructorAdd() %></td>
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
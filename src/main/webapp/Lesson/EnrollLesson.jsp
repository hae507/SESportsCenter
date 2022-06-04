<%@ page import="persistence.Control.LessonControl" %>
<%@ page import="persistence.MyBatisConnectionFactory" %>
<%@ page import="persistence.Entity.Lesson" %>
<%@ page import="java.util.List" %>
<%@ page import="persistence.Control.LessonControl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <title>소공 체육센터</title>
    <script type="text/javascript">
        $(function(){
           $('.enrollLesson').on('click',function(event){
              var params = {};
              params.LessonId = $(this).data('lessonid');
              params.instructorNum = $(this).data('instructornum');
              params.LessonDay = $(this).data('lessonday');
              params.LessonTime = $(this).data('lessontime');
              params.Id = $(this).data('id');

              $.ajax({
                 url:'/EnrollLesson',
                 type:'post',
                 data: params,
                 success:function(data) {
                     if(data == "success\r\n") {
                         alert('수강신청이 되었습니다');
                     }
                     else {
                         alert('이미 동일 시간대에 다른 강의가 수강신청 되어있습니다');
                     }
                 }
              });

           });
        });
    </script>
</head>
<body>
<% LessonControl lessonControl = new LessonControl(MyBatisConnectionFactory.getSqlSessionFactory()); %>
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
                <li> <a href="">공지관리</a> </li>
                <li> <a href="/Locker/InsertLockerScreen.jsp">사물함관리</a> </li>
                <li> <a href="">매출관리</a> </li>
            </ul>
        </div>
    </div>
</div>
<%--수강신청은 Member에 넣어야하나? --%>
<div class="searchArea">
    <form method="post" action="jsp">
        <input type="text" name="keyword" placeholder="이름 입력">
        <%--        <button id="searchBtn" onclick="search()">검색</button>--%>
        <button id="searchBtn"> 검색 </button>
    </form>
</div>

<div class=""container>
    <div class="row">
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center">No.</th>
                <th style="background-color: #eeeeee; text-align: center">강습ID</th>
                <th style="background-color: #eeeeee; text-align: center">강사ID</th>
                <th style="background-color: #eeeeee; text-align: center">강습 이름</th>
                <th style="background-color: #eeeeee; text-align: center">강습 시간</th>
                <th style="background-color: #eeeeee; text-align: center">강습 가격</th>
                <th style="background-color: #eeeeee; text-align: center">강습 할인율</th>
                <th style="background-color: #eeeeee; text-align: center">체육센터명</th>
                <th style="background-color: #eeeeee; text-align: center"> 수강신청 </th>
            </tr>
            </thead>
            <% request.setCharacterEncoding("utf-8");
                String keyword = request.getParameter("keyword");
                System.out.println("위 keyword : " + keyword);%>

            <% if(keyword == null){

                List<Lesson> list = lessonControl.inquiryLesson(); %>


            <% for(int i=0; i< list.size(); i++){ %>
            <%--            if문 10보다 작으면 빈칸으로? 10넘어가면 다름 페이지로? 이건 나중에 하기--%>
            <tbody>
            <td><%= i + 1 %></td>
            <td><%= list.get(i).getLessonId() %></td>
            <td><%= list.get(i).getInstructorNum()%></td>
            <td><%= list.get(i).getLessonName()%></td>
            <td><%= list.get(i).getLessonDay() + list.get(i).getLessonTime()%></td>
            <td><%= list.get(i).getLessonPrice()%></td>
            <td><%= list.get(i).getLessonDCRate()%></td>
            <td><%= list.get(i).getSportsCenterName()%></td>
            <td><button class="enrollLesson" data-lessonId=<%=list.get(i).getLessonId()%>
                    data-instructorNum=<%= list.get(i).getInstructorNum() %>
                        data-lessonDay=<%= list.get(i).getLessonDay()%>
                                data-lessonTime=<%= list.get(i).getLessonTime()%>
                        data-id="1">수강신청</button>
            </tbody>

            <%
                }
            } else {
                List<Lesson> lessonList = lessonControl.inquiryLessonByName(keyword);
                System.out.println("keyword : " + keyword);
            %>
            <% for(int i=0; i< lessonList.size(); i++){ %>
            <%--            if문 10보다 작으면 빈칸으로? 10넘어가면 다름 페이지로? 이건 나중에 하기--%>
            <tbody>
            <td><%= i + 1 %></td>
            <td><%= lessonList.get(i).getLessonId() %></td>
            <td><%= lessonList.get(i).getInstructorNum() %></td>
            <td><%= lessonList.get(i).getLessonName() %></td>
            <td><%= lessonList.get(i).getLessonDay() + lessonList.get(i).getLessonTime()%></td>
            <td><%= lessonList.get(i).getLessonPrice() %></td>
            <td><%= lessonList.get(i).getLessonDCRate() %></td>
            <td><%= lessonList.get(i).getSportsCenterName() %></td>
            <td><button class="enrollLesson" data-lessonId=<%=lessonList.get(i).getLessonId()%>
            data-instructorNum=<%= lessonList.get(i).getInstructorNum() %>
            data-lessonDay=<%= lessonList.get(i).getLessonDay()%>
            data-lessonTime=<%= lessonList.get(i).getLessonTime()%>
            data-id="1">수강신청</button>
            </td>
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
package com.example.demo;

import persistence.Control.LessonControl;
import persistence.Entity.EnrollLesson;
import persistence.MyBatisConnectionFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EnrollLesson", value = "/EnrollLesson")
public class EnrollLessonServlet extends HttpServlet {
    LessonControl lessonControl = new LessonControl(MyBatisConnectionFactory.getSqlSessionFactory());

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");

        // Hello
        PrintWriter out = resp.getWriter();

        String LessonId = req.getParameter("LessonId");
        String instructorNum = req.getParameter("instructorNum");
        String LessonDay = req.getParameter("LessonDay");
        String LessonTime = req.getParameter("LessonTime");
        String Id = req.getParameter("Id");

        EnrollLesson enrollLesson = new EnrollLesson();
        enrollLesson.setLessonId(LessonId);
        enrollLesson.setInstructorNum(instructorNum);
        enrollLesson.setLessonDay(LessonDay);
        enrollLesson.setLessonTime(LessonTime);
        enrollLesson.setId(Id);

        boolean check = lessonControl.checkDuplicateEnrollLesson(enrollLesson);

        if (check) {
            out.println("fail");
        }
        else {
            lessonControl.enrollLesson(enrollLesson);
            out.println("success");
        }

        out.flush();
        out.close();
    }
}

//import persistence.MyBatisConnectionFactory;
//import persistence.dao.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import persistence.Control.*;
import persistence.Entity.*;
import persistence.MyBatisConnectionFactory;
import persistence.mapper.LessonMapper;

import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
//import service.*;


/**
 * 이 클래스는 함수확인용
 */

public class ForTest {

    public static void main(String args[]){

//        MemberDTO memberDTO;
        MemberControl memberControl = new MemberControl(MyBatisConnectionFactory.getSqlSessionFactory());
        EnrollLockerControl enrollLockerControl = new EnrollLockerControl(MyBatisConnectionFactory.getSqlSessionFactory());
        LessonControl lessonControl = new LessonControl(MyBatisConnectionFactory.getSqlSessionFactory());

        EnrollLesson enrollLesson = new EnrollLesson();
        enrollLesson.setLessonId("1");
        enrollLesson.setLessonDay("월");
        enrollLesson.setLessonTime("34");
        enrollLesson.setInstructorNum("2");
        enrollLesson.setId("1");

        lessonControl.enrollLesson(enrollLesson);


//
//        InstructorControl instructorControl = new InstructorControl(MyBatisConnectionFactory.getSqlSessionFactory());
//
//        instructorControl.readInstructorByName("김");
//        SalesControl salesControl = new SalesControl();
//
//        List<Sale> saleList = salesControl.getSalesByPeriod(LocalDate.of(2022, 06, 04),LocalDate.of(2022, 06, 06));

//        System.out.println(saleList.get(0).getAmount());

//        SqlSessionFactory sqlSessionFactory = null;
//        SqlSession session = sqlSessionFactory.openSession();
//        LessonMapper mapper = session.getMapper(LessonMapper.class);
//        System.out.println(mapper.getEnrollLessonNum());

    }

}
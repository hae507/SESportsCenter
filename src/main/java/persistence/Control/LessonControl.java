package persistence.Control;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import persistence.Entity.EnrollLesson;
import persistence.Entity.Lesson;
import persistence.Entity.Sale;
import persistence.mapper.LessonMapper;
import persistence.mapper.SalesMapper;

import javax.swing.*;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
public class LessonControl {

    private SqlSessionFactory sqlSessionFactory = null;

    public LessonControl(SqlSessionFactory sqlSessionFactory) { this.sqlSessionFactory = sqlSessionFactory;
    }
    public List<Lesson> inquiryLesson() {
        SqlSession session = sqlSessionFactory.openSession();
        LessonMapper mapper = session.getMapper(LessonMapper.class);
        List<Lesson> all = mapper.getAllLesson();
         return all;
    }


    public List<Lesson> inquiryLessonByName(String LessonName){
        SqlSession session = sqlSessionFactory.openSession();
        LessonMapper mapper = session.getMapper(LessonMapper.class);
        List<Lesson> list = mapper.getLessonByName(LessonName);
        return list;
    }

    //강습등록-강사ID가져온다.
    public String getInstructorNum(int instructorNum) {
        SqlSession session = sqlSessionFactory.openSession();
        LessonMapper mapper = session.getMapper(LessonMapper.class);
        String getInstructorNum = mapper.getInstructorNum(instructorNum);
        return getInstructorNum;
    }


    //동일 시간대 같은 강사 강습등록 체크
    public boolean checkDuplicateLesson(int instructorNum, String LessonDay, String LessonTime) {
        boolean result = false;
        SqlSession session = sqlSessionFactory.openSession();
        Lesson lesson = new Lesson();
        lesson.setInstructorNum(instructorNum);
        lesson.setLessonTime(LessonTime);
        lesson.setLessonDay(LessonDay);
        LessonMapper mapper = session.getMapper(LessonMapper.class);

        try {
            int check = mapper.checkDuplicateLesson(lesson);
            if (check > 0) result = true;
        }
        catch (Exception ex) {
            ex.getStackTrace();
            System.out.println(ex.getMessage());
        }

        return result;
    }


    //강습등록 -
    public boolean registerLesson(String LessonId, int instructorNum,String LessonName,String LessonDay, String LessonTime,int LessonPrice,int LessonDCRate,String SportsCenterName) {

        boolean result = false;
        Lesson lesson = new Lesson(LessonId, instructorNum, LessonName, LessonDay, LessonTime, LessonPrice, LessonDCRate, SportsCenterName);
        SqlSession session = sqlSessionFactory.openSession();
        LessonMapper mapper = session.getMapper(LessonMapper.class);
        //int getInstructorNum = Integer.parseInt(mapper.getInstructorNum());

        try {
            mapper.insertLesson(lesson);
            session.commit();
            result = true;
        } catch (Exception e) {
            e.getStackTrace();
            System.out.println(e.getMessage());
            session.rollback();
        }finally {
            session.close();
        }

        return result;
    }

    public boolean checkDuplicateEnrollLesson(EnrollLesson enrollLesson) {
        boolean result = false;

        SqlSession session = sqlSessionFactory.openSession();
        LessonMapper mapper = session.getMapper(LessonMapper.class);

        try {
            int check = mapper.checkDuplicateEnrollLesson(enrollLesson);
            if (check > 0) result = true;
        }
        catch (Exception ex) {
            ex.getStackTrace();
            System.out.println(ex.getMessage());
        }

        return result;
    }

    public void enrollLesson(EnrollLesson enrollLesson) {
        Date now = new Date();
        enrollLesson.setPaymentDate(now);
        SqlSession session = sqlSessionFactory.openSession();
        LessonMapper mapper = session.getMapper(LessonMapper.class);
        SalesMapper salesMapper = session.getMapper(SalesMapper.class);
        Lesson lesson = mapper.getOne(enrollLesson.getLessonId());
        Sale sale = new Sale(lesson.getLessonPrice(), LocalDate.now(), lesson.getSportsCenterName());

        try {
            mapper.enrollLesson(enrollLesson);
            sale.setEnrollLessonNum(Integer.parseInt(mapper.getEnrollLessonNum()));
            salesMapper.insert(sale);
            session.commit();
        }
        finally {
            session.close();
        }
//        catch (Exception ex) {
//            ex.getStackTrace();
//            System.out.println(ex.getMessage());
//            session.rollback();
//        }
    }
}

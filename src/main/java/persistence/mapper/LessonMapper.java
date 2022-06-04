package persistence.mapper;

import org.apache.ibatis.annotations.*;
import persistence.Entity.EnrollLesson;
import persistence.Entity.Lesson;
import persistence.Entity.Locker;

import java.util.List;

public interface LessonMapper {
    final String getAllLesson = "SELECT * from lesson;";
    @Select(getAllLesson)
    @Results(id = "resultSet", value = {
            @Result(property = "LessonId;", column = "LessonId;"),
            @Result(property = "instructorNum", column = "instructorNum"),
            @Result(property = "LessonName", column = "LessonName"),
            @Result(property = "LessonDay", column = "LessonDay"),
            @Result(property = "LessonTime", column = "LessonTime"),
            @Result(property = "LessonPrice", column = "LessonPrice"),
            @Result(property = "LessonDCRate", column = "LessonDCRate"),
            @Result(property = "SportsCenterName", column = "SportsCenterName"),
            @Result(property = "EnrollLessonNum", column = "EnrollLessonNum")
    })
    List<Lesson> getAllLesson();

    //강습 명으로 검색
    final String SELECT_BY_NAME = "SELECT * FROM lesson WHERE LessonName like  CONCAT('%',#{LessonName},'%')";
    @Select(SELECT_BY_NAME)
    @ResultMap("resultSet")
    List<Lesson> getLessonByName(String LessonName);

    //강사ID를 가져온다.
    final String SELECT_INSRUCTORNUM = "SELECT lesson.instructorNum from lesson join instructor on instructor.instructorNum = lesson.instructorNum where instructorId = #{instructorId}";
    @Select(SELECT_INSRUCTORNUM)
    @ResultMap("resultSet")
    String getInstructorNum(int instructorNum);

    //강습 등록 -
    final String INSERT = "insert into lesson (LessonId, instructorNum, LessonName, LessonDay, LessonTime, LessonPrice, LessonDCRate, SportsCenterName) values(#{LessonId}, #{instructorNum}, #{LessonName}, #{LessonDay} ,#{LessonTime}, #{LessonPrice}, #{LessonDCRate}, #{SportsCenterName})";
    @Insert(INSERT)
    //@ResultMap("resultSet")
    public void insertLesson(Lesson lesson);

    final String SELECT_DUPLICATION_LESSON = "select count(*) from lesson where instructorNum = #{instructorNum} and LessonDay = #{LessonDay} and LessonTime like concat('%',#{LessonTime},'%')";
    @Select(SELECT_DUPLICATION_LESSON)
    public int checkDuplicateLesson(Lesson lesson);


    final String SELECT_DUPLICATION_ENROLL_LESSON = "select count(*) from enrolllesson where id = #{id} and LessonDay = #{LessonDay} and LessonTime like concat('%',#{LessonTime},'%')";
    @Select(SELECT_DUPLICATION_ENROLL_LESSON)
    public int checkDuplicateEnrollLesson(EnrollLesson enrollLesson);


    final String INSERT_ENROLL_LESSON = "insert into enrolllesson (id, Lessonid, instructorNum, LessonDay, LessonTime, paymentDate) values(#{id}, #{LessonId}, #{instructorNum}, #{LessonDay} ,#{LessonTime}, #{paymentDate})";
    @Insert(INSERT_ENROLL_LESSON)
    public void enrollLesson(EnrollLesson enrollLesson);

    final String getOne = "SELECT * from lesson where LessonId = #{LessonId}";
    @Select(getOne)
    Lesson getOne(String lessonId);

    final String getEnrollLessonNum = "SELECT EnrollLessonNum from enrolllesson ORDER BY EnrollLessonNum DESC LIMIT 1 ";
    @Select(getEnrollLessonNum)
    String getEnrollLessonNum();
}



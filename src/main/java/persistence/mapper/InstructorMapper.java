package persistence.mapper;

import org.apache.ibatis.annotations.*;
import persistence.Entity.Instructor;

import java.util.List;


public interface InstructorMapper {
    final String getAll = "SELECT * from Instructor";
    @Select(getAll)
    @Results(id = "result", value = {
            @Result(property = "instructorId",column = "instructorId"),
            @Result(property = "instructorPw" ,column = "instructorPw"),
            @Result(property = "instructorName",column = "instructorName"),
            @Result(property = "instructorPhone",column = "instructorPhone"),
            @Result(property = "instructorSsn",column = "instructorSsn"),
            @Result(property = "instructorAdd",column = "instructorAdd")
    })
    List<Instructor> getAllInstructor();


    final String SELECT_BY_SSN = "SELECT * from Instructor WHERE instructorSsn like  CONCAT('%',#{instructorSsn},'%')";
    @Select(SELECT_BY_SSN)
    @ResultMap("result")
    List<Instructor> getInstructorBySsn(String ssn);

    final String SELECT_BY_NAME = "select * from Instructor WHERE instructorName like  CONCAT('%',#{instructorName},'%')";
    @Select(SELECT_BY_NAME)
    @ResultMap("result")
    List<Instructor> getInstructorByName(String name);





    final String INSERT = "INSERT into Instructor (instructorId,instructorPw,instructorName,instructorPhone,instructorSsn,instructorAdd)" +
            "values(#{instructorId},#{instructorPw},#{instructorName},#{instructorPhone},#{instructorSsn},#{instructorAdd})";
    @Insert(INSERT)
    @ResultMap("ResultSet")
    public void insertInstructor(Instructor instructorDTO);


}

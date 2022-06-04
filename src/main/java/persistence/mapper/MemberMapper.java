package persistence.mapper;

import org.apache.ibatis.annotations.*;
import persistence.Entity.Member;

import java.util.List;

public interface MemberMapper {
    final String getAll = "SELECT * from Member;";
    @Select(getAll)
    @Results(id = "resultSet", value = {
            @Result(property = "id", column = "id"),
            @Result(property = "name", column = "name"),
            @Result(property = "password", column = "password"),
            @Result(property = "phoneNum", column = "phoneNum"),
    })
    List<Member> getAllMember();

    String getCount = "SELECT count(*) from member";
    @Select(getCount)
    @Results(id = "countSet", value = {
            @Result(property = "count(*)", column = "count(*)"),
    })
    String getMemberCount();

    final String SELECT_BY_NAME = "SELECT * FROM member WHERE name like  CONCAT('%',#{name},'%')";
    @Select(SELECT_BY_NAME)
    @ResultMap("resultSet")
    List<Member> getMemberByName(String name);

    final String SELECT_BY_ID = "SELECT * FROM member WHERE id like  CONCAT('%',#{id},'%')";
    @Select(SELECT_BY_ID)
    @ResultMap("resultSet")
    List<Member> getMemberById2(String id);

    final String SELECT_BY_PW = "SELECT * FROM member WHERE password like  CONCAT('%',#{password},'%')";
    @Select(SELECT_BY_PW)
    @ResultMap("resultSet")
    List<Member> getMemberByPw(String password);

    final String SELECT_BY_PHONE_NUM = "SELECT * FROM member WHERE phoneNum like CONCAT('%',#{password})";
    @Select(SELECT_BY_PHONE_NUM)
    @ResultMap("resultSet")
    List<Member> getMemberByPhoneNum(String phoneNum);

    final String SELECT = "SELECT * FROM member WHERE id = #{id}";
    @Select(SELECT)
    @ResultMap("resultSet")
    List<Member> getMemberById(String id);

    final String INSERT = "insert into member (id, name, password, phoneNum) values(#{id}, #{name}, #{password}, #{phoneNum})";
    @Insert(INSERT)
    @ResultMap("resultSet")
    public void insertMember(Member member);

    @Select("select * from member where id=#{id}")
    @ResultMap("resultSet")
    Member findById(String id);

}

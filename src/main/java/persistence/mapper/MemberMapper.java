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

    final String SELECT = "SELECT * FROM member WHERE id = #{id}";
    @Select(SELECT)
    @ResultMap("resultSet")
    List<Member> getMemberById(String id);

    final String INSERT = "insert into member (id, name, password, phoneNum) values(#{id}, #{name}, #{password}, #{phoneNum})";
    @Insert(INSERT)
    @ResultMap("resultSet")
    public void insertMember(Member member);

}

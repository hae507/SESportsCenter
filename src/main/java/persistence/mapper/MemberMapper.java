package persistence.mapper;

import org.apache.ibatis.annotations.*;
import persistence.DTO.MemberDTO;

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
    List<MemberDTO> getAllMember();

    final String INSERT = "insert into member (id, name, password, phoneNum) values(#{id}, #{name}, #{password}, #{phoneNum})";
    @Insert(INSERT)
    @ResultMap("resultSet")
    public void insertMember(MemberDTO memberDTO);

}

package persistence.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import persistence.Entity.EnrollLocker;
import persistence.Entity.Locker;

import java.util.List;

public interface LockerMapper {

    final String getAll = "SELECT * from Locker";
    @Select(getAll)
    @Results(id = "result", value = {
            @Result(property = "lockerId",column = "lockerId"),
            @Result(property = "lockerLocation" ,column = "lockerLocation"),
            @Result(property = "rentalAmount",column = "rentalAmount"),
            @Result(property = "centerName",column = "centerName")
    })
    List<Locker> getAll();

    final String getOne = "SELECT * from Locker where lockerId = #{lockerId}";
    @Select(getOne)
    Locker getOne(String lockerId);

    @Insert("insert into locker (lockerId, lockerLocation, rentalAmount, centerName) " +
            "values(#{lockerId}, #{lockerLocation}, #{rentalAmount}, #{centerName})")
    void insertLocker(Locker locker);

    @Select("select * from locker where lockerId=#{lockerId}")
    Locker findByLockerId(String lockerId);

}

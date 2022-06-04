package persistence.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import persistence.Entity.EnrollLocker;
import persistence.Entity.Instructor;

import java.sql.Date;
import java.util.List;

public interface EnrollLockerMapper {

    final String getAll = "SELECT * from EnrollLocker";
    @Select(getAll)
    @Results(id = "result", value = {
            @Result(property = "EnrollLockerNum",column = "EnrollLockerNum"),
            @Result(property = "lockerId" ,column = "lockerId"),
            @Result(property = "id",column = "id"),
            @Result(property = "rentalPeriod",column = "rentalPeriod")
    })
    List<EnrollLocker> getAll();

    final String getEnrollLockerNum = "SELECT EnrollLockerNum from EnrollLocker ORDER BY EnrollLockerNum DESC LIMIT 1 ";
    @Select(getEnrollLockerNum)
    String getEnrollLockerNum();

    @Insert("insert into enrollLocker (lockerId, id, rentalPeriod, paymentDate) " +
            "values(#{lockerId}, #{id}, #{rentalPeriod}, #{paymentDate})")
    void lockerRental(EnrollLocker enrollLocker);

}

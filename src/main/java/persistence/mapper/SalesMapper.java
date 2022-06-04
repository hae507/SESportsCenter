package persistence.mapper;


import org.apache.ibatis.annotations.Insert;
import persistence.Entity.Sale;

public interface SalesMapper {

    @Insert("insert into Sales (enrollLessonNum, enrollLockerNum, amount, date, center) " +
            "values(#{enrollLessonNum}, #{enrollLockerNum}, #{amount}, #{date}, #{center})")
    void insert(Sale sale);

}

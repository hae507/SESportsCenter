package persistence.Entity;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.session.SqlSessionFactory;

import java.sql.Date;


@Setter
@Getter
public class EnrollLocker {
    private int EnrollLockerNum;
    private String lockerId;
    private String id;
    private Date rentalPeriod;

    private java.util.Date paymentDate;


    public String toString() {
        return "EnrollLockerNum : " + EnrollLockerNum + ", lockerId : " + lockerId + ", id : " + id +
                ", rentalPeriod : " + rentalPeriod;
    }

}

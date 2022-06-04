package persistence.Control;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import persistence.Entity.EnrollLocker;
import persistence.Entity.Locker;
import persistence.Entity.Sale;
import persistence.mapper.EnrollLockerMapper;
import persistence.mapper.LockerMapper;
import persistence.mapper.SalesMapper;

import java.time.LocalDate;
import java.util.Date;

public class EnrollLockerControl {
    private SqlSessionFactory sqlSessionFactory = null;

    public EnrollLockerControl(SqlSessionFactory sqlSessionFactory){
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public void lockerRental(EnrollLocker enrollLocker){

        Date now = new Date();
        enrollLocker.setPaymentDate(now);

//        Sale sale = new Sale(0, 0, enrollLocker.get)
        SqlSession session = sqlSessionFactory.openSession();
        EnrollLockerMapper mapper = session.getMapper(EnrollLockerMapper.class);
        LockerMapper lockerMapper = session.getMapper(LockerMapper.class);
        SalesMapper salesMapper = session.getMapper(SalesMapper.class);
        Locker locker = lockerMapper.getOne(enrollLocker.getLockerId());
        Sale sale = new Sale(locker.getRentalAmount(), LocalDate.now(), locker.getCenterName());

        try {
            mapper.lockerRental(enrollLocker);
            sale.setEnrollLockerNum(Integer.parseInt(mapper.getEnrollLockerNum()));
            salesMapper.insert(sale);
//            mapper.getEnrollLockerNum();
            session.commit();
        } finally {
            session.close();
        }
    }

}

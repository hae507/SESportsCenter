package persistence.Control;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import persistence.Entity.Locker;
import persistence.mapper.LockerMapper;

import java.util.Date;

public class LockerControl {
    private SqlSessionFactory sqlSessionFactory = null;

    public LockerControl(SqlSessionFactory sqlSessionFactory){
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public void insertLocker(Locker locker){
        SqlSession session = sqlSessionFactory.openSession();
        try {
            session.getMapper(LockerMapper.class).insertLocker(locker);
            session.commit();
        } finally {
            session.close();
        }
    }

    public Locker findByLockerId(String lockerId){
        Locker locker = null;
        SqlSession session = sqlSessionFactory.openSession();
        LockerMapper mapper = session.getMapper(LockerMapper.class);
        try{
            locker = mapper.findByLockerId(lockerId);
            session.commit();
        } catch(Exception e){
            e.printStackTrace();
            session.rollback();
        }
        finally{
            session.close();
        }
        return locker;
    }


}


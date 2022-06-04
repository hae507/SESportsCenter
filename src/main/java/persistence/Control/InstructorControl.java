package persistence.Control;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import persistence.Entity.Instructor;
import persistence.mapper.InstructorMapper;

import java.util.List;

public class InstructorControl {
    private SqlSessionFactory sqlSessionFactory = null;

    public InstructorControl(SqlSessionFactory sqlSessionFactory){
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public List<Instructor> readInstructor(){
        SqlSession session = sqlSessionFactory.openSession();
        InstructorMapper mapper = session.getMapper(InstructorMapper.class);
        List<Instructor> getAll = mapper.getAllInstructor();
        return getAll;
    }

    public List<Instructor> readInstructorByName(String name){
        SqlSession session = sqlSessionFactory.openSession();
        InstructorMapper mapper = session.getMapper(InstructorMapper.class);
        List<Instructor> list = mapper.getInstructorByName(name);
        return list;
    }

    public boolean createInstructor(String id,String pw,String name,String phone,String ssn,String addr){

            if(checkInstructor(ssn))
                return false;
            Instructor instructor = new Instructor(id,pw, name, phone, ssn,addr);
            SqlSession session = sqlSessionFactory.openSession();
            InstructorMapper mapper = session.getMapper(InstructorMapper.class);
            try {
                mapper.insertInstructor(instructor);
                session.commit();
            } catch (Exception e) {
                e.printStackTrace();
                session.rollback();
            } finally {
                session.close();
            }
            return true;

    }

    private boolean checkInstructor(String ssn){
        List<Instructor> insturctorDTOS = null;
        SqlSession session = sqlSessionFactory.openSession();
        InstructorMapper mapper = session.getMapper(InstructorMapper.class);

        try{
            insturctorDTOS = mapper.getInstructorBySsn(ssn);
            session.commit();
        }
        catch(Exception e){
            e.printStackTrace();
            session.rollback();
        }
        finally {
            session.close();
        }
        return !insturctorDTOS.isEmpty();

    }





}

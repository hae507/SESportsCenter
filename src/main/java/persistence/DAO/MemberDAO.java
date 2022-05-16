package persistence.DAO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import persistence.DTO.MemberDTO;
//import persistence.PooledDataSource;
import persistence.mapper.MemberMapper;

import java.util.List;

public class MemberDAO {

    private SqlSessionFactory sqlSessionFactory = null;

    public MemberDAO(SqlSessionFactory sqlSessionFactory){
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public List<MemberDTO> getAllMember(){
        SqlSession session = sqlSessionFactory.openSession();
        MemberMapper mapper = session.getMapper(MemberMapper.class);
        List<MemberDTO> all = mapper.getAllMember();
        return all;
    }

    // insert 후에 조회 자동으로 하게 구현, 중복되는 id가 있는경우 insert 못하게      
    public void insertMember(MemberDTO memberDTO){
        SqlSession session = sqlSessionFactory.openSession();
        MemberMapper mapper = session.getMapper(MemberMapper.class);
        try {
            mapper.insertMember(memberDTO);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.rollback();
        } finally {
            session.close();
        }
    }



}

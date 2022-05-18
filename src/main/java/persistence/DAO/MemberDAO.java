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

    public List<MemberDTO> inquiryMember(){
        SqlSession session = sqlSessionFactory.openSession();
        MemberMapper mapper = session.getMapper(MemberMapper.class);
        List<MemberDTO> all = mapper.getAllMember();
        return all;
    }

    public int getMemberCount(){
        SqlSession session = sqlSessionFactory.openSession();
        MemberMapper mapper = session.getMapper(MemberMapper.class);
        int count = Integer.parseInt(mapper.getMemberCount());
        return count;
    }

    // insert 후에 조회 자동으로 하게 구현, 중복되는 id가 있는경우 insert 못하게, 반환값 boolean으로? : 추가할 사항
    public void registerMember(String name, String id, String password, String phoneNum){
        MemberDTO memberDTO = new MemberDTO(name, id, password, phoneNum);
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

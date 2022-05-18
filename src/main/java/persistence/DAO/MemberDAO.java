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

    // insert 후에 조회 자동으로 하게 구현, 중복되는 id가 있는경우 insert 못하게 : 추가할 사항
    // 반환값 true면 등록 성공, false면 이미 있는 계정이라고 떠야 함
    public boolean registerMember(String id, String name, String password, String phoneNum){
        if(memberExists(id))
            return false;
        MemberDTO memberDTO = new MemberDTO(id, name, password, phoneNum);
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
        return true;
    }

    private boolean memberExists(String id){
        List<MemberDTO> list = null;
        SqlSession session = sqlSessionFactory.openSession();
        MemberMapper mapper = session.getMapper(MemberMapper.class);
        try {
            list = mapper.selectById(id);
            session.commit();
        }catch (Exception e){
            e.printStackTrace();
            session.rollback();
        } finally {
            session.close();
        }
        return !list.isEmpty();
    }



}

package persistence.Control;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import persistence.Entity.Member;
//import persistence.PooledDataSource;
import persistence.mapper.MemberMapper;

import java.util.List;

public class MemberControl {

    private SqlSessionFactory sqlSessionFactory = null;

    public MemberControl(SqlSessionFactory sqlSessionFactory){
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public List<Member> inquiryMember(){
        SqlSession session = sqlSessionFactory.openSession();
        MemberMapper mapper = session.getMapper(MemberMapper.class);
        List<Member> all = mapper.getAllMember();
        return all;
    }

    public List<Member> inquiryMemberByName(String name){
        SqlSession session = sqlSessionFactory.openSession();
        MemberMapper mapper = session.getMapper(MemberMapper.class);
        List<Member> list = mapper.getMemberByName(name);
        return list;
    }

    public List<Member> inquiryMemberById(String id){
        SqlSession session = sqlSessionFactory.openSession();
        MemberMapper mapper = session.getMapper(MemberMapper.class);
        List<Member> list = mapper.getMemberById2(id);
        return list;
    }

    public List<Member> inquiryMemberByPw(String pw){
        SqlSession session = sqlSessionFactory.openSession();
        MemberMapper mapper = session.getMapper(MemberMapper.class);
        List<Member> list = mapper.getMemberByPw(pw);
        return list;
    }

    public List<Member> inquiryMemberByPhoneNum(String phoneNum){
        SqlSession session = sqlSessionFactory.openSession();
        MemberMapper mapper = session.getMapper(MemberMapper.class);
        List<Member> list = mapper.getMemberByPhoneNum(phoneNum);
        return list;
    }

    public int getMemberCount(){
        SqlSession session = sqlSessionFactory.openSession();
        MemberMapper mapper = session.getMapper(MemberMapper.class);
        int count = Integer.parseInt(mapper.getMemberCount());
        return count;
    }

    // 반환값 true면 등록 성공, false면 실패
    public boolean registerMember(String id, String name, String password, String phoneNum){
        if(memberExists(id))
            return false;
        Member member = new Member(id, name, password, phoneNum);
        SqlSession session = sqlSessionFactory.openSession();
        MemberMapper mapper = session.getMapper(MemberMapper.class);
        try {
            mapper.insertMember(member);
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
        List<Member> list = null;
        SqlSession session = sqlSessionFactory.openSession();
        MemberMapper mapper = session.getMapper(MemberMapper.class);
        try {
            list = mapper.getMemberById(id);
            session.commit();
        }catch (Exception e){
            e.printStackTrace();
            session.rollback();
        } finally {
            session.close();
        }
        return !list.isEmpty();
    }

    public Member findById(String id){
        Member member = null;
        SqlSession session = sqlSessionFactory.openSession();
        MemberMapper mapper = session.getMapper(MemberMapper.class);
        try{
            member = mapper.findById(id);
            session.commit();
        } catch(Exception e){
            e.printStackTrace();
            session.rollback();
        }
        finally{
            session.close();
        }
        return member;
    }



}

//import persistence.MyBatisConnectionFactory;
//import persistence.dao.*;
import persistence.DAO.MemberDAO;
import persistence.DTO.MemberDTO;
import persistence.MyBatisConnectionFactory;

import java.util.List;
//import service.*;


/**
 * 이 클래스는 함수확인용
 */

public class ForTest {

    public static void main(String args[]){

//        MemberDTO memberDTO;
        MemberDAO DAOtest = new MemberDAO(MyBatisConnectionFactory.getSqlSessionFactory());

        MemberDTO DTOtest = new MemberDTO("se56", "김소공", "0101", "010-5432-1234");
        DAOtest.insertMember(DTOtest);

        List<MemberDTO> memberList = DAOtest.getAllMember();

        for(int i = 0; i < memberList.size(); i++) {
            System.out.println(memberList.get(i).getPhoneNum());
        }


    }

}
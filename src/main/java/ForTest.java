//import persistence.MyBatisConnectionFactory;
//import persistence.dao.*;
import persistence.Control.MemberControl;
import persistence.Entity.Member;
import persistence.MyBatisConnectionFactory;

import java.io.PrintWriter;
import java.util.List;
//import service.*;


/**
 * 이 클래스는 함수확인용
 */

public class ForTest {

    public static void main(String args[]){

//        MemberDTO memberDTO;
        MemberControl DAOtest = new MemberControl(MyBatisConnectionFactory.getSqlSessionFactory());

        Member DTOtest = new Member();
        System.out.println(DAOtest.registerMember("se569", "김소공", "0101", "010-5432-1234"));

        System.out.println(DAOtest.getMemberCount());
        List<Member> memberList = DAOtest.inquiryMemberByName("소공");
        PrintWriter pw;
        for(int i = 0; i < memberList.size(); i++) {
            System.out.println(memberList.get(i));
        }


    }

}
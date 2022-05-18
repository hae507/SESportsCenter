package persistence.DTO;

import lombok.Setter;
import lombok.Getter;

@Setter
@Getter

public class MemberDTO {
    private String id;
    private String name;
    private String password;
    private String phoneNum;

    public MemberDTO(){

    }
    public MemberDTO(String id, String name, String password, String phoneNum){
        this.id = id;
        this.name = name;
        this.password = password;
        this.phoneNum = phoneNum;
    }

    public String toString(){
        return "id : " + id + ", name : " + name + ", password : " + password + ", phoneNum : " + phoneNum;
    }

}

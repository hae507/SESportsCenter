package persistence.Entity;

import lombok.Setter;
import lombok.Getter;

@Setter
@Getter

public class Member {
    private String id;
    private String name;
    private String password;
    private String phoneNum;

    public Member(){

    }
    public Member(String id, String name, String password, String phoneNum){
        this.id = id;
        this.name = name;
        this.password = password;
        this.phoneNum = phoneNum;
    }

    public String toString(){
        return "id : " + id + ", name : " + name + ", password : " + password + ", phoneNum : " + phoneNum;
    }

}

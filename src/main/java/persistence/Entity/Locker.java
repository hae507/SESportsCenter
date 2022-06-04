package persistence.Entity;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter

public class Locker {
    private String lockerId;
    private String lockerLocation;
    private int rentalAmount;
    private String centerName;

    public String toString(){
        return "lockerId : " + lockerId + ", lockerLocation : " + lockerLocation + ", rentalAmount : " + rentalAmount +
                ", centerName : " + centerName;
    }

}
package persistence.Entity;
import lombok.Setter;
import lombok.Getter;

@Setter
@Getter

public class Lesson {
    private String LessonId;
    private int instructorNum;   /*fk*/
    private String LessonName;

    private String LessonDay;
    private String LessonTime;
    private int LessonPrice;
    private  int LessonDCRate;
    private String SportsCenterName;

    public Lesson() {}

    public Lesson(String LessonId, int instructorNum, String LessonName, String LessonDay, String LessonTime, int LessonPrice, int LessonDCRate, String SportsCenterName){
        this.LessonId = LessonId;
        this.instructorNum = instructorNum;
        this.LessonName = LessonName;
        this.LessonDay = LessonDay;
        this.LessonTime = LessonTime;
        this.LessonPrice = LessonPrice;
        this.LessonDCRate = LessonDCRate;
        this.SportsCenterName = SportsCenterName;
    }

    @Override
    public String toString() {
        return "Lesson{" +
                "LessonId='" + LessonId + '\'' +
                ", instructorNum=" + instructorNum +
                ", LessonName='" + LessonName + '\'' +
                ", LessonDay='" + LessonDay + '\'' +
                ", LessonTime='" + LessonTime + '\'' +
                ", LessonPrice=" + LessonPrice +
                ", LessonDCRate=" + LessonDCRate +
                ", SportsCenterName='" + SportsCenterName + '\'' +
                '}';
    }
}

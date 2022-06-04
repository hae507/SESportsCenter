package persistence.Entity;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter @Setter
public class EnrollLesson {

    private int enrollLessonNum;

    private String id;

    private String LessonId;

    private String instructorNum;

    private String LessonDay;

    private String LessonTime;

    private Date paymentDate;
}

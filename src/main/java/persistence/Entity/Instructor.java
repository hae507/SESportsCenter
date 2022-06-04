package persistence.Entity;

public class Instructor {
    private String instructorId;
    private String instructorPw;
    private String instructorName;
    private String instructorPhone;
    private String instructorSsn;
    private String instructorAdd;

    @Override
    public String toString() {
        return "Instructor{" +
                "instructorId='" + instructorId + '\'' +
                ", instructorPw='" + instructorPw + '\'' +
                ", instructorName='" + instructorName + '\'' +
                ", instructorPhone='" + instructorPhone + '\'' +
                ", instructorSsn='" + instructorSsn + '\'' +
                ", instructorAdd='" + instructorAdd + '\'' +
                '}';
    }

    public Instructor(String instructorId, String instructorPw, String instructorName, String instructorPhone, String instructorSsn, String instructorAdd) {
        this.instructorId = instructorId;
        this.instructorPw = instructorPw;
        this.instructorName = instructorName;
        this.instructorPhone = instructorPhone;
        this.instructorSsn = instructorSsn;
        this.instructorAdd = instructorAdd;
    }

    public String getInstructorId() {
        return instructorId;
    }

    public void setInstructorId(String instructorId) {
        this.instructorId = instructorId;
    }

    public String getInstructorPw() {
        return instructorPw;
    }

    public void setInstructorPw(String instructorPw) {
        this.instructorPw = instructorPw;
    }

    public String getInstructorName() {
        return instructorName;
    }

    public void setInstructorName(String instructorName) {
        this.instructorName = instructorName;
    }

    public String getInstructorPhone() {
        return instructorPhone;
    }

    public void setInstructorPhone(String instructorPhone) {
        this.instructorPhone = instructorPhone;
    }

    public String getInstructorSsn() {
        return instructorSsn;
    }

    public void setInstructorSsn(String instructorSsn) {
        this.instructorSsn = instructorSsn;
    }

    public String getInstructorAdd() {
        return instructorAdd;
    }

    public void setInstructorAdd(String instructorAdd) {
        this.instructorAdd = instructorAdd;
    }
}

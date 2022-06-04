package persistence.Entity;

import java.time.LocalDate;

public class Sale {

    int amount;
    LocalDate date;
    String center;
    int enrollLessonNum;
    int enrollLockerNum;

    String paymentItem;

    public  Sale(){

    }

    public Sale(int amount, LocalDate date, String center){
        this.amount = amount;
        this.date = date;
        this.center = center;
    }

    public void setPaymentItem(String paymentItem) {
        this.paymentItem = paymentItem;
    }

    public String getPaymentItem() {
        return paymentItem;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public String getCenter() {
        return center;
    }

    public void setCenter(String center) {
        this.center = center;
    }

    public int getEnrollLessonNum() {
        return enrollLessonNum;
    }

    public void setEnrollLessonNum(int enrollLessonNum) {
        this.enrollLessonNum = enrollLessonNum;
    }

    public int getEnrollLockerNum() {
        return enrollLockerNum;
    }

    public void setEnrollLockerNum(int enrollLockerNum) {
        this.enrollLockerNum = enrollLockerNum;
    }
}

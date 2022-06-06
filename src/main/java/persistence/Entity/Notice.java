package persistence.Entity;

import java.util.Date;

public class Notice {
    private int noticeNo;
    private String noticeTitle;
    private String noticeContents;
    private Date noticeUpdateTime;

    public Notice() {
        super();
    }
    public Notice(int noticeNo, String noticeTitle, String noticeContents, Date noticeUpdateTime) {
        super();
        this.noticeNo = noticeNo;
        this.noticeTitle = noticeTitle;
        this.noticeContents = noticeContents;
        this.noticeUpdateTime = noticeUpdateTime;
    }

    public int getnoticeNo() {
        return noticeNo;
    }
    public String getnoticeTitle() {
        return noticeTitle;
    }
    public String getnoticeContents() {
        return noticeContents;
    }
    public Date getnoticeUpdateTime() {
        return noticeUpdateTime;
    }
    public void setNoticeNo(int noticeNo) {
        this.noticeNo = noticeNo;
    }
    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle;
    }
    public void setNoticeContents(String noticeContents) {
        this.noticeContents = noticeContents;
    }
    public void setNoticeUpdateTime(Date noticeUpdateTime) {
        this.noticeUpdateTime = noticeUpdateTime;
    }
}
package persistence.Control;

import persistence.Entity.Notice;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NoticeControl {
    Connection con = null;
    String url = "jdbc:mysql://localhost:3306/seeportscenter_lesson";
    String user = "root";
    String password = "chan5542";
    public NoticeControl() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public List<Notice> noticeList() {
        try {
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Statement stmt = null;
        ResultSet rs = null;
        List<Notice> res = new ArrayList<Notice>();

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM Notice");
            if (rs != null) {
                while (rs.next()) {
                    Notice dto = new Notice(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4));
                    res.add(dto);
                }
            } else {
                System.out.println("Empty");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) {
                    rs.close();
                }
                if(stmt != null) {
                    stmt.close();
                }
                if(con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return res;
    }
    public Notice noticeView(int noticeNo) {
        try {
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Notice res = null;

        try {
            pstm = con.prepareStatement("SELECT * FROM Notice WHERE noticeNo = ?");
            pstm.setInt(1, noticeNo);
            rs = pstm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    res = new Notice();
                    res.setNoticeNo(rs.getInt(1));
                    res.setNoticeTitle(rs.getString(2));
                    res.setNoticeContents(rs.getString(3));
                    res.setNoticeUpdateTime(rs.getDate(4));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return res;
    }

    public int noticeRegistration(Notice dto) {
        try {
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        PreparedStatement pstm = null;
        int res = 0;

        try {
            pstm = con.prepareStatement("INSERT INTO Notice VALUES(NULL, ?, ?, NOW())");
            pstm.setString(1,dto.getnoticeTitle());
            pstm.setString(2,dto.getnoticeContents());
            res = pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                pstm.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return res;
    }
}
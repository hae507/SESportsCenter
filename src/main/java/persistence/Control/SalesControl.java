package persistence.Control;

import persistence.Entity.Sale;
import persistence.MyBatisConnectionFactory;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

// 서블릿에서 데이터베이스 조회 후 데이터를 jsp로 전달해주기 위해 사용
public class SalesControl {

    private static Connection con = null;
    private static Statement stmt = null;
    private static PreparedStatement pstmt = null;
    private static ResultSet rs = null;

    private static LessonControl lessonControl = new LessonControl(MyBatisConnectionFactory.getSqlSessionFactory());

    private void connect() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost/seeportscenter_lesson";
            con = DriverManager.getConnection(url, "root", "chan5542");
        }

        catch (ClassNotFoundException e) {e.printStackTrace();}
        catch (SQLException e) {e.printStackTrace();}

    }

    private void closeResultSet() {
        try { if(con != null && !rs.isClosed()){ rs.close(); } }
        catch (SQLException throwables) { throwables.printStackTrace(); }
    }

    private void closeStmt() {
        try { if(con != null && !stmt.isClosed()){ stmt.close(); } }
        catch (SQLException throwables) { throwables.printStackTrace(); }
    }

    private void closeConnection() {
        try { if(con != null && !con.isClosed()){ con.close(); } }
        catch (SQLException throwables) { throwables.printStackTrace(); }
    }

    private void closePstmt() {
        try { if(con != null && !pstmt.isClosed()){ pstmt.close(); } }
        catch (SQLException throwables) { throwables.printStackTrace(); }
    }

    public List<Sale> getSalesByPeriod(LocalDate from, LocalDate to) {

        String sql = "SELECT * FROM sales\n" +
                "WHERE ? <= sales.date\n" +
                "AND sales.date <= ?" +
                "order by sales.date;";

        connect();
        List<Sale> saleList = new ArrayList<>();
        try {

            pstmt = con.prepareStatement(sql);
            pstmt.setDate(1, Date.valueOf(from));
            pstmt.setDate(2, Date.valueOf(to));

            rs = pstmt.executeQuery();

            while (rs.next()) {
                int amount = rs.getInt("amount");
//                int enrollLessonNum = rs.getInt("enrollLessonNum");
                String center = rs.getString("center");
                LocalDate date = rs.getDate("date").toLocalDate();
                Sale sale = new Sale();

                String paymentItem;

                int enrollLessonNum = rs.getInt("enrollLessonNum");

                if(rs.wasNull()) {
                    paymentItem = "사물함 대여";
                }
                else {paymentItem = "수강 신청";}

                sale.setPaymentItem(paymentItem);
                sale.setAmount(amount);
                sale.setCenter(center);
                sale.setDate(date);
                saleList.add(sale);
            }
        }

        catch (SQLException e) {throw new RuntimeException(e);}

        closeResultSet();
        closePstmt();
        closeConnection();

        return saleList;
    }

    public List<Sale> getSalesByLessonName(String lessonName) {

        String sql = "SELECT LessonName, amount, center, date FROM sales sales\n" +
                "JOIN enrolllesson enrolllesson ON sales.enrollLessonNum = enrolllesson.enrollLessonNum\n" +
                "JOIN lesson lesson ON lesson.LessonId = enrolllesson.LessonId\n" +
                "WHERE sales.enrollLessonNum IS not null";

        if(lessonName != null && !lessonName.equals("")) {
            sql += " AND lessonName = ?";
        }

        sql += ";";

        connect();
        List<Sale> saleList = new ArrayList<>();
        try {

            pstmt = con.prepareStatement(sql);
            if(lessonName != null && !lessonName.equals(""))pstmt.setString(1, lessonName);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                int amount = rs.getInt("amount");
                String center = rs.getString("center");
                LocalDate date = rs.getDate("date").toLocalDate();
                Sale sale = new Sale();

                String paymentItem = rs.getString("LessonName");


                sale.setPaymentItem(paymentItem);
                sale.setAmount(amount);
                sale.setCenter(center);
                sale.setDate(date);
                saleList.add(sale);
            }
        }

        catch (SQLException e) {throw new RuntimeException(e);}

        closeResultSet();
        closePstmt();
        closeConnection();

        return saleList;
    }



}

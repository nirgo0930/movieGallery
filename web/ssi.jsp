<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html>
    <head>
        <title></title>
    </head>
    <body>
        <%! //전역변수,전역함수
            //ssi.jsp문서는 단독실행가능합니다
            Connection CN; //DB서버연결정보,명령어생성할때 참조
            Statement ST; //ST=CN.createStatement()
            PreparedStatement PST; //PST=CN.prepareStatment(sql)
            CallableStatement CS; //CS=CN.callableStatement(sql)
            ResultSet RS; //조회한결과를 RS기억  RS.next( );

            String uid, pwd, msg, mTitle, mActors, mContent, mImg, pTitle, pId, mImage, cId, cuId, comment;
            String name;
            Boolean isUnknown, cIsUnknown;
            int Gtotal = 0, Mtotal = 0, pViewCnt = 0;
            Date mDate, pDate;
            double rate = 0;
        %>

        <%
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
                CN = DriverManager.getConnection(url, "system", "1234");
                System.out.println("db연결 성공했습니다");
            } catch (Exception ex) {
                System.out.println("db에러:" + ex);
            }
        %>

    </body>
</html>
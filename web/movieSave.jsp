<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="ssi.jsp" %>


<html>
    <head>
        <title>test</title>
    </head>
    <body>
        <%
            String path = application.getRealPath("./storage");
            System.out.println("공통저장경로 " + path);
            int size = 1024 * 1024 * 7;

            DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();

            MultipartRequest mr = new MultipartRequest(request, path, size, "UTF-8");

            if (mr.getFile("mImg") != null) {

                String dimg = mr.getFilesystemName("mImg");
                System.out.println("넘어온파일 = " + dimg + "<p>");
                File ff = mr.getFile("mImg");
                out.println("<h2>" + dimg + " 파일크기는 " + ff.length() + "Byte </h2>");
            }

            mTitle = mr.getParameter("title");
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date tempDate = new Date();
            if (mr.getParameter("openDate").equals(null)) {
                tempDate = formatter.parse(mr.getParameter("openDate"));
            }
            mDate = tempDate;
            mActors = mr.getParameter("title");
            mContent = mr.getParameter("content");
            try {
                isUnkown = !mr.getParameter("unknown").equals(null);
            } catch (Exception e) {
                isUnkown = false;
            }

            System.out.println("제목 = " + mTitle);
            System.out.println("개봉일 = " + mDate);
            System.out.println("배우 = " + mActors);
            System.out.println("내용 = " + mContent);
            System.out.println("익명 = " + isUnkown);
//            msg = "insert into test(title,pay,wdate,code) values(?, ?, sysdate, ?)";
//
//            try {
//                PST = CN.prepareStatement(msg);
//                PST.setString(1, Gtitle);
//                PST.setInt(2, Gpay);
//                PST.setInt(3, Gcode);
//                PST.executeUpdate(); // PST.executeUpdate(msg기술하면에러발생);괄호안에 인자 없습니다
//                System.out.println(Gcode + "코드 데이터 PreparedStatement성공처리 8-18-목요일");
//                response.sendRedirect("testList.jsp");
//            } catch (Exception ex) {
//                response.sendRedirect("testList.jsp");
//                System.out.println("test테이블 저장실패 에러 " + ex);
//            }
        %>

    </body>
</html>
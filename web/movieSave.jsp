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
            int size = 1024 * 1024 * 7;

            DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
            MultipartRequest mr = new MultipartRequest(request, path, size, "UTF-8");
            String tempImg = "";
            if (mr.getFile("mImg") != null) {
                tempImg = mr.getFilesystemName("mImg");
                File ff = mr.getFile("mImg");
            }

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = new java.util.Date();
            Date tempDate = new Date(utilDate.getTime());
            if (mr.getParameter("openDate").equals(null)) {
                tempDate = new Date(formatter.parse(mr.getParameter("openDate")).getTime());
            }

            Boolean tempCheck;
            try {
                tempCheck = !mr.getParameter("unknown").isEmpty();
            } catch (Exception e) {
                tempCheck = false;
            }
            pTitle = mr.getParameter("title");
            mTitle = mr.getParameter("mTitle");
            mDate = tempDate;
            mActors = mr.getParameter("title");
            mImg = tempImg;
            mContent = mr.getParameter("content");
            isUnkown = tempCheck;

            System.out.println("id = " + session.getAttribute("pass"));
            System.out.println("제목 = " + mTitle);
            System.out.println("개봉일 = " + mDate);
            System.out.println("배우 = " + mActors);
            System.out.println("내용 = " + mContent);
            System.out.println("익명 = " + isUnkown);

            msg = "insert into MovieRecommend(title,uid,pDate,userInfo,mTitle,mainActor,openDate) " +
                    "values(?, ?, sysdate, ?, ?, ?, ?)";

            try {
                PST = CN.prepareStatement(msg);
                PST.setString(1, pTitle);
                PST.setString(2, session.getAttribute("pass").toString());
                PST.setBoolean(3, isUnkown);
                PST.setString(4, mTitle);
                PST.setString(5, mActors);
                PST.setDate(6, mDate);


                PST.executeUpdate(); // PST.executeUpdate(msg기술하면에러발생);괄호안에 인자 없습니다
                response.sendRedirect("movieList.jsp");
            } catch (Exception ex) {
                response.sendRedirect("movieList.jsp");
                System.out.println("테이블 저장실패 에러 " + ex);
            }
        %>

    </body>
</html>
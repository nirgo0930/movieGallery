<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="ssi.jsp" %>


<html>
    <head>
        <title></title>
    </head>
    <body>
        <%
            String path = application.getRealPath("./images");
            int size = 1024 * 1024 * 7;

            DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
            MultipartRequest mr = new MultipartRequest(request, path, size, "UTF-8", dfr);
            String tempImg = "";
            if (mr.getFile("mImg") != null) {
                tempImg = mr.getFilesystemName("mImg");
                File ff = mr.getFile("mImg");
            }

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = new java.util.Date();
            Date tempDate;
            try {
                tempDate = new Date(formatter.parse(mr.getParameter("openDate")).getTime());
            } catch (Exception e) {
                tempDate = new Date(utilDate.getTime());
            }

            Boolean tempCheck;
            try {
                tempCheck = !mr.getParameter("unknown").isEmpty();
            } catch (Exception e) {
                tempCheck = false;
            }

            pId = mr.getParameter("pId");
            pTitle = mr.getParameter("title");
            mTitle = mr.getParameter("mTitle");
            mDate = tempDate;
            mActors = mr.getParameter("title");
            mImage = tempImg;
            mContent = mr.getParameter("content");
            isUnknown = tempCheck;

            System.out.println("pid : " + pId);

            if (pId == null) {
                System.out.println("new");
                msg = "insert into MovieRecommend(Pid,title,userid,pDate,userInfo,mTitle,mainActor,openDate,content,movieImage) values(movie_seq.nextval,?,?,sysdate,?,?,?,?,?,?)";

                try {
                    PST = CN.prepareStatement(msg);
                    PST.setString(1, pTitle);
                    PST.setString(2, session.getAttribute("pass").toString());
                    PST.setInt(3, (isUnknown ? 1 : 0));
                    PST.setString(4, mTitle);
                    PST.setString(5, mActors);
                    PST.setDate(6, mDate);
                    PST.setString(7, mContent);
                    PST.setString(8, mImage);

                    PST.executeUpdate(); // PST.executeUpdate(msg기술하면에러발생);괄호안에 인자 없습니다
                    response.sendRedirect("movieList.jsp");
                } catch (Exception ex) {
                    response.sendRedirect("movieList.jsp");
                    System.out.println("테이블 저장실패 에러 " + ex);
                }
            } else {
                System.out.println("edit");
                msg = "update MovieRecommend set pDate=sysdate, title=?, userInfo=?, mTitle=?, mainActor=?,openDate=?,content=?,movieImage=? where Pid=" + pId;
                try {
                    PST = CN.prepareStatement(msg);
                    PST.setString(1, pTitle);
                    PST.setInt(2, (isUnknown ? 1 : 0));
                    PST.setString(3, mTitle);
                    PST.setString(4, mActors);
                    PST.setDate(5, mDate);
                    PST.setString(6, mContent);
                    PST.setString(7, mImage);

                    PST.executeUpdate(); // PST.executeUpdate(msg기술하면에러발생);괄호안에 인자 없습니다
                    response.sendRedirect("movieList.jsp");
                } catch (Exception ex) {
                    response.sendRedirect("movieList.jsp");
                    System.out.println("테이블 저장실패 에러 " + ex);
                }
            }
        %>

    </body>
</html>
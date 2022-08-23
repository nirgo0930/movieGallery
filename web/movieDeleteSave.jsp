<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title> [movieDeleteSave.jsp]</title>
        <style type="text/css">
        </style>
    </head>
    <body>

        <%
            pId = request.getParameter("Pid");
            msg = "delete from Mcomment where Pid = " + pId;
            System.out.println(msg);

            ST = CN.createStatement();
            ST.executeUpdate(msg);
            System.out.println(pId + " 게시물 댓글 데이터 삭제성공 ");

        %>

        <%
            pId = request.getParameter("Pid");
            msg = "delete from movieRecommend where Pid = " + pId;
            System.out.println(msg);

            ST = CN.createStatement();
            ST.executeUpdate(msg);
            System.out.println(pId + " 게시물 데이터 삭제성공 ");
            response.sendRedirect("movieList.jsp");
        %>
    </body>
</html>
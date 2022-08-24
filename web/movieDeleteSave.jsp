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
            try {
                String tempId = (String) session.getAttribute("pass");
                System.out.println(tempId + "/" + request.getParameter("isWriter"));

                if (tempId == "" || tempId == null) {
        %>
        <script>
            alert("로그인 이후 사용해 주세요.");
            location.href = "login.jsp";
        </script>
        <%
        } else if (request.getParameter("isWriter").equals(false)) {
        %>
        <script>
            alert("글 작성자만 수정 가능합니다.")
            location.href = "movieList.jsp";
        </script>
        <%
            }
        } catch (Exception e) {
            System.out.println(e);
        %>
        <script>
            alert("Error");
            location.href = "movieList.jsp";
        </script>
        <%
            }
        %>

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
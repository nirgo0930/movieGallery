<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="ssi.jsp" %>
<%@ include file="checkLogin.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title> [commentSave.jsp]</title>
    </head>
    <body>
        <%--        Cid number primary key ,--%>
        <%--        Pid number not null ,--%>
        <%--        foreign key (Pid) references MovieRecommend(Pid) ,--%>
        <%--        cuId varchar2(10) not null ,--%>
        <%--        foreign key (cuId) references userInfo(userid) ,--%>
        <%--        userInfo CHAR(1) ,--%>
        <%--        cContent varchar2(200) not null,--%>
        <%--        rate number not null--%>

        <%
            pId = request.getParameter("postId");
            msg = "insert into MComment values(Comment_seq.NEXTVAL, ?, ?,?,?,?,?,?,?)";

            try {
                PST = CN.prepareStatement(msg);
                PST.setString(1, pId);
                PST.setString(2, session.getAttribute("pass").toString());

                PST.executeUpdate();
                response.sendRedirect("movieDetail.jsp?Pid=" + pId);
            } catch (Exception ex) {
        %>
        <script>
            alert("db 저장 error");
        </script>
        <%
                System.out.println("테이블 저장실패 에러 " + ex);
                response.sendRedirect("movieDetail.jsp?Pid=" + pId);
            }
        %>
    </body>
</html>
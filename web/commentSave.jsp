<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%
            try {
                String tempId = session.getAttribute("pass").toString();
                if (tempId == "") {
        %>
        <script>
            alert("로그인 이후 사용해 주세요.");
            location.href = "login.jsp";
        </script>
        <%
            }
        } catch (Exception e) {
        %>
        <script>
            alert("로그인 이후 사용해 주세요.");
            location.href = "login.jsp";
        </script>
        <%
            }
        %>

        <%
            Boolean tempCheck;
            try {
                tempCheck = !request.getParameter("cIsUnknownCheck").isEmpty();
            } catch (Exception e) {
                tempCheck = false;
            }

            msg = "insert into MComment values(Comment_seq.NEXTVAL, ?, ?,?,?,?)";

            try {
                PST = CN.prepareStatement(msg);
                PST.setInt(1, Integer.parseInt(request.getParameter("postId")));
                PST.setString(2, session.getAttribute("pass").toString());
                PST.setInt(3, (tempCheck ? 1 : 0));
                PST.setString(4, request.getParameter("inputComment"));
                PST.setInt(5, Integer.parseInt(request.getParameter("rate")));


                PST.executeUpdate();
                response.sendRedirect("movieDetail.jsp?Pid=" + request.getParameter("postId"));
            } catch (Exception ex) {
        %>
        <script>
            alert("db 저장 error");
            location.href = "movieDetail.jsp?Pid=" + <%= request.getParameter("postId")%>;
        </script>
        <%
                System.out.println("테이블 저장실패 에러 " + ex);
            }
        %>
    </body>
</html>
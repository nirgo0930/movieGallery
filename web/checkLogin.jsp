<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<html>
    <head>
        <title>checkLogin</title>
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
    </body>
</html>
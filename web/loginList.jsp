<%@ page language="java" contentType="text/html; charset=UTF-8"   %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = request.getParameter("userID");
    String pwd = request.getParameter("pwd");
    try{
        msg="select count(*) as cnt from login where userid =? and pwd =? ";

    }
%>
</body>
</html>

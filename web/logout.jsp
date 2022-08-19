<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
    //로그아웃하고 메인페이지로
    response.sendRedirect("movieList.jsp");

%>
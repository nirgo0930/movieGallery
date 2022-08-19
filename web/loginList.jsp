<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<%@ include file="ssi.jsp" %>

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
        PST=CN.prepareStatement(msg);
        PST.setString(1, id);
        PST.setString(2, pwd);
        RS=PST.executeQuery();
    }catch(Exception ex){ }
    if(RS.next()==true){
        Gtotal=RS.getInt("cnt");
    }
    if(Gtotal>0){
        session.setAttribute("pass", id);
        System.out.println(id+"  로그인성공 \n");
    }else{
        System.out.println(id+"   로그인실패 \n");
        session.setAttribute("", id);
        session.removeAttribute("pass");
    }

    //메인페이지
    response.sendRedirect("movieList.jsp");
%>
</body>
</html>

<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"   %>
<%@ include file="ssi.jsp" %>

<html>
<head>
    <title>Title</title>
</head>

<body>
<%
    String id = request.getParameter("UID");
    String pwd = request.getParameter("UPWD");
    Gtotal=0;
    try{
        msg="select name, count(*) as cnt from userInfo where userid =? and pwd =? group by name";
        PST=CN.prepareStatement(msg);
        PST.setString(1, id);
        PST.setString(2, pwd);
        RS=PST.executeQuery();


    }catch(Exception ex){ }
    if(RS.next()==true){
        Gtotal=RS.getInt("cnt");
        name= RS.getString("name");

        System.out.println(1);

    }
    if(Gtotal>0){

        session.setAttribute("pass", id);
        session.setAttribute("name", name);

//        System.out.println(id+"  로그인성공 \n");
//        response.sendRedirect("movieList.jsp");

%>

    <h1 align="center"><%=name%>님 로그인 성공!</h1> <br>
    <div class="col text-center">
        <button align="center" class="btn btn-primary" onclick="location.href='movieList.jsp'" >메인 페이지로 가기</button>

    </div>

<%
    }else{
        System.out.println(id+"   로그인실패 \n");

//        myAlert();

        PrintWriter writer = response.getWriter();
        writer.println("<script type='text/javascript'>");
        writer.println("alert('아이디 또는 비밀번호가 일치하지 않습니다.');");
        writer.println("location.href='login.jsp'");
        writer.println("</script>");

        session.setAttribute("", id);
        session.removeAttribute("pass");
        session.removeAttribute("name");
        writer.flush();


    }
    //response.sendRedirect("login.jsp");

    //메인페이지
//    response.sendRedirect("movieList.jsp");

%>
</body>
</html>



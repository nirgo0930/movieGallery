<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="ssi.jsp" %>
<html>
<head>
  <title>SignupSave</title>
</head>
<body>

<%
  String overlap = request.getParameter("overlap");
  if(overlap.equals("true")){
    String id = request.getParameter("uid");
    String pwd = request.getParameter("pwd");
    String uname = request.getParameter("uname");
    String phone = request.getParameter("phone");

    try{
      msg="insert into userinfo (userid, pwd, name, phone) values (?,?,?,?)";
      PST=CN.prepareStatement(msg);
      PST.setString(1, id);
      PST.setString(2, pwd);
      PST.setString(3, uname);
      PST.setString(4, phone);
      RS=PST.executeQuery();
      response.sendRedirect("login.jsp");
    }catch(Exception ex){ }
  }
  else{
    PrintWriter writer = response.getWriter();
    writer.println("<script type='text/javascript'>");
    writer.println("alert('중복체크 필요');");
    writer.println("location.href='signup.jsp'");
    writer.println("</script>");
    writer.flush();
  }

%>
</body>
</html>

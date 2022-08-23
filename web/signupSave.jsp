<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="ssi.jsp" %>
<html>
<head>
  <title>SignupSave</title>
  <script src="./js/InputJS.js"></script>
</head>
<body>

<%
  String id = request.getParameter("uid");
  String pwd = request.getParameter("pwd");
  String uname = request.getParameter("uname");
  String phone = request.getParameter("phone");
  System.out.println(id + pwd + uname + phone);

//  try{
//    msg="insert into userinfo (userid, pwd, name, phone) values (?,?,?,?)";
//    PST=CN.prepareStatement(msg);
//    PST.setString(1, id);
//    PST.setString(2, pwd);
//    PST.setString(3, uname);
//    PST.setString(4, phone);
//    RS=PST.executeQuery();
//    response.sendRedirect("login.jsp");
//  }catch(Exception ex){ }
%>
</body>
</html>

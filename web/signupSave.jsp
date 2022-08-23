<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="ssi.jsp" %>
<html>
<head>
    <title>SignupSave</title>
  <script src="./js/InputJS.js"></script>
</head>
<body onload="check()">

<%
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
  }catch(Exception ex){ }

  try{
    msg="select count(*) as cnt from userInfo where userid = " + id;
    ST=CN.createStatement();
    RS=PST.executeQuery();
  }catch(Exception ex){ }
  if(RS.next()==true){
    Gtotal=RS.getInt("cnt");
  }
  if(Gtotal>0){
    PrintWriter writer = response.getWriter();
    writer.println("<script type='text/javascript'>");
    writer.println("alert('회원가입 성공!');");
    writer.println("location.href='login.jsp'");
    writer.println("</script>");
    writer.flush();
  }
  else{

  }
%>
</body>
</html>

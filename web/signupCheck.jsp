<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="ssi.jsp" %>

<%
  String data = request.getParameter("userid");
  msg="select count(*) as cnt from userInfo where userid='"+data+"'";
  ST=CN.createStatement();
  RS = ST.executeQuery(msg);
  if(RS.next()==true){  Gtotal=RS.getInt("cnt"); }

  if(Gtotal>0){
%>
|false|
<%
}else{
%>
|true|
<%}%>
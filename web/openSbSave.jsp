<%@ page language="java" contentType="text/html;charset=UTF-8"  %>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="./js/InputJS.js"></script>
    <title> [openSbSave.jsp]</title></head>
<body>
<%
    String data = request.getParameter("userid");
    msg="select count(*) as cnt from userInfo where userid= '"+data+"'";

    ST=CN.createStatement();
    RS = ST.executeQuery(msg);
    if(RS.next()==true){  Gtotal=RS.getInt("cnt"); }

    if(Gtotal>0){
%>
<script type="text/javascript">
    alert('<%=data%>는 이미 사용중입니다.');
    self.close();
    opener.iform.uid.value="<%=data%>";
</script>
<%
}else{
%>
<script type="text/javascript">
    alert('<%=data%>는 사용가능합니다.');
    self.close();
    opener.iform.uid.value="<%=data%>";
    opener.iform.overlap.value="true";
</script>
<%}%>

</body>
</html>


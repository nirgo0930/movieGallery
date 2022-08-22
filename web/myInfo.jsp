<%@ include file="./top.jsp" %>
<%@ include file="ssi.jsp" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id=request.getParameter("id");
    System.out.println(id);
    msg = "select * from userInfo where userid = ?";
    PST=CN.prepareStatement(msg);
    PST.setString(1,id);
    RS = PST.executeQuery();
    RS.next();

%>
<table>
<tr>
    <hr>

    <td>UID:<%=RS.getString("userid")%></td>
</tr>
    <tr>
        <td>PWD:<%=RS.getString("pwd")%></td>
    </tr>
</table>
</body>
</html>



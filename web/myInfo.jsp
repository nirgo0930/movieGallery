<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="./top.jsp" %>
<%@ include file="ssi.jsp" %>

<html>
    <head>
        <title>Title</title>
    </head>
    <style>
        label {
            font-weight: bold;
            font-size: 1.5em;
            color: orange;
        }
    </style>
    <body>
        <%
            String id = request.getParameter("id");
            System.out.println(id);
            msg = "select * from userInfo where userid = ?";
            PST = CN.prepareStatement(msg);
            PST.setString(1, id);
            RS = PST.executeQuery();
            RS.next();

        %>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <label>아이디</label>
                </div>
                <div clas="col-md-9">
                    <%=RS.getString("userid")%>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-3">
                    <label>비밀번호</label>
                </div>
                <div clas="col-md-9">
                    <%=RS.getString("pwd")%>
                </div>
            </div>
            <hr>

            <div class="row">
                <div class="col-md-3">
                    <label>이름</label>
                </div>
                <div clas="col-md-9">
                    <%=RS.getString("name")%>
                </div>
            </div>
            <hr>

            <div class="row">
                <div class="col-md-3">
                    <label>핸드폰 번호</label>
                </div>
                <div clas="col-md-9">
                    <%=RS.getString("phone")%>
                </div>
            </div>
            <hr>

        </div>
    </body>
</html>
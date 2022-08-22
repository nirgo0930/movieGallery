<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="ssi.jsp" %>
<%@ page import="java.util.Date" %>

<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <%
            int mid = Integer.parseInt(request.getParameter("Mid"));
            msg = "select * from movie where Mid = " + mid;
//            ST = CN.createStatement();
//            RS = ST.executeQuery(msg);
//            if (RS.next() == true) {
//                Gtitle = RS.getString("title");
//                Gpay = RS.getInt("pay");
//                Gwdate = RS.getDate("wdate");
//                Gcode = RS.getInt("code");
//            }
        %>
        <%--        value="<%=Gcode%>"--%>
        <form name="myform" method="post" action="movieSave.jsp">
            제목: <input type="text" name="title" id="title"> <br>
            개봉일: <input type="date" name="date" id="pay" placeholder=<%=Gdate%>> <br>
            익명으로 게시<input type="checkbox" name="unknown" id="unknown">
            <br/>
            <input type="submit" value="서브밋수정">
            <input type="reset" value="수정입력취소">
        </form>

        <p>
            <a href="testWrite.jsp">[게시판입력화면]</a>
            <a href="testList.jsp">[게시판전체출력]</a>
            <a href="index.jsp">[index]</a>
    </body>
    </body>
</html>
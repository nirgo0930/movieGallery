<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="ssi.jsp" %>

<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <%

            int mid = Integer.parseInt(request.getParameter("Mid"));
            msg = "select * from movie where Mid = " + mid;
            ST = CN.createStatement();
            RS = ST.executeQuery(msg);
            if (RS.next() == true) {
                Gtitle = RS.getString("title");
                Gpay = RS.getInt("pay");
                Gwdate = RS.getDate("wdate");
                Gcode = RS.getInt("code");
            }
        %>

        <form name="myform" method="get" action="testEditSave.jsp">
            수정코드: <input type="text" name="code" value="<%=Gcode%>" readonly id="code"> <br>
            수정제목: <input type="text" name="title" value="<%=Gtitle%>" id="title"> <br>
            수정급여: <input type="text" name="pay" value="<%=Gpay%>" id="pay"> <br>
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
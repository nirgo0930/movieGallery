<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>

<html>
    <head>
        <title>test</title>
    </head>
    <body>
        <%
            String path = application.getRealPath("./storage");
            System.out.println("공통저장경로 " + path);
            int size = 1024 * 1024 * 7;

            DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();

            MultipartRequest mr = new MultipartRequest(request, path, size, "UTF-8");

            String dimg = mr.getFilesystemName("mImg");
            System.out.println("넘어온파일 = " + dimg + "<p>");
            File ff = mr.getFile("mImg");
            out.println("<h2>" + dimg + " 파일크기는 " + ff.length() + "Byte </h2>");
        %>

    </body>
</html>
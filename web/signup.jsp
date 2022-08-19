<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./top.jsp" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="all" align="center">
    <div class="title">
        <br>
        회원가입

    </div>
    <form name="iform" method="post" enctype="multipart/form-data" action="./signupSave.jsp">
        <table class="table1">
            <tr>
                <th>UID</th>
                <td colspan="2">
                    <input type="text" size="10" name="uid">
                    <input type="button" value="중복확인" onclick="checkUID()">
                </td>
            </tr>
            <tr>
                <th>PWD</th>
                <td colspan="2"><input type="text" name="pwd"></td>
            </tr>
        </table>

        <p>
            <input type="submit" value="회원가입">
            <input type="button" value="취소" onclick="location.href='bbsList.jsp'">
    </form>
</div>

</body>
</html>

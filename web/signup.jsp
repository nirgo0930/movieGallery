<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./top.jsp" %>
<%@ include file="./ssi.jsp" %>
<html>
    <head>
        <title>Title</title>
        <script src="./js/InputJS.js"></script>
    </head>
    <body>
        <div class="all" align="center">
            <div class="title">
                <br>
                회원가입
            </div>
            <form name="iform" action="signupSave.jsp" method="post" enctype="multipart/form-data">
                <table class="table1">
                    <tr>
                        <th>UID</th>
                        <td colspan="2">
                            <input type="text" size="10" name="uid" id="uid">
                            <input type="button" value="중복확인" onclick="checkUID()">
                        </td>
                    </tr>
                    <tr>
                        <th>PWD</th>
                        <td colspan="2"><input type="text" name="pwd" id="pwd"></td>
                    </tr>
                    <tr>
                        <th>성함</th>
                        <td colspan="2"><input type="text" name="uname" id="uname"></td>
                    </tr>
                    <tr>
                        <th>폰번호</th>
                        <td colspan="2"><input type="text" name="phone" id="phone"></td>
                    </tr>
                </table>
                    <input type="submit" value="회원가입">
                    <input type="button" value="취소" onclick="location.href='movieList.jsp'">
            </form>
        </div>

    </body>
</html>
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
            <div class="card bg-info text-light" style="width: 40%">
                <div class="card-body">
                    <h1 class="display-3">회원가입</h1>
                </div>

            <form name="iform" action="signupSave.jsp" method="post">
                <div class="mb-3 mt-3">
                    <div class="input-group mb-3" style="width: 90%">
                        <span class="input-group-text">ID</span>
                        <input class="form-control" style="width: 40%" type="text" size="10" name="uid" id="uid" placeholder="ID 입력">
                        <button class="btn btn-primary" onclick="checkUID()">중복확인</button>
                        <input type="hidden" name="overlap" id="overlap" value="false">
                    </div>
                </div>
                <div class="mb-3 mt-3">
                    <div class="input-group" style="width: 90%">
                        <span class="input-group-text">PASSWORD</span>
                        <input class="form-control"type="password" name="pwd" id="pwd" placeholder="PASSWORD 입력">
                    </div>
                </div>
                <div class="mb-3 mt-3">
                    <div class="input-group" style="width: 90%">
                        <span class="input-group-text">성함</span>
                        <input class="form-control" style="width: 40%" type="text" name="uname" id="uname" placeholder="성함 입력">
                    </div>
                </div>
                <div class="mb-3 mt-3">
                    <div class="input-group" style="width: 90%">
                        <span class="input-group-text">휴대폰번호</span>
                        <input class="form-control" style="width: 40%" type="text" name="phone" id="phone" placeholder="휴대폰 번호 입력">
                    </div>
                </div>
                <button class="btn btn-warning" type="submit">회원가입</button>
                <button class="btn btn-danger" onclick="location.href='movieList.jsp'">취소</button>
            </form>
            </div>
        </div>

    </body>
</html>
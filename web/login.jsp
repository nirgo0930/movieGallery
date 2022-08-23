<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="./top.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <meta name="description" content="html5">
    <meta name="author" content="author">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>로그인 페이지</title>
    <style>
        label{
            margin-bottom:0;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="border rounded-3">
            <form action="loginList.jsp" method="post">
                <div align="center">아이디와 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</div>
                <hr>
                <div class="row">
                    <div class="col-md-1 offset-md-4">

                        <label class="form-label">아이디</label>
                    </div>
                    <div class="col-md-3">
                            <input type="text" name="userID" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1 offset-md-4">

                        <label class="form-label">패스워드</label>
                    </div>
                    <div class="col-md-3">
                        <input type="password" name="pwd" class="form-control">
                    </div>
                </div>
                <br>
                <div class="col-md-4 offset-md-4">
                    <button type="submit" class="btn btn-primary col-md-12" id="logIN">로그인</button>
                </div>

            </form>

    </div>


</div>
</body>
</html>

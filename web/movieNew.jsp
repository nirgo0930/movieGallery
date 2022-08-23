<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="ssi.jsp" %>
<%@ include file="top.jsp" %>

<html>
    <head>
        <title>Add Movie</title>
    </head>
    <body>
        <%
            try {
                String tempId = session.getAttribute("pass").toString();
                if (tempId == "") {
        %>
        <script>
            alert("로그인 이후 사용해 주세요.");
            location.href = "login.jsp";
        </script>
        <%
            }
        } catch (Exception e) {
        %>
        <script>
            alert("로그인 이후 사용해 주세요.");
            location.href = "login.jsp";
        </script>
        <%
            }
        %>
        <div class="container">
            <div class="border rounded-3" style="padding: 20px">
                <form class="row g-3" method="post" enctype="multipart/form-data" action="movieSave.jsp">
                    <div class="col-md-12">
                        <label for="title" class="form-label">제목</label>
                        <input type="text" class="form-control" id="title" name="title">
                    </div>
                    <div class="col-md-6">
                        <label for="title" class="form-label">영화제목</label>
                        <input type="text" class="form-control" id="mTitle" name="mTitle">
                    </div>
                    <div class="col-md-6">
                        <label for="openDate" class="form-label">개봉일</label>
                        <input type="date" class="form-control" id="openDate" name="openDate">
                    </div>
                    <div class="col-6">
                        <label for="actor" class="form-label">출연 배우</label>
                        <input type="text" class="form-control" id="actor" name="actor"
                               placeholder="김길동, 홍길동, 우영우 ( ' , ' 로 구분해서 입력)">
                    </div>
                    <div class="col-6">
                        <label for="mImg" class="form-label">대표 이미지</label>
                        <input type="file" class="form-control" id="mImg" name="mImg">
                    </div>
                    <div class="col-12">
                        <label for="content" class="form-label">내용 설명</label>
                        <textarea class="form-control" id="content" name="content"
                                  rows="20" style="overflow: scroll; resize: none"></textarea>
                    </div>
                    <div class="col-md-3 offset-md-7">
                        <div class="form-check">
                            <label class="form-check-label" for="unknown"> 익명 게시 여부 </label>
                            <input class="form-check-input" type="checkbox" id="unknown" name="unknown"
                                   value="isUnknown">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-primary" value="등록">등록</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="ssi.jsp" %>
<%@ page import="java.util.Date" %>
<%@ include file="top.jsp" %>


<html>
    <head>
        <title>Title</title>
        <%

        %>
    </head>
    <body>

        <div class="container">
            <div class="border rounded-3" style="padding: 20px">
                <form class="row g-3" name="myform" method="post" action="movieSave.jsp">
                    <div class="col-md-6">
                        <label for="title" class="form-label">제목</label>
                        <input type="text" class="form-control" id="title">
                    </div>
                    <div class="col-md-6">
                        <label for="openDate" class="form-label">개봉일</label>
                        <input type="date" class="form-control" id="openDate">
                    </div>
                    <div class="col-6">
                        <label for="actor" class="form-label">출연 배우</label>
                        <input type="text" class="form-control" id="actor"
                               placeholder="김길동, 홍길동, 우영우 ( ' , ' 로 구분해서 입력)">
                    </div>
                    <div class="col-6">
                        <label for="mImg" class="form-label">대표 이미지</label>
                        <input type="text" class="form-control" id="mImg"
                               placeholder="김길동, 홍길동, 우영우 ( ' , ' 로 구분해서 입력)">
                    </div>
                    <div class="col-12">
                        <label for="content" class="form-label">내용 설명</label>
                        <textarea class="form-control" id="content"
                                  rows="20" style="overflow: scroll; resize: none"></textarea>
                    </div>
                    <div class="col-md-6">
                        <label for="inputCity" class="form-label">City</label>
                        <input type="text" class="form-control" id="inputCity">
                    </div>
                    <div class="col-md-4">
                        <label for="inputState" class="form-label">State</label>
                        <select id="inputState" class="form-select">
                            <option selected>Choose...</option>
                            <option>...</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label for="inputZip" class="form-label">Zip</label>
                        <input type="text" class="form-control" id="inputZip">
                    </div>
                    <div class="col-12">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="gridCheck">
                            <label class="form-check-label" for="gridCheck">
                                익명 게시 여부
                            </label>
                        </div>
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">Sign in</button>
                    </div>
                </form>
            </div>
        </div>

    </body>
    </body>
</html>
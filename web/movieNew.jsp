<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="ssi.jsp" %>
<%@ include file="top.jsp" %>


<html>
    <head>
        <title>Add Movie</title>
    </head>
    <body>

        <div class="container">
            <div class="border rounded-3" style="padding: 20px">
                <form class="row g-3" method="post" enctype="multipart/form-data" action="movieSave.jsp">
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
                        <input type="file" class="form-control" id="mImg" name="mImg">
                    </div>
                    <div class="col-12">
                        <label for="content" class="form-label">내용 설명</label>
                        <textarea class="form-control" id="content"
                                  rows="20" style="overflow: scroll; resize: none"></textarea>
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
                        <button type="submit" class="btn btn-primary" value="등록">등록</button>
                    </div>
                </form>
            </div>
        </div>

    </body>
    </body>
</html>
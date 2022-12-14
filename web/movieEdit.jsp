<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="ssi.jsp" %>
<%@ include file="top.jsp" %>

<html>
    <head>
        <title>Edit Movie</title>
    </head>
    <body>
        <%
            try {
                String tempId = (String) session.getAttribute("pass");
                System.out.println(tempId + "/" + request.getParameter("isWriter"));

                if (tempId == "" || tempId == null) {
        %>
        <script>
            alert("로그인 이후 사용해 주세요.");
            location.href = "login.jsp";
        </script>
        <%
        } else if (request.getParameter("isWriter").equals(false)) {
        %>
        <script>
            alert("글 작성자만 수정 가능합니다.")
            location.href = "movieList.jsp";
        </script>
        <%
            }
        } catch (Exception e) {
            System.out.println(e);
        %>
        <script>
            alert("Error");
            location.href = "movieList.jsp";
        </script>
        <%
            }
        %>

        <%
            //testDetail.jsp 한건상세는 조건 code값으로 조회, 단독실행하면안됨
            pId = request.getParameter("Pid");
            msg = "select * from MovieRecommend where Pid = " + pId;
            System.out.println("movieEdit.jsp 상세문서 " + msg);
            ST = CN.createStatement(); //명령어생성
            RS = ST.executeQuery(msg); //생성된명령 ST에 쿼리문을 실행해서 결과를 RS기억해요
            if (RS.next() == true) {
                uid = RS.getString("userid");
                isUnknown = RS.getString("userInfo").equals("1") ? true : false;
                pTitle = RS.getString("title");
                mTitle = RS.getString("Mtitle");
                mDate = RS.getDate("OpenDate");
                mActors = RS.getString("MainActor");
                mImage = RS.getString("movieImage");
                mContent = RS.getString("content");
            }

        %>
        <div class="container">
            <div class="border rounded-3" style="padding: 20px">
                <form class="row g-3" method="post" enctype="multipart/form-data" action="movieSave.jsp">
                    <input type="text" hidden id="pId" name="pId" value="<%=pId%>">
                    <div class="col-md-12">
                        <label for="title" class="form-label">제목</label>
                        <input type="text" class="form-control" id="title" name="title" value="<%=pTitle%>">
                    </div>
                    <div class="col-md-6">
                        <label for="mTitle" class="form-label">영화제목</label>
                        <input type="text" class="form-control" id="mTitle" name="mTitle" value="<%=mTitle%>">
                    </div>
                    <div class="col-md-6">
                        <label for="openDate" class="form-label">개봉일</label>
                        <input type="date" class="form-control" id="openDate" name="openDate" value="<%=mDate%>">
                    </div>
                    <div class="col-6">
                        <label for="actor" class="form-label">출연 배우</label>
                        <input type="text" class="form-control" id="actor" name="actor"
                               placeholder="김길동, 홍길동 ( ' , ' 로 구분해서 입력)"
                               value="<%=mActors%>">
                    </div>
                    <div class="col-6">
                        <label for="mImg" class="form-label">대표 이미지</label>
                        <input type="file" class="form-control" id="mImg" name="mImg"
                               value="<%=mImage %>">
                    </div>
                    <div class="col-12">
                        <label for="content" class="form-label">내용 설명</label>
                        <textarea class="form-control" id="content" name="content"
                                  rows="20" style="overflow: scroll; resize: none"><%=mContent %></textarea>
                    </div>
                    <div class="col-md-3 offset-md-7">
                        <div class="form-check">
                            <label class="form-check-label" for="unknown"> 익명 게시 여부 </label>
                            <input class="form-check-input" type="checkbox" id="unknown" name="unknown"
                                   value="isUnknown"
                                <% if (isUnknown) {%>
                                   checked
                                <%}%>
                            >
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
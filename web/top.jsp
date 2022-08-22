<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="css/style.css">

<div>
    <nav id="topMenu">
        <ul>
            <li><a class="menuLink" href="movieList.jsp">메인 페이지</a></li>
            <li><a class="menuLink" href="">글 등록</a></li>
            <li><a class="menuLink" href="">포스터 리스트</a></li>
            <li><a class="menuLink" href="signup.jsp">회원 가입</a></li>

            <%
                String user = (String) session.getAttribute("pass");

                //로그아웃 되어있을 때
                if (user == null || user == "") {
            %>
            <li style="float:right"><a class="menuLink" href="login.jsp">login</a></li>
            <%
                //로그인 되어있을 때
            } else {

            %>
            <li><a class="menuLink" href="myInfo.jsp?id=<%=user%>">내 정보</a></li>

            <li style="float:right"><%= user %>님 반갑습니다.</li>
            <li style="float:right"><a class='menuLink' href="logout.jsp">logout</a></li>
            <% } %>
        </ul>
    </nav>
</div>
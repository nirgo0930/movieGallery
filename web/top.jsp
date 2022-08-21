<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
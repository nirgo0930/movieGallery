<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" type="text/css" href="css/style.css">

<div>
    <nav id="topMenu">
        <ul>
            <li><a class="menuLink" href="movieList.jsp">메인 페이지</a></li>
            <%
                String user = (String) session.getAttribute("pass");

                //로그아웃 되어있을 때
                if (user == null || user == "") {
            %>
            <li style="float:right"><a class="menuLink" href="login.jsp">login</a></li>
            <%
                //로그인 되어있을 때
            } else {
                //String session1=session;

                //String id=session.getAttribute("")
                //System.out.println(session);
            %>
            <li><a class="menuLink" href="myInfo.jsp?id=<%=user%>">내 정보</a></li>

            <li style="float:right"><%= user %>님 반갑습니다.</li>
            <li style="float:right"><a class='menuLink' href="logout.jsp">logout</a></li>
            <% } %>
        </ul>
    </nav>
</div>
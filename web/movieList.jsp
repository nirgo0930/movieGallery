<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="ssi.jsp" %>

<html>
    <head>
        <title>Movie List</title>
    </head>
    <body>
        <%@ include file="./top.jsp" %>
        <div class="container">
            <form action="movieList.jsp">
                <div class="input-group mb-3">
                    <select class="form-select" name="keyfield">
                        <option>제목</option>
                        <option>영화배우</option>
                    </select>
                    <input class="form-inline w-75" type="text" name="keyword"/>
                    <button type="submit" class="btn btn-primary">검색</button>
                </div>
            </form>
            <%
                msg = "select count(*) as cnt from movieRecommend";
                ST = CN.createStatement();
                RS = ST.executeQuery(msg);
                if (RS.next()) {
                    Mtotal = RS.getInt("cnt");
                }
            %>
            <%
                int rowstart = 0, rowend = 0, pageNUM = 1, pagecount = 0, tmp = 0, startpage = 1, endpage = 10, maxContent = 5;
                String searchQuery, searchKey, searchVal, pnum = "";

                searchKey = request.getParameter("keyfield");
                searchVal = request.getParameter("keyword");

                if (searchKey == "" || searchVal == "" || searchKey == null || searchVal == null || searchKey.equals("")) {
                    searchKey = "";
                    searchVal = "";
                    searchQuery = " where title like '%%' ";
                } else {
                    if (searchKey.equals("제목")) searchKey = "title";
                    if (searchKey.equals("영화배우")) searchKey = "mainActor";
                    searchQuery = " where " + searchKey + " like '%" + searchVal + "%'";
                }


                pnum = request.getParameter("pageNum");
                if (pnum == null || pnum == "" || pnum.equals("")) {
                    pnum = "1";
                }
                pageNUM = Integer.parseInt(pnum);
                rowstart = (pageNUM - 1) * maxContent + 1;
                rowend = pageNUM * maxContent;

                if (Mtotal % maxContent == 0) {
                    pagecount = (Mtotal / maxContent);
                } else {
                    pagecount = (Mtotal / maxContent) + 1;
                }
                tmp = (pageNUM - 1) % 10;
                startpage = (pageNUM - tmp);
                endpage = (startpage + 9);
                if (endpage > pagecount) {
                    endpage = pagecount;
                }
            %>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <td>번호</td>
                        <td>사진</td>
                        <td>제목</td>
                        <td>조회수</td>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String a = "select * from ( ";
                        String b = "select rownum rn, m.* from ";
                        String y = "(select * from movieRecommend" + searchQuery + ") m";
                        String c = " ) where rn  between " + rowstart + " and " + rowend;
                        msg = a + b + y + c;

                        ST = CN.createStatement();
                        RS = ST.executeQuery(msg);
                        while (RS.next()) {

                            int tempNum = RS.getInt("rn");
                            String tempImg = RS.getString("movieImage");
                            String tempPId = RS.getString("Pid");
                            String tempTitle = RS.getString("title");
                            int tempCnt = RS.getInt("viewcnt");
                            int tempComCnt = 0;
                    %>
                    <tr>
                        <td><%= tempNum%>
                        </td>
                        <td>
                            <img src="images/<%= tempImg%>" width="100" height="150">
                        </td>
                        <td>
                            <a href="movieDetail.jsp?Pid=<%=tempPId %>">
                                <%
                                    msg = "select count(*) as cnt from Mcomment where Pid = " + tempPId;

                                    ST = CN.createStatement();
                                    ResultSet tempRS = ST.executeQuery(msg);
                                    if (tempRS.next()) {
                                        tempComCnt = tempRS.getInt("cnt");
                                    }
                                %>
                                <%=tempTitle%> (<%=tempComCnt%>)
                            </a>
                        </td>
                        <td><%= tempCnt%>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <div class="row">
                <div class="col"></div>
                <div class="col">
                    <ul class="pagination">
                        <%
                            if (startpage > 10) {
                                out.println("<li class=\"page-item\"><a class=\"page-link\" href=movieList.jsp?pageNum=" + (startpage - 10) + ">[이전]</a></li>");
                            }
                            for (int i = startpage; i <= endpage; i++) {
                                if (i == pageNUM) {
                                    out.println("<li class=\"page-item active\"><a class=\"page-link\" href=movieList.jsp?pageNum=" + i + ">" + i + "</a></li>");
                                } else {
                                    out.println("<li class=\"page-item\"><a class=\"page-link\" href=movieList.jsp?pageNum=" + i + ">" + i + "</a></li>");
                                }
                            }
                            if (endpage < pagecount) {
                                out.println("<li class=\"page-item\"><a class=\"page-link\" href=movieList.jsp?pageNum=" + (startpage + 10) + ">[다음]</a></li>");
                            }
                        %>
                    </ul>
                </div>
                <div class="col"></div>

            </div>
        </div>
    </body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="ssi.jsp" %>

<html>
    <head>
        <title>Movie List</title>
    </head>
    <body>
        <%@ include file="./top.jsp" %>
        <div class="container">
            <%
                msg = "select count(*) as cnt from movieRecommend";
                ST = CN.createStatement();
                RS = ST.executeQuery(msg);
                if (RS.next()) {
                    Mtotal = RS.getInt("cnt");
                }
            %>

            <%
                int rowstart = 0, rowend = 0, pageNUM = 1, pagecount = 0, tmp = 0, startpage = 1, endpage = 10, maxContent = 12;
                String pnum = "";

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
                tmp = (pageNUM - 1) % maxContent;
                startpage = (pageNUM - tmp);
                endpage = (startpage + 9);
                if (endpage > pagecount) {
                    endpage = pagecount;
                }
            %>

            <div class="border rounded-3 row g-3" style="padding: 20px">
                <%
                    String a = "select * from ( ";
                    String b = "select rownum rn, m.* from movieRecommend m";
                    String c = ") where rn  between " + rowstart + " and " + rowend;
                    msg = a + b + c;

                    ST = CN.createStatement();
                    RS = ST.executeQuery(msg);
                    while (RS.next()) {
                %>

                <div class="col-md-3">
                    <a href="postImgDownload.jsp?Pid=<%= RS.getString("Pid")%>&src=<%=RS.getString("movieImage")%>">
                        <img src="images/<%=RS.getString("movieImage")%>" width="100" height="150">
                    </a>
                    <br/>
                    <%=RS.getString("Mtitle")%>
                </div>

                <% } %>
            </div>

            <div class="row">
                <div class="col"></div>
                <div class="col">
                    <ul class="pagination">
                        <%
                            if (startpage > 10) {
                                out.println("<li class=\"page-item\"><a class=\"page-link\" href=postList.jsp?pageNum=" + (startpage - 10) + ">[이전]</a></li>");
                            }
                            for (int i = startpage; i <= endpage; i++) {
                                if (i == pageNUM) {
                                    out.println("<li class=\"page-item active\"><a class=\"page-link\" href=postList.jsp?pageNum=" + i + ">" + i + "</a></li>");
                                } else {
                                    out.println("<li class=\"page-item\"><a class=\"page-link\" href=postList.jsp?pageNum=" + i + ">" + i + "</a></li>");
                                }
                            }
                            if (endpage < pagecount) {
                                out.println("<li class=\"page-item\"><a class=\"page-link\" href=postList.jsp?pageNum=" + (startpage + 10) + ">[다음]</a></li>");
                            }
                        %>
                    </ul>
                </div>
                <div class="col"></div>

            </div>
        </div>
    </body>
</html>
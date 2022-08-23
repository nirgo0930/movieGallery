<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="ssi.jsp" %>
<%@ include file="top.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>movieDetail</title>
        <style>
            .bold {
                font-size: 18px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>

        <%
            //movieDetail.jsp 한건상세는 조건 code값으로 조회, 단독실행하면안됨
            pId = request.getParameter("Pid");
            msg = "select * from MovieRecommend where Pid = " + pId;
            System.out.println("movieDetail.jsp상세문서 " + msg);
            ST = CN.createStatement(); //명령어생성
            RS = ST.executeQuery(msg); //생성된명령 ST에 쿼리문을 실행해서 결과를 RS기억해요
            if (RS.next()) {
                uid = RS.getString("userid");
                pTitle = RS.getString("title");
                mTitle = RS.getString("Mtitle");
                mDate = RS.getDate("OpenDate");
                mActors = RS.getString("MainActor");
                isUnknown = RS.getString("userInfo").equals("1") ? true : false;
                mContent = RS.getString("content");
                mImage = RS.getString("movieImage");
                pDate = RS.getDate("Pdate");
                pViewCnt = RS.getInt("viewCnt");
            }

            String tempUID = uid;
            if (isUnknown) {
                tempUID = "익명";
            }
        %>

        <%
            pViewCnt++;
            msg = "UPDATE movieRecommend SET viewCnt =" + pViewCnt + " WHERE pid=" + pId;
            ST = CN.createStatement(); //명령어생성
            RS = ST.executeQuery(msg); //생성된명령 ST에 쿼리문을 실행해서 결과를 RS기억해요
            if (RS.next()) {
                System.out.println(pId + "조회수 증가");
            }
        %>

        <p></p>
        <table width="900" border="1" cellspacing="0" cellpadding="7" align="center">
            <tr align="center">
                <td colspan="2">
                    제목: <%=pTitle%>
                </td>
            </tr>

            <tr>
                <td rowspan="6" align="center">
                    <img src="images/<%=mImage%>" width="400" height="500">
                </td>
            </tr>

            <tr>
                <td> 게시일: <%=pDate%> / 유저: <%=tempUID%>
                </td>
            </tr>
            <tr>
                <td> 영화제목: <%=mTitle%>
                </td>
            </tr>
            <tr>
                <td> 배우: <%=mActors%>
                </td>
            </tr>
            <tr>
                <td> 개봉일: <%=mDate%>
                </td>
            </tr>
            <tr>
                <%
                    msg = "SELECT AVG(rate) as avg FROM mComment where Pid=" + pId;
                    ST = CN.createStatement();
                    RS = ST.executeQuery(msg);
                    double avg = 0;
                    if (RS.next()) {
                        avg = RS.getDouble("avg");
                    }

                %>
                <td> 평점 평균: <%=avg%>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <p class="bold">내용</p> <%=mContent%>
                </td>
            </tr>

            <tr>
                <td colspan="2"><p class="bold"> 댓글 </p></td>
            </tr>
            <tr>
                <td colspan="2">
                    <form method="post" action="commentSave.jsp">
                        <input type="hidden" name="postId" value=<%=pId%>>
                        <input type="text" name="inputComment" size="55">
                        평점 :
                        <select name="rate">
                            <option key="1" value="1">1</option>
                            <option key="2" value="2">2</option>
                            <option key="3" value="3">3</option>
                            <option key="4" value="4">4</option>
                            <option key="5" value="5">5</option>
                        </select>
                        익명 :
                        <input type="checkbox" name="cIsUnknownCheck">
                        <input type="submit" value="댓글 등록" }>
                    </form>
                </td>
            </tr>

            <%
                msg = "select * from Mcomment where Pid = " + pId;
                ST = CN.createStatement();
                RS = ST.executeQuery(msg);
                while (RS.next()) {
                    //pId = RS.getString("Pid");
                    cIsUnknown = RS.getString("userInfo").equals("1") ? true : false;
                    comment = RS.getString("cContent");
                    cuId = RS.getString("cuId");
                    rate = RS.getDouble("rate");

                    String tempCUID = cuId;
                    if (cIsUnknown) {
                        tempCUID = "익명";
                    }
            %>
            <tr>
                <td><%=comment%>
                </td>
                <td> 유저 : <%=tempCUID%> 평점 : <%=rate%>
                </td>
            </tr>
            <%
                }
            %>

            <tr align="center">
                <td colspan="2">
                    <a href="movieEdit.jsp?Pid=<%=pId%>">[수정]</a>
                    <a href="movieDeleteSave.jsp?Pid=<%=pId%>">[삭제]</a>
                    <a href="movieList.jsp">[목록]</a>
                </td>
            </tr>
        </table>
        <p></p>
    </body>
</html>
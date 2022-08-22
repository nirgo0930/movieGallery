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
            //testDetail.jsp 한건상세는 조건 code값으로 조회, 단독실행하면안됨
            pId = request.getParameter("Pid");
            msg = "select * from MovieRecommend where Pid = " + pId;
            System.out.println("movieDetail.jsp상세문서 " + msg);
            ST = CN.createStatement(); //명령어생성
            RS = ST.executeQuery(msg); //생성된명령 ST에 쿼리문을 실행해서 결과를 RS기억해요
            if (RS.next() == true) {
                uid = RS.getString("userid");
                pTitle = RS.getString("title");
                mTitle = RS.getString("Mtitle");
                mDate = RS.getDate("OpenDate");
                mActors = RS.getString("MainActor");
                isUnkown = RS.getString("userInfo").equals("1") ? true : false;
                mContent = RS.getString("content");
                mImage = RS.getString("movieImage");
                pDate = RS.getDate("Pdate");
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
                    <img src="images/<%=mImage%>.jpg" width="400" height="500">
                </td>
            </tr>

            <tr>
                <td> 게시일: <%=pDate%> / 유저: <%=uid%> 익명여부 관리 해야함</td>
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
                <td> 평점 평균: (AVG) 계산할것</td>
            </tr>


            <tr>
                <td colspan="2">
                    <p class="bold">내용</p> <%=mContent%> <!-- <br> 최고의 영화 추천합니다. -->
                </td>
            </tr>

            <tr>
                <td colspan="2"><p class="bold"> 댓글 </p></td>
            </tr>
            <tr>
                <td> (comment) 저도 꼭 봐야겠어요~</td>
                <td> (날짜 2022~~) (유저id/익명) (평점 1~5)</td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <a href="movieEdit.jsp?Pid=<%=pId%>">[수정]</a>
                    <a href="movieDeleteSave.jsp">[삭제]</a>
                    <a href="movieList.jsp">[목록]</a>
                </td>
            </tr>
        </table>
    </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>movieDetail</title>
    </head>
    <body>
        <p/>
        <table width="900" border="1" cellspacing="0" cellpadding="7">
            <tr align="center">
                <td colspan="2">
                    movieDetail.jsp (제목을 여기다가 달까 고민중)
                </td>
            </tr>

            <tr>
                <td rowspan="5" align="center"><img src="images/pic6.png" width="500" height="300"></td>
                <td width="400"> 번호:(Mid)</td>
            </tr>

            <tr>
                <td> 제목: (title)</td>
            </tr>
            <tr>
                <td> 배우: (MainActor)</td>
            </tr>
            <tr>
                <td> 날짜: (date)</td>
            </tr>
            <tr>
                <td> 유저: (Uid/익명)</td>
            </tr>

            <tr>
                <td colspan="2"><h3>내용</h3> ~~~~~~~~~~~~~~~~(content)~~~~~~~~~~~~~~~~ <br> 최고의 영화 추천합니다.</td>
            </tr>

            <tr>
                <td colspan="2"><h3>댓글</h3> (comment) 저도 꼭 봐야겠어요~ <p align="right"> 유저id/익명 </p></td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <a href="movieEdit.jsp">[수정]</a>
                    <a href="insertMovie.jsp">[글쓰기]</a>
                    <a href="movieDeleteSave.jsp">[삭제]</a>
                    <a href="index.jsp">[index]</a>
                    <a href="movieList.jsp">[목록]</a>
                </td>
            </tr>
        </table>
    </body>
</html>
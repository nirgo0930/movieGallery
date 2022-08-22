<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="ssi.jsp" %>

<html>
<head>
    <title>Movie List</title>
</head>
<body>
<%@ include file="./top.jsp" %>
<%;
    msg = "select count(*) as cnt from movie";
    ST=CN.createStatement();
    RS = ST.executeQuery(msg);
    if(RS.next()){
        Mtotal = RS.getInt("cnt");
    }
%>
<%
    int rowstart = 0, rowend = 0;
    String pnum = "";
    int pageNUM = 1;
    int pagecount = 0;
    int tmp=0, startpage=1, endpage=10;

    pnum =  request.getParameter("pageNum"); //처음실행하면 넘어오는 pageNum값이 없어서 에러발생
    if(pnum==null || pnum=="" || pnum.equals("")){ pnum="1";}
    pageNUM = Integer.parseInt(pnum); //숫자로변신
    rowstart = (pageNUM-1)*10+1 ;
    rowend = pageNUM * 10 ;

    if(Mtotal%10==0){ pagecount=(Mtotal/10); }
    else{ pagecount=(Mtotal/10)+1; }
    tmp = (pageNUM-1)%10;
    startpage = (pageNUM-tmp) ;
    endpage = (startpage+9);
    if(endpage>pagecount){ endpage=pagecount; }
%>
<table>
    <tr align="center">
        <th>번호</th><th>사진</th><th>제목</th><th>조회수</th>
    </tr>
    <%
        String a= "select * from ( ";
        String b= "select rownum rn, m.* from movie m";
        String c= " ) where rn  between " + rowstart  + " and " + rowend ;
        msg=a+b+c;

        ST = CN.createStatement();
        RS = ST.executeQuery(msg);
        while(RS.next()==true){

    %>
    <tr align="center">
        <td> <%= RS.getInt("rn")%> </td>
        <td> <%= RS.getString("poster")%> </td>
        <td> <%= RS.getString("title")%> </td>
        <td> <%= RS.getInt("viewcnt")%> </td>
    </tr>
    <% } %>
    <tr align="center">
        <td colspan="4">
            <%
                if(startpage>10){
                    out.println("<a href=movieList.jsp?pageNum="+(startpage-10)+">[이전]</a>");
                }
                for(int i=startpage; i<=endpage; i++){
                    if(i==pageNUM){
                        out.println("<font style='font-size:24pt; color:blue'>["+i+"]</font>");
                    }else{
                        out.println("<a href=movieList.jsp?pageNum="+i+">["+i+"]</a>");
                    }
                }
                if(endpage<pagecount){
                    out.println("<a href=movieList.jsp?pageNum="+(startpage+10)+">[다음]</a>");
                }
            %>
        </td>
    </tr>
</table>
</body>
</html>
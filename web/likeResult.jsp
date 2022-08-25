<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="ssi.jsp" %>

<%
    String pId = request.getParameter("pId");
    System.out.println("pId=" + pId);

    String sql = "select likeCnt as cnt from movieRecommend where pId=?";
    System.out.println(sql);
    PST = CN.prepareStatement(sql);
    PST.setString(1, pId);
    RS = PST.executeQuery();

    int cnt = 0;
    while (RS.next()) {
        cnt = RS.getInt("cnt");
        System.out.println("좋아요 cnt : " + cnt);
        try {
            String tempId = (String) session.getAttribute("pass");
            System.out.println("cUser = " + tempId);

            if (!(tempId == "" || tempId == null)) {
                msg = "insert into likeOX values(" + pId + ", '" + tempId + "')";
                System.out.println(msg);
                ST = CN.createStatement(); //명령어생성
                ResultSet TRS = ST.executeQuery(msg);
                if (TRS.next()) {
                    msg = "UPDATE movieRecommend SET likeCnt =" + ++cnt + " WHERE pid=" + pId;
                    ST = CN.createStatement(); //명령어생성
                    TRS = ST.executeQuery(msg); //생성된명령 ST에 쿼리문을 실행해서 결과를 RS기억해요
                    if (TRS.next()) {
                        System.out.println(pId + " 좋아요 " + cnt + "증가");
                    }
                }
            } else {

            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
%>
<%=cnt%>
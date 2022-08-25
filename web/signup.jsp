<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./top.jsp" %>
<%@ include file="./ssi.jsp" %>
<html>
    <head>
        <title>Title</title>
        <script src="./js/InputJS.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script type="text/javascript">
            let req=false;

            init=function(){
                try{
                    req=new XMLHttpRequest();
                }catch(e){
                    try{
                        req=new ActiveXObject("Msxml2.XMLHTTP");
                    }catch(e2){
                        req=false;
                    }
                }
                if(!req) alert("req객체 생성 실패");
            }

            getUserId=function(){
                let val=$('#uid').val();
                let url="signupCheck.jsp?userid="+val;
                req.open("GET",url, true);

                req.onreadystatechange=updatePage;
                req.send(null);
            }

            updatePage=function(){
                if(req.readyState==4 && req.status==200){
                    let res=req.responseText;
                    let temp=res.split("|");
                    if(temp[1]=='true'){
                        $('#noUseId').hide(1000);
                        $('#canUseId').show(1000);
                        $('#overlap').val('true');
                    }
                    else{
                        $('#canUseId').hide(1000);
                        $('#noUseId').show(1000);
                    }
                }
            }
            window.onload=init;
        </script>
    </head>
    <body>
        <div class="all" align="center">
            <div class="card style="width: 40%">
                <div class="card-body">
                    <h1 class="display-6">회원가입</h1>
                </div>
            <form name="iform" action="signupSave.jsp" method="post">
                <div class="mb-3 mt-3">
                    <div class="input-group mb-3" style="width: 90%">
                        <span class="input-group-text col-3">ID</span>
                        <input class="form-control col-7" style="width: 40%" type="text" size="10" name="uid" id="uid" placeholder="ID 입력">
                        <button class="btn btn-primary col-2" type="button" onclick="getUserId()">중복확인</button>
                        <input type="hidden" name="overlap" id="overlap" value="false" />
                        <div class="container" id="canUseId" style="display: none">
                            <mark style="color: blue">사용 가능한 ID</mark>
                        </div>
                        <div class="container" id="noUseId" style="display: none">
                            <mark style="color: red">사용 불가능한 ID</mark>
                        </div>
                    </div>
                </div>
                <div class="mb-3 mt-3">
                    <div class="input-group" style="width: 90%">
                        <span class="input-group-text col-3">PASSWORD</span>
                        <input class="form-control col-9"type="password" name="pwd" id="pwd" placeholder="PASSWORD 입력">
                    </div>
                </div>
                <div class="mb-3 mt-3">
                    <div class="input-group" style="width: 90%">
                        <span class="input-group-text col-3">성함</span>
                        <input class="form-control col-9" style="width: 40%" type="text" name="uname" id="uname" placeholder="성함 입력">
                    </div>
                </div>
                <div class="mb-3 mt-3">
                    <div class="input-group" style="width: 90%">
                        <span class="input-group-text col-3">휴대폰번호</span>
                        <input class="form-control col-9" style="width: 40%" type="text" name="phone" id="phone" placeholder="휴대폰 번호 입력">
                    </div>
                </div>
                <button class="btn btn-info" type="submit">회원가입</button>
                <button class="btn btn-secondary" onclick="location.href='movieList.jsp'">취소</button>
            </form>
            </div>
        </div>

    </body>
</html>
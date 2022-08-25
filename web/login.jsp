<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="./top.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <meta name="description" content="html5">
    <meta name="author" content="author">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>로그인 페이지</title>
    <style>
        label{
            margin-bottom:0;
        }
    </style>

    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>


    <script type="text/javascript">
        $(function( ){
            $('#logIN').click( function( ){
                $.ajax({
                    "url"  : "loginList.jsp" ,
                    "type" : "get",  //document.getElementById("userid").value;
                    "data" : {UID: $('#userID').val(), UPWD: $('#pwd').val( )} ,
                    // "beforeSend": function( ){
                    //     $('#loading-mask').show();
                    //     $('#msgIN').empty();
                    //     $('#loading-mask').html("<div align=center><img src='./images/ajax-loader.gif' width=500 height=250></div> ");
                    //     $("#loading-mask").css("opacity","0.9").stop().animate({opacity:3},9000);
                    // },
                    "success": function(data){
                        setTimeout(function() {
                            //$('#loading-mask').fadeOut( );
                            //$('#msgIN').empty();
                            $('#container').html(data);
                        }, 300);
                    },
                    "error": function(data){
                        //$('#loading-mask').fadeOut();
                    }
                });
            });
            //////////////////////////////////////////////////////////////////////////
        });
    </script>

</head>

<body>
<div class="container" id="container">
    <div class="border rounded-3">
            <form action="loginList.jsp" method="get">
                <div align="center">아이디와 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</div>
                <hr>
                <div class="row">
                    <div class="col-md-1 offset-md-4">

                        <label class="form-label">아이디</label>
                    </div>
                    <div class="col-md-3">
                            <input type="text" id="userID" name="userID" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1 offset-md-4">

                        <label class="form-label">패스워드</label>
                    </div>
                    <div class="col-md-3">
                        <input type="password" id="pwd" name="pwd" class="form-control">
                    </div>
                </div>
                <br>
                <div class="col-md-4 offset-md-4">
                    <input type="button" class="btn btn-primary col-md-12" id="logIN" value="로그인"></input>
                </div>

            </form>

    </div>


</div>
</body>
</html>

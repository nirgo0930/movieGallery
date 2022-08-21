<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title> [openSb.jsp]</title>
  <script type="text/javascript">
    function send(){
      subform.userid.value=window.opener.iform.uid.value;
    }
  </script>
</head>

<body onload="send()">
<p>
<div align="center">
  <form name="subform" action="openSbSave.jsp">
    <font>아이디:</font><input type="text" name="userid">
    <input type="submit" value="중복확인">
  </form>

</div>
</body>
</html>






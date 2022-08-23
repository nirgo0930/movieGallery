<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>중복확인</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
          crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
          integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
          crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
          integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
          crossorigin="anonymous"></script>
  <script type="text/javascript">
    function send(){
      subform.userid.value=window.opener.iform.uid.value;
      subform.overlap.value=window.opener.iform.overlap.value;
    }
  </script>
</head>

<body onload="send()">
<p>
<div align="center">
  <form name="subform" action="openSbSave.jsp">
    <div name="subformdiv" class="input-group mb-3" style="width: 90%">
      <span class="input-group-text">ID</span>
      <input class="form-control" style="width: 40%" type="text" name="userid">
      <input type="hidden" name="overlap" value="">
      <button class="btn btn-primary" type="submit">중복확인</button>
    </div>
  </form>

</div>
</body>
</html>






<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
</head>
<body>
   <h1> 로그인 </h1>

<fieldset>
  <legend> SH 로그인 </legend>
  <!-- <form action="/login" method="post"> -->
  <form action="<%=request.getContextPath()%>/signUp/login" method="post">
    ID : <input type="text" name="id"> <br>
    PW : <input type="password" name="pw"> <br>
    <input type="submit" value="로그인">          
    <input type="button" onclick="location.href='signUp/insert'" value="회원가입">          
  </form>  
</fieldset>
</body>
</html>
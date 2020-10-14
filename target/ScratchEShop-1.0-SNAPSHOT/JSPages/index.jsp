<%--
  Created by IntelliJ IDEA.
  User: alemh
  Date: 14.10.2020
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<%@ include file="components/header.jsp"%>
<!--Main Layout-->
<div class="container-fluid" style="margin: 25px;">
    <h1>Login</h1>
    <form action="/login" method="post">
        <input type="text" placeholder="Login" name="login">
        <input type="password" placeholder="Password" name="pass">
        <input type="submit" value="Login">
    </form>
    <a href="JSPages/register.jsp">You are not registered?</a>
</div>
</body>
<%@ include file="components/footer.jsp"%>
</html>

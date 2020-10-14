<%--
  Created by IntelliJ IDEA.
  User: alemh
  Date: 14.10.2020
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
</head>
<%@ include file="components/header.jsp"%>
<div class="container-fluid" style="margin: 25px;">
    <form action="<%=request.getContextPath()%>/registerServlet" method="post">
        <input type="text" placeholder="First Name" name="fname">
        <input type="text" placeholder="Last Name" name="lname">
        <input type="text" placeholder="Login" name="login">
        <input type="password" placeholder="Password" name="pass">
        <input type="submit" value="Register">
    </form>
</div>
<%@ include file="components/footer.jsp"%>
</html>

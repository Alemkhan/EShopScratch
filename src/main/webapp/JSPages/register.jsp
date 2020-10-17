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
<div class="container-fluid" style="padding: 25px;">
    <h1>Register</h1>
    <form class="col-6" action="<%=request.getContextPath()%>/register" method="post">
        <div class="form-group">
            <label for="fname">First Name</label>
            <input type="text" class="form-control" id="fname" placeholder="Enter First Name" name="fname">
        </div>
        <div class="form-group">
            <label for="lname">Last Name</label>
            <input id="lname" type="text" class="form-control" placeholder="Enter Last Name" name="lname">
        </div>
        <div class="form-group">
            <label for="login">Login</label>
            <input type="text" class="form-control" id="login" placeholder="Enter Login" name="login">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" placeholder="Enter Password" name="pass">
        </div>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>
</div>
<%@ include file="components/footer.jsp"%>
</html>

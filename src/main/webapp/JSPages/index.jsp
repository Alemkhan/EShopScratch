<%@ page import="models.PasswordValidator" %><%--
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
<div class="container-fluid" style="padding: 25px;">
    <h1>Login</h1>
    <form action="<%=request.getContextPath()%>/login" method="post" class="col-6">
        <div class="form-group">
            <label for="login">Login:</label>
            <input type="text" class="form-control" id="login" aria-describedby="LoginHelp" placeholder="Enter Login" name="login">
            <small id="LoginHelp" class="form-text text-muted">Please, be attentive to login from the first time</small>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" placeholder="Password" name="pass">
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
    </form>
    <p>
        <%
            PasswordValidator pv = new PasswordValidator();
            out.println(pv.showErrorMessage(request.getParameter("error")));
        %>
    </p>
    <a href="JSPages/register.jsp">You are not registered?</a>
</div>
</body>
<%@ include file="components/footer.jsp"%>
</html>

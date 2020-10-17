<%--
  Created by IntelliJ IDEA.
  User: alemh
  Date: 17.10.2020
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Some Product</title>
</head>
<%@ include file="components/header.jsp"%>
<div class="container-fluid" style="padding: 25px;">

    <%
            for (Cookie cook: myCookies) {
        %><h3><%if (cook.getName().equals("Fname") || cook.getName().equals("Lname")){out.println(cook.getValue());}%></h3><%;
            }
        %>
</div>
<%@ include file="components/footer.jsp"%>
</html>

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
<%
    if(!cc.isSet(myCookies)) {
        response.sendRedirect("index.jsp");
    }
%>
<div class="container-fluid" style="padding: 25px;">
    <div style="display:flex;">
        Hello,
        <c:forEach var="cook" items="${myCookies}">
            <c:if test="${cook.getName().equals('Fname') || cook.getName().equals('Lname')}">
                <c:out value="${cook.getValue()}"/>
            </c:if>
        </c:forEach>
    </div>
</div>
<%@ include file="components/footer.jsp"%>
</html>

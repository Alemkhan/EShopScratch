<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.util.PriorityQueue" %><%--
  Created by IntelliJ IDEA.
  User: alemh
  Date: 18.10.2020
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>
</head>
<%@ include file="components/header.jsp"%>
<%
    if(!cc.isSet(myCookies)) {
        response.sendRedirect("index.jsp");
    }
%>
<div class="container-fluid d-flex" style="padding: 25px;">
    <div class="border border-primary p-4 rounded-bottom">
        <h3>Some Info</h3>
        <%
            //Extracting data of user

            //Look in header.jsp
            String visits = "Total Number of Visits: " + visitsCount;
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String date = "Last visit time: " + dtf.format(now);
            String javaSessionID = null;
            for (Cookie cook: myCookies
            ) {
                if (cook.getName().equals("JSESSIONID")) {
                    javaSessionID = "Your session ID is: " + cook.getValue();
                }
            }

            PriorityQueue<String> userData = new PriorityQueue();
            userData.add(visits);
            userData.add(date);
            userData.add(javaSessionID);


            request.setAttribute("queue", userData);
            if(myCart != null) {
                request.setAttribute("overall",myCart.showPayment());
            }
        %>
        <c:forEach var="data" items="${queue}">
            <p><c:out value="${data}"/></p>
        </c:forEach>
    </div>
    <div class="border border-primary ml-5 p-4 rounded-bottom">
        <h3>Your Cart</h3>
        <div class="col-12 d-flex">
            <c:forEach var="prod" items="${myCart.getProductList()}">
                <div class="card mr-1">
                    <div class="card-body">
                        <b><p class="card-title">Product Name: <br> <c:out value="${prod.getName()}"/></p></b>
                        <i><p class="card-text">Product Price: <br><c:out value="${prod.getPrice()}"/>KZT</p></i>
                    </div>
                </div>
            </c:forEach>
        </div>
        <c:if test="${myCart!=null}">
            <h4>Overall price is  <c:out value="${overall}"/> </h4>
        </c:if>
        <c:if test="${myCart==null}">
            <h4>There is no products in your cart</h4>
        </c:if>
    </div>
</div>
<%@ include file="components/footer.jsp"%>
</html>

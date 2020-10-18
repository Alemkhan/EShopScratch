<%@ page import="models.Product" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.HashMap" %><%--
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
<%
    HashMap<String, Set<Product>> categories = new HashMap();

    HashSet<Product> sportProducts = new HashSet();
    HashSet<Product> electronicProducts = new HashSet();
    HashSet<Product> clothProducts = new HashSet();

    Product ball = new Product("Ball", 15000);
    Product swimmingGoogles = new Product("Swimming Googles", 3300);
    Product skis = new Product("Skis", 20000);
    sportProducts.add(ball);
    sportProducts.add(swimmingGoogles);
    sportProducts.add(skis);

    Product oneplus8 = new Product("OnePlus8", 225000);
    Product lightningCharger = new Product("Lightning Charger", 12000);
    Product a4techMouse = new Product("A4TECH Mouse", 7000);
    electronicProducts.add(oneplus8);
    electronicProducts.add(lightningCharger);
    electronicProducts.add(a4techMouse);

    Product socks = new Product("Socks", 300);
    Product pullover = new Product("Pullover", 5500);
    Product pantsKalvinKlein = new Product("Kalvin Klein Pants", 12000);
    clothProducts.add(socks);
    clothProducts.add(pullover);
    clothProducts.add(pantsKalvinKlein);

    categories.put("Sport", sportProducts);
    categories.put("Electronic", electronicProducts);
    categories.put("Clothes", clothProducts);

    request.setAttribute("products", categories);
    String toShow = request.getParameter("toShow");
    request.setAttribute("toShow", toShow);
%>
<div class="container-fluid" style="padding: 25px;">
    <div>
        <h3>
            Hello,
            <c:forEach var="cook" items="${myCookies}">
                <c:if test="${cook.getName().equals('Fname') || cook.getName().equals('Lname')}">
                    <c:out value="${cook.getValue()}"/>
                </c:if>
            </c:forEach>
        </h3>
    </div>
    <div>
        <h3>We have such categories:</h3>
        <c:if test="${toShow==null}">
            <c:forEach var="cat" items="${products.keySet()}">
                <a href="main-page.jsp?toShow=${cat}" class="btn btn-info" role="button">
                    <c:out value="${cat}"/>
                </a>
            </c:forEach>
        </c:if>
        <c:if test="${toShow!=null}">
            <div class="col-12 d-flex">
                <c:forEach var="prod" items="${products.get(toShow)}">
                    <form action="<%=request.getContextPath()%>/addToCart" method="post" style="width: 250px;" class="card mr-3">
                        <div class="card">
                            <div class="card-body ">
                                <b><p class="card-title">Product Name: <br> <c:out value="${prod.getName()}"/></p></b>
                                <i><p class="card-text">Product Price: <br><c:out value="${prod.getPrice()}"/>KZT</p></i>
                                <button type="submit" class="btn btn-primary">Add to Cart</button>
                                <input type="hidden" name="myProductName" value="${prod.getName()}">
                                <input type="hidden" name="myProductPrice" value="${prod.getPrice()}">
                            </div>
                        </div>
                    </form>
                </c:forEach>
            </div>
        </c:if>
    </div>
</div>
<%@ include file="components/footer.jsp"%>
</html>

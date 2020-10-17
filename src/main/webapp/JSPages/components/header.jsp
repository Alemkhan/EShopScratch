<%@ page import="models.CookieManager" %>
<%--
  Created by IntelliJ IDEA.
  User: alemh
  Date: 14.10.2020
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<body>
<!--Main Navigation-->
<header>

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="#">Boys of the GYM</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">Our Boys <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">Contact <span class="sr-only">(current)</span></a>
                </li>
            </ul>
        </div>
        <%
            Cookie[] myCookies = request.getCookies();
            CookieManager cc = new CookieManager();
            if(cc.isSet(myCookies)) {
        %>
        <form action="<%=request.getContextPath()%>/logout">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Logout</button>
        </form> <%
        }
    %>
    </nav>

</header>
<!--Main Navigation-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!-- for c:out / c:forEach -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- for formatting dates -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
    <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

    <!-- YOUR own local CSS -->
    <link rel="stylesheet" href="<c:out value="/css/style.css" />"/>

    <!-- For any Bootstrap that uses JS or jQuery-->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

    <!-- for local JS -->
    <script type="text/javascript" src="src/main/resources/static/js/app.js"></script>
    <meta charset="ISO-8859-1">

    <title>There...</title>
</head>
<body>
<div class="text-center mt-5" id="main">
    <form:form action="/users/login" method="post" modelAttribute="newLogin">
        <div class="mb-3">
            <h1>Please Sign In</h1>
        </div>
        <div class="mb-3">
            <form:label path="email" for="email" class="visually-hidden">Email address</form:label>
            <form:input class="form-control" type="email" id="email" path="email" placeholder="Email Address" />
            <form:errors class="text-danger" path="email" />
        </div>
        <div class="mb-3">
            <form:label for="password" class="visually-hidden" path="password">Password</form:label>
            <form:input type="password" id="password" placeholder="Password" class="form-control" path="password"/>
            <form:errors class="text-danger" path="password" />
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember"> Remember Me
            </label>
        </div>
        <div class="mt-3">
            <button class="btn btn-outline-primary">Sign In</button>
        </div>
    </form:form>
    <form action="/users/create">
        <div class="mt-3">
            <button class="btn btn-outline-success">Register</button>
        </div>
    </form>
</div>
</body>
</html>
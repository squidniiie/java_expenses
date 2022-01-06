<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <title>PokeBook</title>
<title>PokeBook</title>
</head>
<body>
	<div class="container">
		<h4>ID: ${oneExpense.getId() }</h4>
		<h1>Name: <c:out value="${oneExpense.name}"></c:out></h1>
		<h3>Description: <c:out value="${oneExpense.description}"></c:out></h3>
		<h3>Vendor: <c:out value="${oneExpense.vendor}"></c:out></h3>
		<h4>Amount: <c:out value="${oneExpense.amount}"></c:out></h4>
		<hr />
		<a href="/expenses">back to all expenses</a>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>PokeBook</title>
</head>
<body>
<div class="container shadow p-3 mb-5 bg-white rounded text-center col-6">
<h2>Edit Expenses:</h2>

<form:form action="/expenses/update/${expense.id}" method="POST" modelAttribute="expense">
    <input type="hidden" name="_method" value="PUT"/>
    <p>
        <form:label class="h5" path="name">Name</form:label>
        <br />
        <form:errors path="name"/>
        <br />
        <form:input path="name"/>
    </p>
    <p>
        <form:label class="h5" path="vendor">Vendor</form:label>
        <br />
        <form:errors path="vendor"/>
        <br />
        <form:textarea path="vendor"/>
    </p>
    <p>
        <form:label class="h5" path="amount">Amount</form:label>
        <br />
        <form:errors path="amount"/>
        <br />     
        <form:input type="number" path="amount"/>
    </p>
      <p>
        <form:label class="h5" path="description">Description</form:label>
        <br />
        <form:errors path="description"/>
        <br />
        <form:textarea path="description"/>
    </p> 
    <input class="btn btn-outline-info" type="submit" value="Submit"/>
</form:form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <title>Read Share</title>
<title>PokeBook</title>
</head>
<body>
<div  class="container shadow p-3 mb-5 mt-5 bg-white rounded col-6 text-center">
<h1>PokeBook</h1>

 <table class="container col-5 text-center">
    <thead>
        <tr>
            <th>Name</th>
            <th>Vendor</th>
            <th>Amount</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
     <c:forEach items="${expenseList}" var="expense">
         <tr>
         <td><a href="/expenses/${expense.id}"><c:out value="${expense.name}"></c:out></a></td>
         <td><c:out value="${expense.vendor}"></c:out></td>
         <td><c:out value="${expense.amount}"></c:out></td>
         <td><a class="btn btn-outline-warning" href="/expenses/${expense.id}/edit">Edit</a></td>
         <td><form action="/expenses/${expense.id}" method="post">
    		<input type="hidden" name="_method" value="delete">
    		<input class="btn btn-outline-danger" type="submit" value="Delete">
		</form></td>
         </tr>
         </c:forEach>
    </tbody>
</table>
</div>
<div class="container shadow p-3 mb-5 bg-white rounded col-4 text-center">
<h2>Track an expense:</h2>
<form:form action="/expenses" method="post" modelAttribute="expense">
    <p class="h4">
        <form:label path="name">Name</form:label>
        <br />
        <form:errors path="name"/>
        <br />
        <form:input class=" border-0 shadow form-control form-rounded" path="name"/>
    </p>
    <p class="h4">
        <form:label path="vendor">Vendor</form:label>
        <br />
        <form:errors path="vendor"/>
        <br />
        <form:textarea class=" border-0 shadow form-control form-rounded" path="vendor"/>
    </p>
    
    <p  class="h4">
        <form:label path="amount">Amount</form:label>
        <br />
        <form:errors path="amount"/>
        <br />     
        <form:input class=" border-0 shadow form-control form-rounded" step="any" type="number" path="amount"/>
    </p>
      <p class="h4">
        <form:label path="description">Description</form:label>
        <br />
        <form:errors path="description"/>
        <br />
        <form:textarea class=" border-0 shadow form-control form-rounded" path="description"/>
    </p>
    <br/> 
    <input class="btn btn-outline-info" type="submit" value="Submit"/>
</form:form>
</div>
</body>
</html>
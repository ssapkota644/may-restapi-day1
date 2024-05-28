<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Show All Records</title>
    <style>
        /* CSS styles here */
    </style>
</head>
<body>
    <div class="container">
        <h2>Show All Records</h2>
        <form action="search" method="get">
            <!-- Search form -->
            <input type="text" name="keyword" placeholder="Enter keyword">
            <button type="submit">Search</button>
        </form>
        
        <!-- Display employee records -->
        <table>
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Employee Name</th>
                    <th>Salary</th>
                    <th>Email Address</th>
                    <th>Password</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${employeeDtoList}" var="employee">
                    <tr>
                        <td>${employee.employeeId}</td>
                        <td>${employee.employeeName}</td>
                        <td>${employee.salary}</td>
                        <td>${employee.emailId}</td>
                        <td>${employee.password}</td>
                        <td><a href="editEmployee?employeeId=${employee.employeeId}">Edit</a></td>
                        <td><a href="deleteEmployee?employeeId=${employee.employeeId}" onclick="return confirm('Are you sure you want to delete?')">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Links to navigate -->
        <a href="logout">Logout</a>
    </div>
</body>
</html>

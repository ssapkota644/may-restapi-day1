<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Employees</title>
    <style>
        /* CSS styles here */
    </style>
</head>
<body>
    <div class="container">
        <!-- Search form -->
        <h2>Search Employee</h2>
        <form action="search" method="get">
            <input type="text" name="keyword" placeholder="Enter keyword">
            <button type="submit">Search</button>
        </form>
        
        <!-- Display employee details if found -->
        <c:if test="${not empty employeeDTO}">
            <h3>Search Results</h3>
            <table>
                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Employee Name</th>
                        <th>Salary</th>
                        <th>Email Address</th>
                        <th>Password</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${employeeDTO.employeeId}</td>
                        <td>${employeeDTO.employeeName}</td>
                        <td>${employeeDTO.salary}</td>
                        <td>${employeeDTO.emailId}</td>
                        <td>${employeeDTO.password}</td>
                    </tr>
                </tbody>
            </table>
        </c:if>
        
        <!-- Display message if employee not found -->
        <c:if test="${empty employeeDTO}">
            <p>No employee found with the specified keyword.</p>
        </c:if>

        <!-- Links to navigate -->
        <a href="fetchAllRecords">Back to All Employees</a>
        <a href="logout">Logout</a>
    </div>
</body>
</html>

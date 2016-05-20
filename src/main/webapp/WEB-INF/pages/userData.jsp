<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="joda" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>





<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>User Info</title>
    <style type = "text/css">
        .tg{
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }
        .tg td{
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }
        .tg th{
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

    </style>
</head>
<body>

<br/>
<a href="../../index.jsp">Back to main menu</a>
<br/>

<h1>User Details</h1>

<table class="tg">
    <tr>
        <th width="40">ID</th>
        <th width="140">Name</th>
        <th width="40">Age</th>
        <th width="60">isAdmin</th>
        <th width="140">CreatedDate</th>
    </tr>
    <tr>
        <td>${user.id}</td>
        <td><a href="/userData/${user.id}" target="_blank">${user.name}</a></td>
        <td>${user.age}</td>
        <td>${user.isAdmin}</td>
        <td><joda:formatDate value="${user.date}" pattern="dd-MM-yyyy"/></td>
    </tr>
</table>
</body>
</html>

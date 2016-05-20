<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="joda" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User Page</title>

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
            /*font-weight: normal;*/
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

<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>

<h1>User List</h1>

<c:if test="${!empty AllUsers}">
    <table class="tg">
        <tr>
            <th width="40">ID</th>
            <th width="140">Name</th>
            <th width="40">Age</th>
            <th width="60">isAdmin</th>
            <th width="140">CreatedDate</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td><a href="/userData/${user.id}" target="_blank">${user.name}</a></td>
                <td>${user.age}</td>
                <td>${user.isAdmin}</td>
                <td><joda:formatDate value="${user.date}" pattern="dd-MM-yyyy"/></td>
                <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<br/>

<div id="pagination">
    <c:url value="userList" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="userList" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:url value="userList" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>
</div>

<h1>Add User</h1>

<c:url var="addAction" value="/userList/add"/>

<form:form action="${addAction}" commandName="user">
    <table>
        <c:if test="${!empty user.name}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID:"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="Name">
                    <spring:message text="Name:"/>
                </form:label>
            </td>
            <td>
                <form:input path="Name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="Age">
                    <spring:message text="Age:"/>
                </form:label>
            </td>
            <td>
                <form:input path="Age"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="isAdmin">
                    <spring:message text="isAdmin:"/>
                </form:label>
            </td>
            <td>
                <form:input path="isAdmin"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="Date">
                    <spring:message text="CreatedDate:"/>
                </form:label>
            </td>
            <td>
                <form:input path="Date"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty user.name}">
                    <input type="submit"
                           value="<spring:message text="Edit User"/>"/>
                </c:if>
                <c:if test="${empty user.name}">
                    <input type="submit"
                           value="<spring:message text="Add User"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>

<h1>Find User By Name</h1>

<c:url var="findUser" value="findingUsers"/>
<form:form action="${findUser}" commandName="findingUser">
    <table>
        <tr>
            <td>
                <spring:message text="Enter the name:"/>
                <input type="text" id="txt" name="name" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" name="name"
                       value="<spring:message text="Find Users"/>"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>






















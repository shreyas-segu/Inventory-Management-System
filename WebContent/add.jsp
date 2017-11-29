<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<c:if test="${ param == null}">
	<c:redirect url="addpage.jsp" >
       <c:param name="errMsg" value="Please Enter values" />
	</c:redirect>
</c:if>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
   url = "jdbc:mysql://localhost:3306/IMS"
   user = "root"  password = "admin"/>
<sql:update dataSource="${snapshot}" var="updatedTable">
INSERT INTO item (itemid,name) VALUES (?, ?);
<sql:param value="${param.itemid}" />
<sql:param value="${param.name}" />
</sql:update>
<sql:update dataSource="${snapshot}" var="updatedTable">
INSERT INTO price (itemid,price) VALUES (?,?);
<sql:param value="${param.itemid}" />
<sql:param value="${param.price}" />
</sql:update>
<sql:update dataSource="${snapshot}" var="updatedTable">
INSERT INTO supplier (itemid,suppliername,contact) VALUES (?,?,?);
<sql:param value="${param.itemid}" />
<sql:param value="${param.suppliername}" />
<sql:param value="${param.contact}" />
</sql:update>
<sql:update dataSource="${snapshot}" var="updatedTable">
INSERT INTO stock (itemid,quantity) VALUES (?,?);
<sql:param value="${param.itemid}" />
<sql:param value="${param.quantity}" />
</sql:update>
<c:if test="${updatedTable>=1}">
<c:redirect url="addpage.jsp" >
   <c:param name="susMsg" value="Data inserted successfully." />
</c:redirect>
</c:if> 
</body>
</html>
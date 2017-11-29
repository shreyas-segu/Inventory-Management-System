<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<c:if test="${ param == null}">
	<c:redirect url="deletepage.jsp" >
       <c:param name="errMsg" value="Please Enter values" />
	</c:redirect>
</c:if>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
   url = "jdbc:mysql://localhost:3306/IMS"
   user = "root"  password = "admin"/>
<sql:update dataSource="${snapshot}" var="updatedTable">
DELETE FROM item WHERE itemID=?;
<sql:param value="${param.id}" />
</sql:update>
<c:if test="${updatedTable>=1}">
<c:redirect url="deletepage.jsp" >
   <c:param name="susMsg" value="Data deleted successfully." />
</c:redirect>
</c:if> 
</body>
</html>

<%@page import="com.org.dao.ExpenseDao"%>
<%@page import="com.org.dto.Expenses"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Date date = new Date();
int id=Integer.parseInt(request.getParameter("id"));
ExpenseDao expenseDao=new ExpenseDao();
Expenses e= expenseDao.fetchById(id);
%>
<div class="form">
	<form action="updateexpense" method="post">
Update your expense	<input type="number" name="expense" value="<%=e.getExpense() %>" required="required">
Update Decsription <input type="text" name="description" value="<%=e.getDescription() %>" required="required">
Update Date and time <input type="datetime-local" name="spentdateandtime" value="<%=e.getSpentdateandtime() %>"required="required">
<input type="hidden" value="<%=date%>" name="entrydateandtime">
<input type="hidden" value="<%=e.getId()%>" name="id">
<input type="submit" value="Update">
</form>
</div>
</body>
</html>
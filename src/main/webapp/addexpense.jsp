<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.container {
    max-width: 400px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  
  .container input {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
  }
  
   input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
  
</style>
</head>
<body>

<div class="container">
  <h2>Add Expense</h2>
<div class="form-group">
	<form action="addexpense" method="post">
Add you expense	<input type="number" name="expense" required="required"> <br> <br>
Add Decsription <input type="text" name="description" required="required"> <br> <br>
Date and time <input type="datetime-local" name="spentdateandtime" required="required"> <br> <br>
<input type="hidden" value="<%=new Date()%>" name="entrydateandtime"><br> <br>
<input type="submit" value="Add">
	</form>
</div>
</div>
</body>
</html>
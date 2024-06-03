<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

 body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h2 {
            text-align: center;
        }
        label {
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 3px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
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

button {
	 		width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
}

button:hover {
			background-color: #45a049;
	
}
</style>
</head>
<body>
<div class="container">
<%String message= (String) session.getAttribute("register");
if (message!=null){
%>
<h2 style="color: lime"><%=message %></h2> 

<%} 
session.removeAttribute("register");
%>
   <h2>Expense Tracker Registration</h2>

	<form action="register" method="post">
		
		Enter your name <input type="text" id="name" name="name" required="required"> <br> <br>
		Enter your Age <input type="number" id="age" name="age"required="required"> <br> <br>
		Enter Your E Mail <input type="email" id="email" name="email"required="required"><br> <br>
		Enter your Mobile Number <input type="tel" id="mobile" name="mobile"required="required"><br> <br>
		Enter your Salary <input  type="number" id="salary"  name="salary"required="required"><br> <br>
		Enter Your Salary Credit Date <input type="date" id="salarycreditdate" name="salarycreditdate"required="required"><br> <br>
		Enter Your Password <input type="password" id="password" name="password"required="required"><br> <br>
		Confirm Password <input type="password"id="confirmpassword" name="confirmpassword"required="required"><br> <br>
		<input type="submit" value="Register">
	</form>
	 <a href="login.jsp"><button>Login</button></a>

</div>
</body>
</html>
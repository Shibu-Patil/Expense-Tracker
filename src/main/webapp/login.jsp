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
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f4f4f4;
}

.login-container {
  background-color: #fff;
  padding: 80px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  width: 250px;
}

h1 {
  text-align: center;
  margin-bottom: 20px;
}

h2 {
  text-align: center;
  margin-bottom: 20px;
}

form {
  display: flex;
  flex-direction: column;
  text-align: center;
}

.input-group {
  margin-bottom: 15px;
}

label {
  font-weight: bold;
}

input {
  width: 100%;
  padding: 3px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

input[type="submit"] {
background-color: #007bff;
color: white;
}

input[type="submit"]:hover{
 background-color: #0056b3;
}

button {
  width: 100%;
  padding: 3px;
  border: 1px solid #ccc;
  border-radius: 3px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

button:hover {
  background-color: #0056b3;
}

</style>
</head>
<body>
<div class="login-container">
<%String message=(String) session.getAttribute("login");
if(message!=null){
%>
<h2 style="color: red"><%=message %></h2> 

<%}

	session.removeAttribute("login");

%>
	
    <h1>Expense Tracker</h1>
    <h2>Login</h2>

		
		<form action="login" method="post">
		 <div class="input-group">
		
		Enter Your Email<input type="email" id="username" name="email" required> <br> <br>
		Enter Your Password<input type="password" id="password" name="password" required> <br> <br>
		</div>
		<input type="submit" value="Login" id="submit">
	
		</form>
		<br> <br>	 <a href="register.jsp"><button>Register</button></a>
		</div>
	
</body>
</html>
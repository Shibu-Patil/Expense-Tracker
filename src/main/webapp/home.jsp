<%@page import="com.org.dto.Expenses"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.UserDao"%>
<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

.logout{
width: 300px;
height: 250px;
}
#overlay:target {
  display: block;
}

#overlay {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
}

.overlay-content {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: white;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
  width: 300px;
  height: 150px;
}

#showOverlay {
  margin: 20px;
}

#closeOverlay {
  margin-top: 10px;
}

#closeOverlay button{
width:50px;
padding: 10px;
margin-left: 60px;
margin-top: 10px;
}

 .card {
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 20px;
    margin: 10px;
    width: 200px;
    display: inline-block;
    vertical-align: top;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: #fff;
  }
  
   .navbar {
    background-color: #333;
    overflow: hidden;
    color: white;
  }
  
   .navbar1 {
    background-color: #333;
    overflow: hidden;
    color: white;
    height: 300px;
  }
  
  .navbar h1 {
    text-align: center;
    
  }
  
    
  .navbar h2{
   float: left;
   position: relative;
   left: 50px;
    
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

.add{
	position: relative;
	left: 500px;
  }
</style>
</head>
<body>
<div class="navbar">
 
<%User user=(User)session.getAttribute("login"); 
String update=(String)session.getAttribute("added"); 

%>

<h1>Hello <%=user.getName() %> welcome!!</h1>	

<h2> Your salary is:- <%= user.getSalary() %></h2>


<% if(update !=null){
	%>
	<%=update %>
<%}

	session.removeAttribute("added");

%>

<%
   int id=user.getId();
   UserDao dao=new UserDao();
   User u=dao.fetchById(id);
   long expe=0;
  List<Expenses> list= u.getExpense();
  for(Expenses e : list)
  {
%>
</div>
<div class="card">
<h3>Description- <%=e.getDescription() %> </h3>
<h3> Expenses -<%=e.getExpense() %></h3> 
<a href="updateexpense.jsp?id=<%=e.getId()%>"><button>Update</button></a>
<br>
</div>
<%
expe=expe+e.getExpense();
}%>


<div class="navbar1">

<h2>Your Total Expense is:-<%=expe%></h2> 

<%
long saving;
if(expe!=0){
saving=user.getSalary()-expe;
u.setSaving(saving);
dao.saveAndUpdate(u);}
else {
 saving=user.getSalary();
 u.setSaving(saving);
 dao.saveAndUpdate(u);
}
%>

<h2> Your Savings are:- <%=saving %></h2>




<div class="logout">

<a href="#overlay" id="showOverlay"><button>Logout</button></a>

  <div id="overlay">
    <div class="overlay-content">
      <h2>Do you want to Logout?</h2>
      <a href="logout" id="closeOverlay"><button  style="background-color: red" >Yes</button></a>
      <a href="home.jsp" id="closeOverlay" ><button style="background-color: lime">No</button></a>
    </div>
  </div>
<div class="add"><a href="addexpense.jsp" ><button>Add expense</button></a></div> 
</div>

</div>

</body>
</html>
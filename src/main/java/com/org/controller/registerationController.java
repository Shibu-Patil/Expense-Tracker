package com.org.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.UserDao;
import com.org.dto.User;

@WebServlet("/register")
public class registerationController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		int age =Integer.parseInt(req.getParameter("age"));
		String email = req.getParameter("email");
		long mobile =Long.parseLong(req.getParameter("mobile"));
		long salary =Long.parseLong(req.getParameter("salary"));
		String salarycreditdate =req.getParameter("salarycreditdate");
		String password = req.getParameter("password");
		String confirmpassword = req.getParameter("confirmpassword");
		
		HttpSession session = req.getSession();
		
		
		if (password.equals(confirmpassword))
		{
		
		
		
		User user=new User();
		
		user.setName(name);
		user.setAge(age);
		user.setEmail(email);
		user.setMobile(mobile);
		user.setSalary(salary);
		long saving =salary;
		user.setSaving(saving);
		user.setSalrycreditdate(salarycreditdate);
		user.setPassword(password);
		
	
		
		UserDao userDao = new UserDao();
		userDao.saveAndUpdate(user);
		
			
		session.setAttribute("register", "Registration Succcessfull");	
		resp.sendRedirect("register.jsp");
		}
		
		else {
			
			session.setAttribute("register", "New Password And Confirm Password did not Match");
			resp.sendRedirect("register.jsp");
		}
		
		
	}
}

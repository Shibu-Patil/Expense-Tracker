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

@WebServlet("/login")
public class logincontroller extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
				
		UserDao userDao = new UserDao();
		User user = userDao.fetchbyemailandpassword(email, password);
		
		
		if(user!=null) {
			session.setAttribute("login", user);
			resp.sendRedirect("home.jsp");
		}
		
		else {
			session.setAttribute("login", "Invalid Credentials");
			resp.sendRedirect("login.jsp");
		}
	}
}

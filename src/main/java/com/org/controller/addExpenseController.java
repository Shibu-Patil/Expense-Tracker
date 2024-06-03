package com.org.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.UserDao;
import com.org.dto.Expenses;
import com.org.dto.User;
@WebServlet("/addexpense")
public class addExpenseController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String description = req.getParameter("description");
		long expense =Long.parseLong(req.getParameter("expense"));
		String spentdateandtime = req.getParameter("spentdateandtime");
		String entrydateandtime = req.getParameter("entrydateandtime");
		
		Expenses expenses = new Expenses();
		
		expenses.setExpense(expense);
		expenses.setDescription(description);
		expenses.setSpentdateandtime(spentdateandtime);
		expenses.setEntrydateandtime(entrydateandtime);
		
		List<Expenses> list=new ArrayList<Expenses>();
		list.add(expenses);
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("login");
		
		user.setExpense(list);
		expenses.setUser(user);
		
		UserDao userDao = new UserDao();
		userDao.saveAndUpdate(user);
		
		session.setAttribute("added", "Expense Added");
		resp.sendRedirect("home.jsp");
	}
}

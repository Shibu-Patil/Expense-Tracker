package com.org.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import com.org.dto.Expenses;
import com.org.dto.User;

public class ExpenseDao {
	
	 EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("shubham");
	 EntityManager entityManager = entityManagerFactory.createEntityManager();
	 EntityTransaction transaction = entityManager.getTransaction();
	
 public Expenses fetchById(int id) {
		 
		 Expenses expense = entityManager.find(Expenses.class,id);
		 return expense;
	 }
 
 public boolean deleteById(int id) {
	 
	 Expenses expense = entityManager.find(Expenses.class,id);
	 return true;
 }

}

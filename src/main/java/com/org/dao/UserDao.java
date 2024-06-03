package com.org.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.org.dto.User;

public class UserDao {
	
	 EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("shubham");
	 EntityManager entityManager = entityManagerFactory.createEntityManager();
	 EntityTransaction transaction = entityManager.getTransaction();

	public User saveAndUpdate(User user)
	{
		
		transaction.begin();
		entityManager.merge(user);
		transaction.commit();
		return user;
	}
	
	 public User fetchbyemailandpassword(String email,String password)
	   {
		   
		   
		   Query query = entityManager.createQuery("select u from User u where email=?1 AND password=?2");
		   
		   	query.setParameter(1,email);
			query.setParameter(2,password);
		  List<User> list = query.getResultList();
		
		  if (list.isEmpty())
		  {
			  return null;
		  }
		  
		  else {
			  
		  for (User user : list) {
			  return user;

			  }
		  }
		  return null;
	   }
	 
	 public User fetchById(int id) {
		 
		 User user = entityManager.find(User.class,id);
		 return user;
	 }
}

package com.jaceksysiak.spring.web.dao;

import java.util.List;

import javax.sql.DataSource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
@Component("usersDao")
public class UsersDao {
	 
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	/*public UsersDao(){
		System.out.println("Successfully loaded UsersDao.");
	}*/
	
	@Autowired
	private SessionFactory sessionFactory;
	
 
	
	public Session session(){
		return sessionFactory.getCurrentSession();
	}
 
	@Transactional
	public void create(User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		session().save(user);
	}

	public boolean exists(String username) {
		/*return jdbc.queryForObject("select count(*) from users where username=:username", 
															new MapSqlParameterSource("username", username), 
																								Integer.class) > 0; */
		Criteria crit = session().createCriteria(User.class);
		//crit.add(Restrictions.eq("username", username));  / for any object field
		crit.add(Restrictions.idEq(username));  //for primary kew
		User user = (User) crit.uniqueResult();
		return user != null;
	}


	@SuppressWarnings("unchecked")
	public List<User> getAllUsers() {
		 
		//return jdbc.query("select * from users", BeanPropertyRowMapper.newInstance(User.class));
		
		//to hibernate
		return session().createQuery("from User").list();
	}
	
}




























































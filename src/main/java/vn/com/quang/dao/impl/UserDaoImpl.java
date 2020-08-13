package vn.com.quang.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import vn.com.quang.dao.UserDao;
import vn.com.quang.entity.User;

@Repository
public class UserDaoImpl implements UserDao {

	protected SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public User getUserByUserName(String userName) {
		try {
			List<User> lstRes = new ArrayList<User>();
			String sql = "SELECT * FROM users WHERE USERNAME = :userName AND enabled = 1";

			Session session = this.sessionFactory.getCurrentSession();
			lstRes = ((SQLQuery) session.createSQLQuery(sql).setParameter("userName", userName)).addEntity(User.class)
					.list();
			if (lstRes.size() != 0)
				return lstRes.get(0);
			return null;
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}

}

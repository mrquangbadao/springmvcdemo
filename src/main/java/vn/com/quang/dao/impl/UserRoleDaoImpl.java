package vn.com.quang.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import vn.com.quang.dao.UserRoleDao;

@Repository
public class UserRoleDaoImpl implements UserRoleDao {

	protected SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<String> getAllRoleOfUserByUserName(String userName) {
		try {
			List<String> res = new ArrayList<String>();
			String sql = "SELECT USER_ROLE FROM user_roles WHERE USERNAME = :userName ";

			Session session = this.sessionFactory.getCurrentSession();
			res = ((SQLQuery) session.createSQLQuery(sql).setParameter("userName", userName)).list();
			return res;

		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}

}

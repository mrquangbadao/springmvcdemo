package vn.com.quang.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import vn.com.quang.dao.UserDao;
import vn.com.quang.entity.User;
import vn.com.quang.entity.UserDetail;

@Repository
public class UserDaoImpl implements UserDao {
	private static final Logger logger = Logger.getLogger(UserDaoImpl.class);

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

	@Override
	@Transactional
	public void updateUserDetail(UserDetail bean) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			bean.setDeleteFlg("0");
			session.saveOrUpdate(bean);

			session.flush();
			session.clear();
		} catch (Exception ex) {
			logger.error(ex.getMessage(), ex);
			throw new RuntimeException(ex);
		}

	}

	@Override
	@Transactional
	public int insertNewUserDetail(UserDetail bean) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			bean.setDeleteFlg("0");
			int rowC = ((Number) session.save(bean)).intValue();
			return rowC;
		} catch (Exception ex) {
			logger.error(ex.getMessage(), ex);
			throw new RuntimeException(ex);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public UserDetail getUserDetailById(int id) {
		try {
			List<UserDetail> lstRes = new ArrayList<UserDetail>();
			String sql = "SELECT * FROM user_detail WHERE id = :id AND delete_flg = '0'";

			Session session = this.sessionFactory.getCurrentSession();
			lstRes = ((SQLQuery) session.createSQLQuery(sql).setParameter("id", id)).addEntity(UserDetail.class).list();
			if (lstRes.size() != 0)
				return lstRes.get(0);
			return null;
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public UserDetail getUserDetailByUserName(String userName) {
		try {
			List<UserDetail> lstRes = new ArrayList<UserDetail>();
			String sql = "SELECT * FROM user_detail WHERE user_name = :userName AND delete_flg = '0'";

			Session session = this.sessionFactory.getCurrentSession();
			lstRes = ((SQLQuery) session.createSQLQuery(sql).setParameter("userName", userName))
					.addEntity(UserDetail.class).list();
			if (lstRes.size() != 0)
				return lstRes.get(0);
			return null;
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}
}

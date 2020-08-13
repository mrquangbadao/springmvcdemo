package vn.com.quang.authentication.bean;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.stereotype.Service;

import vn.com.quang.dao.UserDao;
import vn.com.quang.dao.UserRoleDao;
import vn.com.quang.entity.User;

@Service("customUserService")
public class CustomUserService implements UserDetailsService {

	@Autowired
	private UserDao userDao;

	@Autowired
	private UserRoleDao userRoleDao;

	@Autowired
	RequestCache requestCache;

	@Transactional
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = this.userDao.getUserByUserName(username);
		if (user == null) {
			throw new UsernameNotFoundException("User not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		List<String> lstRole = new ArrayList<String>();
		lstRole = this.userRoleDao.getAllRoleOfUserByUserName(username);
		for (String str : lstRole) {
			SimpleGrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + str);
			authorities.add(authority);
		}

		return new CustomUser(user.getUsername(), authorities, user.getPassword(), user.getUsername(), (long) 1, true,
				true, true, true);
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public UserRoleDao getUserRoleDao() {
		return userRoleDao;
	}

	public void setUserRoleDao(UserRoleDao userRoleDao) {
		this.userRoleDao = userRoleDao;
	}

}

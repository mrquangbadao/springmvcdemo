package vn.com.quang.dao;

import java.util.List;

public interface UserRoleDao {
	public List<String> getAllRoleOfUserByUserName(String userName);
}

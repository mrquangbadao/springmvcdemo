/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.com.quang.authentication;

import java.io.Serializable;
import java.util.ArrayList;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import vn.com.quang.authentication.bean.CustomUser;
import vn.com.quang.authentication.bean.CustomUserService;

public class CustomAuthenticationProvider implements AuthenticationProvider, Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1063420669241710547L;
	CustomUserService userDetailService;

	@Override
	public Authentication authenticate(Authentication a) throws AuthenticationException {
		//
		try {
			// sử dụng userDetailService để lấy thông tin user
			CustomUser user = (CustomUser) userDetailService.loadUserByUsername(a.getName());
			// logic xac thuc user
			MyToken result = null;
			if (user.getUsername().equals(a.getName()) && user.getPassword().equals(a.getCredentials().toString())) {
				result = new MyToken(user.getUsername(), user.getPassword(), new ArrayList<GrantedAuthority>(), true,
						user.getUserId(), true, true, true, true);
			}
			return result;
		} catch (UsernameNotFoundException e) {
			throw e;
		}
	}

	public void setUserDetailService(CustomUserService userDetailService) {
		this.userDetailService = userDetailService;
	}

	@Override
	public boolean supports(Class<?> type) {
		return MyToken.class.isAssignableFrom(type);
	}

}

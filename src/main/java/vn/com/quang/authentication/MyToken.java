/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.com.quang.authentication;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class MyToken implements Authentication {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1807936434171577988L;
	private String userName;
	private String password;
	private ArrayList<? extends GrantedAuthority> grantedAuthorities;
	private boolean isAuthenticated = false;
	private final Long userId;
	private final boolean accountNonExpired;
	private final boolean accountNonLocked;
	private final boolean credentialsNonExpired;
	private final boolean enabled;	

	public MyToken(String userName, String password, ArrayList<? extends GrantedAuthority> grantedAuthorities,
			boolean isAuthenticated, Long userId, boolean accountNonExpired, boolean accountNonLocked,
			boolean credentialsNonExpired, boolean enabled) {
		super();
		this.userName = userName;
		this.password = password;
		this.grantedAuthorities = grantedAuthorities;
		this.isAuthenticated = isAuthenticated;
		this.userId = userId;
		this.accountNonExpired = accountNonExpired;
		this.accountNonLocked = accountNonLocked;
		this.credentialsNonExpired = credentialsNonExpired;
		this.enabled = enabled;
	}



	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return grantedAuthorities;
	}

	@Override
	public Object getCredentials() {
		return password;
	}

	@Override
	public Object getDetails() {
		return new User(userName, password, grantedAuthorities);
	}

	@Override
	public Object getPrincipal() {
		return userName;
	}

	@Override
	public boolean isAuthenticated() {
		return isAuthenticated;
	}

	@Override
	public void setAuthenticated(boolean bln) throws IllegalArgumentException {
		isAuthenticated = bln;
	}

	@Override
	public String getName() {
		return userName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ArrayList<? extends GrantedAuthority> getGrantedAuthorities() {
		return grantedAuthorities;
	}

	public void setGrantedAuthorities(ArrayList<? extends GrantedAuthority> grantedAuthorities) {
		this.grantedAuthorities = grantedAuthorities;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Long getUserId() {
		return userId;
	}

	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}

	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}

	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}

	public boolean isEnabled() {
		return enabled;
	}
	
	

}

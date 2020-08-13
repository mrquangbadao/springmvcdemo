package vn.com.quang.authentication.bean;

import java.util.*;

import org.springframework.security.core.*;
import org.springframework.security.core.userdetails.*;

public class CustomUser implements UserDetails {
	private static final long serialVersionUID = -855831245123738217L;

	private final String displayName;
	private final Collection<? extends GrantedAuthority> authorities;
	private final String password;
	private final String username;
	private final Long userId;
	private final boolean accountNonExpired;
	private final boolean accountNonLocked;
	private final boolean credentialsNonExpired;
	private final boolean enabled;

	
	
public CustomUser(String displayName, Collection<? extends GrantedAuthority> authorities, String password,
			String username, Long userId, boolean accountNonExpired, boolean accountNonLocked,
			boolean credentialsNonExpired, boolean enabled) {
		super();
		this.displayName = displayName;
		this.authorities = authorities;
		this.password = password;
		this.username = username;
		this.userId = userId;
		this.accountNonExpired = accountNonExpired;
		this.accountNonLocked = accountNonLocked;
		this.credentialsNonExpired = credentialsNonExpired;
		this.enabled = enabled;
	}	

	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.authorities;
	}

	public String getPassword() {
		return this.password;
	}

	public String getUsername() {
		return this.username;
	}

	public boolean isAccountNonExpired() {
		return this.accountNonExpired;
	}

	public boolean isAccountNonLocked() {
		return this.accountNonLocked;
	}

	public boolean isCredentialsNonExpired() {
		return this.credentialsNonExpired;
	}

	public boolean isEnabled() {
		return this.enabled;
	}

	public String getDisplayName() {
		return displayName;
	}


	public Long getUserId() {
		return userId;
	}

	
}

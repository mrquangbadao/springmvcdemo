/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.com.quang.authentication;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.header.HeaderWriter;
import org.springframework.security.web.header.writers.CacheControlHeadersWriter;
import org.springframework.security.web.header.writers.DelegatingRequestMatcherHeaderWriter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.NegatedRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

import vn.com.quang.authentication.bean.CustomUserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	private static final Logger logger = Logger.getLogger(SecurityConfig.class);
	
	@Autowired
	@Qualifier("userDetailsService")
	private CustomUserService customUserService;

	@Bean(name = BeanIds.AUTHENTICATION_MANAGER)
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		logger.error("AuthenticationManagerBuilder.................");
		
		CustomAuthenticationProvider provider = new CustomAuthenticationProvider();
		provider.setUserDetailService(customUserService);
		auth.authenticationProvider(provider);
	}
	
//	@Override
//    public void configure(WebSecurity web) throws Exception {
//		logger.error("WebSecurity.................");
//		
//        web.ignoring().antMatchers("/resources/**");
//    }

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		logger.error("configure HttpSecurity.................");
		
//		RequestMatcher notResourcesMatcher = new NegatedRequestMatcher(new AntPathRequestMatcher("/resources/**"));
//		HeaderWriter notResourcesHeaderWriter = new DelegatingRequestMatcherHeaderWriter(notResourcesMatcher, new CacheControlHeadersWriter());
		http.headers().disable();
	}
}

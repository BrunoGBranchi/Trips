package br.com.trips.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import br.com.trips.security.SSUserDetailsService;

@EnableWebSecurity
public class SecurityWebConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private SSUserDetailsService ssUserDetailsService;
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		
		//web.ignoring().antMatchers("/usuarios/**");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//http.csrf().disable(); // TODO remover
		http
			.authorizeRequests()
				.antMatchers("/resources/**", "/webjars/**", "/facebook/**", "/login**", "/usuarios/**", "/index", "/").permitAll()
				.anyRequest().anonymous()
				.antMatchers("/viagens/**").hasRole("ADM_SISTEMA")
				.anyRequest().authenticated()
			.and()
			.formLogin().loginPage("/login").permitAll();
		
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder builder) throws Exception {
		builder
			.userDetailsService(ssUserDetailsService)
			.passwordEncoder(new BCryptPasswordEncoder());
		
	}
	
    @Bean
    public AuthenticationManager customAuthenticationManager() throws Exception {
        return authenticationManagerBean();
    }
    
}

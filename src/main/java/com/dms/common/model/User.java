package com.dms.common.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5172840612980051436L;

	@Id
	@Column(name = "user_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column(name = "user_name")
	private String username;
	
	@Column(name = "user_passwd")
	private String password;

	@Column(name = "user_email")
	private String email;

	@Column(name = "user_telephone")
	private String telephone;
	
	@Column(name = "user_qq")
	private String qqNbr;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getQqNbr() {
		return qqNbr;
	}

	public void setQqNbr(String qqNbr) {
		this.qqNbr = qqNbr;
	}
	
}

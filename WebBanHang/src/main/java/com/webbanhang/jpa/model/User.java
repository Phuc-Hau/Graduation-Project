package com.webbanhang.jpa.model;


import javax.persistence.*;

@Entity
@Table(name = "[User]")
public class User {

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private int id;

	@Column(name="Email")
	private String email;

	@Column(name="Password")
	private String password;

	@Column(name="Rules")
	private int rules;

	@Column(name="Status")
	private boolean status;

	@Column(name="Username")
	private String username;
	
	private String img;
	
	//bi-directional many-to-one association to Cutomer
	@ManyToOne
	@JoinColumn(name="Cutomers_id")
	private Cutomer cutomer;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRules() {
		return rules;
	}

	public void setRules(int rules) {
		this.rules = rules;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Cutomer getCutomer() {
		return cutomer;
	}

	public void setCutomer(Cutomer cutomer) {
		this.cutomer = cutomer;
	}

}
package com.webbanhang.model;

import javax.persistence.*;

import java.sql.Timestamp;
import java.util.List;



@Entity
@Table(name="Orders")
public class Order {
	
	@Id
	@Column(name="Id")
	private int id;

	@Column(name="Date")
	private Timestamp date;

	@Column(name="Status")
	private boolean status;

	@Column(name="Totalmoney")
	private double totalmoney;

	//bi-directional many-to-one association to OrderDetail
	@OneToMany(mappedBy="order")
	private List<OrderDetail> orderDetails;

	//bi-directional many-to-one association to Cutomer
	@ManyToOne
	@JoinColumn(name="Customer_id")
	private Cutomer cutomer;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public double getTotalmoney() {
		return totalmoney;
	}

	public void setTotalmoney(double totalmoney) {
		this.totalmoney = totalmoney;
	}

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Cutomer getCutomer() {
		return cutomer;
	}

	public void setCutomer(Cutomer cutomer) {
		this.cutomer = cutomer;
	}

	

}
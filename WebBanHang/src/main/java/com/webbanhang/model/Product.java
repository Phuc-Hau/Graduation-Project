package com.webbanhang.model;

import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name = "Product")
public class Product {

	@Id
	@Column(name = "Id")
	private int id;

	@Column(name = "Amount")
	private int amount;

	@Column(name = "Date")
	private Date date;

	@Column(name = "Detail")
	private String detail;

	@Column(name = "Name")
	private String name;

	@Column(name = "Price")
	private double price;

	@Column(name = "Pricenew")
	private double pricenew;

	@Column(name = "Status")
	private boolean status;

	// bi-directional many-to-one association to Img
	@OneToMany(mappedBy = "product")
	private List<Img> imgs;

	// bi-directional many-to-one association to OrderDetail
	@OneToMany(mappedBy = "product")
	private List<OrderDetail> orderDetails;

	// bi-directional many-to-one association to GroupProduct
	@ManyToOne
	@JoinColumn(name = "GroupID")
	private GroupProduct groupProduct;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getPricenew() {
		return pricenew;
	}

	public void setPricenew(double pricenew) {
		this.pricenew = pricenew;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public List<Img> getImgs() {
		return imgs;
	}

	public void setImgs(List<Img> imgs) {
		this.imgs = imgs;
	}

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public GroupProduct getGroupProduct() {
		return groupProduct;
	}

	public void setGroupProduct(GroupProduct groupProduct) {
		this.groupProduct = groupProduct;
	}



}
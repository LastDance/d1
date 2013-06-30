package com.dms.om.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "sales_order_line")
public class OrderLine {

	@Id
	@Column(name = "ordl_id")
	@GeneratedValue
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "ord_id")
	private Order order;
	
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Column(name = "ordl_ord_id")
	private String orderId;

	@Column(name = "ordl_nbr")
	private String line;

	@Column(name = "ordl_item")
	private String item;

	@Column(name = "ordl_item_price")
	private Double itemPrice;

	@Column(name = "ordl_item_qty")
	private Double lineQuantity;

	@Column(name = "ordl_status")
	private String status;

	@Column(name = "ordl_required_date")
	private Date requiredDate;

	@Column(name = "ordl_reviewed_by")
	private String reviewedBy;

	@Column(name = "ordl_reviewed_date")
	private Date reviewedDate;

	@Column(name = "ordl_comment")
	private String comment;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getLine() {
		return line;
	}

	public void setLine(String line) {
		this.line = line;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public Double getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(Double itemPrice) {
		this.itemPrice = itemPrice;
	}

	public Double getLineQuantity() {
		return lineQuantity;
	}

	public void setLineQuantity(Double lineQuantity) {
		this.lineQuantity = lineQuantity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getRequiredDate() {
		return requiredDate;
	}

	public void setRequiredDate(Date requiredDate) {
		this.requiredDate = requiredDate;
	}

	public String getReviewedBy() {
		return reviewedBy;
	}

	public void setReviewedBy(String reviewedBy) {
		this.reviewedBy = reviewedBy;
	}

	public Date getReviewedDate() {
		return reviewedDate;
	}

	public void setReviewedDate(Date reviewedDate) {
		this.reviewedDate = reviewedDate;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}

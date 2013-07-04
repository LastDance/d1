package com.dms.om.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "order_master")
public class Order {

	@Id
	@Column(name = "ord_id")
	@GeneratedValue
	private Integer id;

	@Column(name = "ord_prefix")
	private String prefix;

	@Column(name = "ord_cust_nbr")
	private String custmerOrderNumber;

	@Column(name = "ord_customer")
	private String customer;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "ord_entered_date")
	private Date enteredDate;

	@Column(name = "ord_entered_by")
	private String enteredBy;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "ord_required_date")
	private Date requiredDate;

	@Column(name = "ord_reviewed_by")
	private String reviewedBy;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "ord_reviewed_date")
	private Date reviewedDate;

	@Column(name = "ord_status")
	private String status;

	@Column(name = "ord_comment")
	private String comment;

	@SuppressWarnings("unchecked")
	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch=FetchType.EAGER)
	private List<OrderLine> orderLines = LazyList.decorate(
			new ArrayList<OrderLine>(),
			FactoryUtils.instantiateFactory(OrderLine.class));

	public List<OrderLine> getOrderLines() {
		return orderLines;
	}

	public void setOrderLines(List<OrderLine> orderLines) {
		this.orderLines = orderLines;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public String getCustmerOrderNumber() {
		return custmerOrderNumber;
	}

	public void setCustmerOrderNumber(String custmerOrderNumber) {
		this.custmerOrderNumber = custmerOrderNumber;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public Date getEnteredDate() {
		return enteredDate;
	}

	public void setEnteredDate(Date enteredDate) {
		this.enteredDate = enteredDate;
	}

	public String getEnteredBy() {
		return enteredBy;
	}

	public void setEnteredBy(String enteredBy) {
		this.enteredBy = enteredBy;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
}

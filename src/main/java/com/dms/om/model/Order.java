package com.dms.om.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;
import org.springframework.format.annotation.DateTimeFormat;

import com.dms.common.model.ReviewComment;

@Entity
@Table(name = "order_master")
public class Order implements Serializable {

	private static final long serialVersionUID = -2187923648564872172L;

	@Id
	@Column(name = "ord_id")
	@GeneratedValue()
	private Integer id;

	@Column(name = "ord_prefix")
	private String prefix;

	@Column(name = "ord_cust_nbr")
	private String custmerOrderNumber;

	@Column(name = "ord_cust")
	private String customer;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "ord_ent_date")
	private Date enteredDate;

	@Column(name = "ord_ent_by")
	private String enteredBy;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "ord_req_date")
	private Date requiredDate;

	@Column(name = "ord_status")
	private String status;

	@Column(name = "ord_cmt")
	private String comment;

	@SuppressWarnings("unchecked")
	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<OrderLine> orderLines = LazyList.decorate(
			new ArrayList<OrderLine>(),
			FactoryUtils.instantiateFactory(OrderLine.class));
	
	@SuppressWarnings("unchecked")
	@OneToMany()
	@JoinColumn(name="ord_rvw_group")
	private List<ReviewComment> reviews = LazyList.decorate(
			new ArrayList<ReviewComment>(),
			FactoryUtils.instantiateFactory(ReviewComment.class));

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

	public List<ReviewComment> getReviews() {
		return reviews;
	}

	public void setReviews(List<ReviewComment> reviews) {
		this.reviews = reviews;
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

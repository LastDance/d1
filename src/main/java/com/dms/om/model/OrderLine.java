package com.dms.om.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;
import org.springframework.format.annotation.DateTimeFormat;

import com.dms.common.model.ReviewComment;

@Entity
@Table(name = "order_line")
public class OrderLine {

	@Id
	@Column(name = "ordl_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column(name = "ordl_nbr")
	private int line;

	@Column(name = "ordl_line_item")
	private String lineItem;
	
	@Column(name = "ordl_product")
	private String product;

	@Column(name = "ordl_item_price")
	private Double itemPrice;

	@Column(name = "ordl_item_qty")
	private Double lineQuantity;

	@Column(name = "ordl_status")
	private String status;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "ordl_req_date")
	private Date requiredDate;

	@Column(name = "ordl_cmt")
	private String comment;

	@Column(name = "ordl_active")
	private boolean active;
	
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
	@JoinColumn(name = "ordl_ord_id", referencedColumnName = "ord_id")
	private Order order;

	@SuppressWarnings("unchecked")
	@OneToMany()
	@JoinColumn(name="ordl_rvw_group")
	private List<ReviewComment> reviews = LazyList.decorate(
			new ArrayList<ReviewComment>(),
			FactoryUtils.instantiateFactory(ReviewComment.class));

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public List<ReviewComment> getReviews() {
		return reviews;
	}

	public void setReviews(List<ReviewComment> reviews) {
		this.reviews = reviews;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getLine() {
		return line;
	}

	public void setLine(int lineNumber) {
		this.line = lineNumber;
	}

	public String getLineItem() {
		return lineItem;
	}

	public void setLineItem(String lineItem) {
		this.lineItem = lineItem;
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

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}

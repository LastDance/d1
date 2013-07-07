package com.dms.common.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "review_detail")
public class ReviewComment {

	@Id
	@Column(name = "rvw_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column(name = "rvw_group")
	private int reviewGroup;

	@Column(name = "rvw_ent_by")
	private String reviewEnteredBy;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "rvw_ent_date")
	private Date reviewEnteredDate;

	@Column(name = "rvw_cmt")
	private String product;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getReviewGroup() {
		return reviewGroup;
	}

	public void setReviewGroup(int reviewGroup) {
		this.reviewGroup = reviewGroup;
	}

	public String getReviewEnteredBy() {
		return reviewEnteredBy;
	}

	public void setReviewEnteredBy(String reviewEnteredBy) {
		this.reviewEnteredBy = reviewEnteredBy;
	}

	public Date getReviewEnteredDate() {
		return reviewEnteredDate;
	}

	public void setReviewEnteredDate(Date reviewEnteredDate) {
		this.reviewEnteredDate = reviewEnteredDate;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}
}

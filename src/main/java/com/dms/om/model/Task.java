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
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;
import org.springframework.format.annotation.DateTimeFormat;

import com.dms.common.model.ReviewComment;

@Entity
@Table(name = "task_master")
public class Task implements Serializable {

	private static final long serialVersionUID = -5210437270556748013L;
	
	@Id
	@Column(name = "tk_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column(name = "tk_ordl_id")
	private int line;
	
	@Column(name = "tk_product")
	private String product;
	
	@Column(name = "tk_desc")
	private String productDescription;
	
	@Column(name = "tk_set_qty")
	private double setQuantity;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "tk_due_date" )
	private Date dueDate;
	
	@Column(name = "tk_ent_by")
	private String enteredBy;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "tk_ent_date")
	private Date enteredDate;
	
	@SuppressWarnings("unchecked")
	@OneToMany()
	@JoinColumn(name="tk_rvw_grp")
	private List<ReviewComment> reviews = LazyList.decorate(
			new ArrayList<ReviewComment>(),
			FactoryUtils.instantiateFactory(ReviewComment.class));
	
	@Column(name = "tk_cmt")
	private String comment;
	
	@SuppressWarnings("unchecked")
	@OneToMany(mappedBy = "task", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<TaskLine> taskLines = LazyList.decorate(
			new ArrayList<TaskLine>(),
			FactoryUtils.instantiateFactory(TaskLine.class));

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getLine() {
		return line;
	}

	public void setLine(int line) {
		this.line = line;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public double getSetQuantity() {
		return setQuantity;
	}

	public void setSetQuantity(double setQuantity) {
		this.setQuantity = setQuantity;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public String getEnteredBy() {
		return enteredBy;
	}

	public void setEnteredBy(String enteredBy) {
		this.enteredBy = enteredBy;
	}

	public Date getEnteredDate() {
		return enteredDate;
	}

	public void setEnteredDate(Date enteredDate) {
		this.enteredDate = enteredDate;
	}

	public List<ReviewComment> getReviews() {
		return reviews;
	}

	public void setReviews(List<ReviewComment> reviews) {
		this.reviews = reviews;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public List<TaskLine> getTaskLines() {
		return taskLines;
	}

	public void setTaskLines(List<TaskLine> taskLines) {
		this.taskLines = taskLines;
	}
}

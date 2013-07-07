package com.dms.om.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.dms.common.model.MaterialDetail;

@Entity
@Table(name = "task_line")
public class TaskLine implements Serializable {

	private static final long serialVersionUID = -8357517679609053712L;

	@Id
	@Column(name = "tkl_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
	@JoinColumn(name = "tkl_tk_id", referencedColumnName = "tk_id")
	private Task task;

	@Column(name = "tkl_part")
	private String part;
	
	@Column(name = "tkl_desc")
	private String partDescription;
	
	@OneToOne
	@JoinColumn(name = "tkl_matl_id")
	private MaterialDetail material;
	
	@Column(name = "tkl_qty_set")
	private Double quantitySet;
	
	@Column(name = "tkl_qty_per_set")
	private Double quantityPerSet;
	
	@Column(name = "tkl_appr")
	private String approach;
	
	@Column(name = "tkl_cmt")
	private String comment;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getPartDescription() {
		return partDescription;
	}

	public void setPartDescription(String partDescription) {
		this.partDescription = partDescription;
	}

	public MaterialDetail getMaterial() {
		return material;
	}

	public void setMaterial(MaterialDetail material) {
		this.material = material;
	}

	public Double getQuantitySet() {
		return quantitySet;
	}

	public void setQuantitySet(Double quantitySet) {
		this.quantitySet = quantitySet;
	}

	public Double getQuantityPerSet() {
		return quantityPerSet;
	}

	public void setQuantityPerSet(Double quantityPerSet) {
		this.quantityPerSet = quantityPerSet;
	}

	public String getApproach() {
		return approach;
	}

	public void setApproach(String approach) {
		this.approach = approach;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
}
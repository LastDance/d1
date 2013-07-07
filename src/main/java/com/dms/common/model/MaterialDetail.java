package com.dms.common.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.dms.om.model.TaskLine;

@Entity
@Table(name = "material_detail")
public class MaterialDetail implements Serializable {

	private static final long serialVersionUID = -334939161965115102L;

	@Id
	@Column(name = "matl_id")
	@GeneratedValue()
	private Integer id;

	@OneToOne
	@JoinColumn(name = "matl_tkl_id")
	private TaskLine taskLine;
	
	@Column(name = "matl_attr1")
	private String attribute1;

	@Column(name = "matl_attr2")
	private String attribute2;
	
	@Column(name = "matl_attr3")
	private String attribute3;
	
	@Column(name = "matl_attr4")
	private String attribute4;
	
	@Column(name = "matl_name")
	private String name;
	
	@Column(name = "matl_desc")
	private String descrition;
	
	@Column(name = "matl_ctg")
	private String catagory;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TaskLine getTaskLine() {
		return taskLine;
	}

	public void setTaskLine(TaskLine taskLine) {
		this.taskLine = taskLine;
	}

	public String getAttribute1() {
		return attribute1;
	}

	public void setAttribute1(String attribute1) {
		this.attribute1 = attribute1;
	}

	public String getAttribute2() {
		return attribute2;
	}

	public void setAttribute2(String attribute2) {
		this.attribute2 = attribute2;
	}

	public String getAttribute3() {
		return attribute3;
	}

	public void setAttribute3(String attribute3) {
		this.attribute3 = attribute3;
	}

	public String getAttribute4() {
		return attribute4;
	}

	public void setAttribute4(String attribute4) {
		this.attribute4 = attribute4;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescrition() {
		return descrition;
	}

	public void setDescrition(String descrition) {
		this.descrition = descrition;
	}

	public String getCatagory() {
		return catagory;
	}

	public void setCatagory(String catagory) {
		this.catagory = catagory;
	}

	
}

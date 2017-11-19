package com.sky.entity;


public class TUser implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	private Integer id;
	private String name;
	private Integer age;

	public void setId(Integer value) {
		this.id = value;
	}

	public Integer getId() {
		return this.id;
	}

	public void setName(String value) {
		this.name = value;
	}

	public String getName() {
		return this.name;
	}

	public void setAge(Integer value) {
		this.age = value;
	}

	public Integer getAge() {
		return this.age;
	}

}
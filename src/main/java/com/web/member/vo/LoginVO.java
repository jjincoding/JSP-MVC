package com.web.member.vo;

public class LoginVO {
	
	private String id;
	private String name;
	private int gradeNo;
	private String gradeName;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGradeNo() {
		return gradeNo;
	}
	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	
	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", name=" + name + ", gradeNo=" + gradeNo + ", gradeName=" + gradeName + "]";
	}
	
}

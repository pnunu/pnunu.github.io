package pnunu.ssm.po;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import pnunu.ssm.util.CustomDateSerialize;
import pnunu.ssm.util.CustomDateTimeSerialize;

/**
 * @author Nunu
 * 2016-12-3
 * 用户基本类
 */
public class User {

	/**
	 * 用户id
	 */
	private Integer userId;
	/**
	 * 用户登录名,即邮箱
	 */
	private String username;
	/**
	 * 昵称,或真实名字
	 */
	private String userRealname;
	/**
	 * 密码
	 */
	private String userPassword;
	/**
	 * 用户性别
	 */
	private String userSex;
	/**
	 * 生日
	 */
	@JsonSerialize(using = CustomDateSerialize.class)
	private Date userBirthday;
	/**
	 * 创建时间,用户创建时间
	 */
	@JsonSerialize(using = CustomDateTimeSerialize.class)
	private Date userHiredate = new Date();
	/**
	 * 上次登录IP
	 */
	private String userIp;
	/**
	 * 老师对象
	 */
	private int teacherId;
	private String role;
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserRealname() {
		return userRealname;
	}
	public void setUserRealname(String userRealname) {
		this.userRealname = userRealname;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public Date getUserBirthday() {
		return userBirthday;
	}
	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}
	public Date getUserHiredate() {
		return userHiredate;
	}
	public void setUserHiredate(Date userHiredate) {
		this.userHiredate = userHiredate;
	}
	public String getUserIp() {
		return userIp;
	}
	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}
	public int getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", username=" + username + ", userRealname=" + userRealname
				+ ", userPassword=" + userPassword + ", userSex=" + userSex + ", userBirthday=" + userBirthday
				+ ", userHiredate=" + userHiredate + ", userIp=" + userIp + ", teacherId=" + teacherId + "]";
	}
	public User(Integer userId, String username, String userRealname, String userPassword, String userSex,
			Date userBirthday, Date userHiredate, String userIp, int teacherId) {
		super();
		this.userId = userId;
		this.username = username;
		this.userRealname = userRealname;
		this.userPassword = userPassword;
		this.userSex = userSex;
		this.userBirthday = userBirthday;
		this.userHiredate = userHiredate;
		this.userIp = userIp;
		this.teacherId = teacherId;
	}
	public User() {
		super();
	}
}
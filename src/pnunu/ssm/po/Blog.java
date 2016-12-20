package pnunu.ssm.po;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import pnunu.ssm.util.CustomDateTimeSerialize;

/**
 * @author N
 * 文章表，即老师的每节课的内容
 * 每节课的内容
 */
public class Blog {
/**
 * blog_id
 * class_id
 * blog_name
 * blog_text
 * blog_date
 */
	private Integer bolgId;
	private Integer classId;
	private String blogName;
	private String blogText;
	@JsonSerialize(using = CustomDateTimeSerialize.class)
	private Date blogDate = new Date();
	public Integer getBolgId() {
		return bolgId;
	}
	public void setBolgId(Integer bolgId) {
		this.bolgId = bolgId;
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public String getBlogName() {
		return blogName;
	}
	public void setBlogName(String blogName) {
		this.blogName = blogName;
	}
	public String getBlogText() {
		return blogText;
	}
	public void setBlogText(String blogText) {
		this.blogText = blogText;
	}
	public Date getBlogDate() {
		return blogDate;
	}
	public void setBlogDate(Date blogDate) {
		this.blogDate = blogDate;
	}
	@Override
	public String toString() {
		return "Blog [bolgId=" + bolgId + ", classId=" + classId + ", blogName=" + blogName + ", blogText=" + blogText
				+ ", blogDate=" + blogDate + "]";
	}
	public Blog(Integer bolgId, Integer classId, String blogName, String blogText, Date blogDate) {
		super();
		this.bolgId = bolgId;
		this.classId = classId;
		this.blogName = blogName;
		this.blogText = blogText;
		this.blogDate = blogDate;
	}
	public Blog() {
		super();
	}
}

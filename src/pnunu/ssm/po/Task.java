package pnunu.ssm.po;

import java.util.Date;

/** 
* @ClassName: Task 
* @Description: 每节课对应的作业列表，可以没有作业，也可以存在多个作业
* @author Nunu
* @date 2016年12月3日 下午10:57:16  
*/
public class Task {
	private Integer taskId;
	/** 
	* @Fields blogId : 对应课程id
	*/ 
	private Integer blogId;
	private String taskName;
	/** 
	* @Fields taskText : 作业内容
	*/ 
	private String taskText;
	/** 
	* @Fields taskDate : 作业创建时间
	*/ 
	private Date taskDate = new Date();
	/** 
	* @Fields taskCommit : 作业提交时间
	*/ 
	private Date taskCommit;
	public Integer getTaskId() {
		return taskId;
	}
	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}
	public Integer getBlogId() {
		return blogId;
	}
	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public String getTaskText() {
		return taskText;
	}
	public void setTaskText(String taskText) {
		this.taskText = taskText;
	}
	public Date getTaskDate() {
		return taskDate;
	}
	public void setTaskDate(Date taskDate) {
		this.taskDate = taskDate;
	}
	public Date getTaskCommit() {
		return taskCommit;
	}
	public void setTaskCommit(Date taskCommit) {
		this.taskCommit = taskCommit;
	}
	public Task(Integer taskId, Integer blogId, String taskName, String taskText, Date taskDate, Date taskCommit) {
		super();
		this.taskId = taskId;
		this.blogId = blogId;
		this.taskName = taskName;
		this.taskText = taskText;
		this.taskDate = taskDate;
		this.taskCommit = taskCommit;
	}
	public Task() {
		super();
	}
}

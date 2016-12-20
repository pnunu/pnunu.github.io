package pnunu.ssm.po;

import java.util.Date;

/** 
* @ClassName: Homework 
* @Description: 学生提交的作业
* @author Nunu
* @date 2016年12月3日 下午10:52:10  
*/
public class Homework {
	private Integer homeworkId;
	private Integer taskId;
	private String homeworkText;
	private String studentId;
	private Date commitDate = new Date();
	public Integer getHomeworkId() {
		return homeworkId;
	}
	public void setHomeworkId(Integer homeworkId) {
		this.homeworkId = homeworkId;
	}
	public Integer getTaskId() {
		return taskId;
	}
	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}
	public String getHomeworkText() {
		return homeworkText;
	}
	public void setHomeworkText(String homeworkText) {
		this.homeworkText = homeworkText;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public Date getCommitDate() {
		return commitDate;
	}
	public void setCommitDate(Date commitDate) {
		this.commitDate = commitDate;
	}
	public Homework(Integer homeworkId, Integer taskId, String homeworkText, String studentId, Date commitDate) {
		super();
		this.homeworkId = homeworkId;
		this.taskId = taskId;
		this.homeworkText = homeworkText;
		this.studentId = studentId;
		this.commitDate = commitDate;
	}
	public Homework() {
		super();
	}
	@Override
	public String toString() {
		return "Homework [homeworkId=" + homeworkId + ", taskId=" + taskId + ", homeworkText=" + homeworkText
				+ ", studentId=" + studentId + ", commitDate=" + commitDate + "]";
	}
}

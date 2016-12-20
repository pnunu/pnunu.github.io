package pnunu.ssm.po;

/**
 * @author Nunu
 * 2016-12-3
 * 课程分类，系统管理员拥有这个权限
 */
public class ClassCode {

	private Integer id;
	private String name;
	private String imgurl;
	private String desc;
	private int teacherNum;
	private int studentNum;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public int getTeacherNum() {
		return teacherNum;
	}
	public void setTeacherNum(int teacherNum) {
		this.teacherNum = teacherNum;
	}
	public int getStudentNum() {
		return studentNum;
	}
	public void setStudentNum(int studentNum) {
		this.studentNum = studentNum;
	}
	public ClassCode() {
		super();
	}
	public ClassCode(Integer id, String name, String imgurl, String desc, int teacherNum, int studentNum) {
		super();
		this.id = id;
		this.name = name;
		this.imgurl = imgurl;
		this.desc = desc;
		this.teacherNum = teacherNum;
		this.studentNum = studentNum;
	}
	
}

package pnunu.ssm.po;

/**
 * @author Nunu
 * 2016-12-3
 * 没门课程的信息表课程名称，大概内容，等信息，与文章表一对多的关系
 * 老师具有操作权利
 */
public class ClassYear {
/*class_id             int not null,
 *id                   int,
 *class_name           varchar(255),
 *class_desc           varchar(255),
 *class_num            int, 
 */
	private Integer classId;
	/**
	 * 课程分类id
	 */
	private Integer id;
	private String codeName;
	private String className;
	private String classDesc;
	private String imgUrl;
	private Integer classNum;
	private User teacher;
	private String teacherName;
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public User getTeacher() {
		return teacher;
	}
	public void setTeacher(User teacher) {
		this.teacher = teacher;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getClassDesc() {
		return classDesc;
	}
	public void setClassDesc(String classDesc) {
		this.classDesc = classDesc;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public Integer getClassNum() {
		return classNum;
	}
	public void setClassNum(Integer classNum) {
		this.classNum = classNum;
	}
	@Override
	public String toString() {
		return "ClassYear [classId=" + classId + ", id=" + id + ", className=" + className + ", classDesc=" + classDesc
				+ ", imgUrl=" + imgUrl + ", classNum=" + classNum + "]";
	}
	public ClassYear(Integer classId, Integer id, String className, String classDesc, String imgUrl, Integer classNum) {
		super();
		this.classId = classId;
		this.id = id;
		this.className = className;
		this.classDesc = classDesc;
		this.imgUrl = imgUrl;
		this.classNum = classNum;
	}
	public ClassYear() {
		super();
	}
	
}

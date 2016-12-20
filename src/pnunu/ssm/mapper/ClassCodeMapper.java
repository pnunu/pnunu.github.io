package pnunu.ssm.mapper;

import java.util.List;

import pnunu.ssm.po.ClassCode;

/** 
* @ClassName: ClassCodeMapper 
* @Description: 课程分类的增删改，系统管理员拥有这个权限
* @author Nunu
* @date 2016年12月4日 上午12:00:32  
*/
public interface ClassCodeMapper {
	public void addClassCode(ClassCode classCode);
	public void delClassCode(Integer classCodeId);
	public void updateClassCode(ClassCode classCode);
	public List<ClassCode> findClassCode(Integer currentPage);
	public Integer count();
	/** 
	 * 根据id查询
	 * @Title: findById 
	 * @param @param id
	 * @return ClassCode
	 * @throws 
	 */
	public ClassCode findById(Integer id);
}

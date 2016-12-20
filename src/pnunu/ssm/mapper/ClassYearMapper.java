package pnunu.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pnunu.ssm.po.ClassYear;

/** 
* @ClassName: ClassYearMapper 
* @Description: 每门课程的信息，老师的权限
* @author Nunu
* @date 2016年12月4日 上午12:01:45  
*/
public interface ClassYearMapper {
	public Integer addClassYear(ClassYear classYear);
	public void delClassYear(Integer classYearId);
	public void updateClassYear(ClassYear classYear);
	public List<ClassYear> findClassYear(Integer currentPage);
	public Integer count();
	public void addYearTeacher(@Param("classId")Integer classId, @Param("userId")Integer userId);
	public List<ClassYear> findByTea(Integer userId);
	public List<ClassYear> findByCode(Integer id);
}

package pnunu.ssm.mapper;

import java.util.List;

import pnunu.ssm.po.Homework;

/** 
* @ClassName: HomeworkMapper 
* @Description: 学生提交作业列表的基本操作
* @author Nunu
* @date 2016年12月4日 上午12:02:57  
*/
public interface HomeworkMapper {
	public void addHomework(Homework homework);
	public void delHomework(Integer homeworkId);
	public void updateHomework(Homework homework);
	public List<Homework> findHomework();
}

package pnunu.ssm.mapper;

import java.util.List;

import pnunu.ssm.po.Task;

/** 
* @ClassName: TaskMapper 
* @Description: 作业列表的展示
* @author Nunu
* @date 2016年12月4日 上午12:06:30  
*/
public interface TaskMapper {
	public void addTask(Task task);
	public void del(Integer taskId);
	public void updateTask(Task task);
	public List<Task> findTask();
}

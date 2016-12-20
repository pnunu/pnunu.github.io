package pnunu.ssm.service;

import java.util.List;

import pnunu.ssm.po.ClassCode;

public interface ClasscodeService {

	/** 
	 * 添加课程分类
	 * @Title: add 
	 * @return void
	 * @throws 
	 */
	public void add(ClassCode classCode);

	/** 
	 * 修改
	 * @Title: update 
	 * @return void
	 * @throws 
	 */
	public void update(ClassCode classCode);

	/** 
	 * 查询
	 * @Title: find 
	 * @return List<ClassCode>
	 * @throws 
	 */
	public List<ClassCode> find(Integer currentPage);

	/** 
	 * @Title: count 
	 * @Description: 数量
	 * @return Integer
	 * @throws 
	 */
	public Integer count();
}

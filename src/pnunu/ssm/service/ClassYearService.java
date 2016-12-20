package pnunu.ssm.service;

import java.util.List;

import pnunu.ssm.po.ClassYear;

/** 
* @ClassName: ClassYearService 
* @Description: 课程管理
* @author Nunu
* @date 2016年12月12日 下午9:41:28  
*/
public interface ClassYearService {

	/** 
	 * @Title: find 查询
	 * @return List<ClassYear>
	 * @throws 
	 */
	public List<ClassYear> find(Integer currentPage);

	/** 
	 * @Title: count 查询个数
	 * @return Integer
	 * @throws 
	 */
	public Integer count();

	/** 
	 * 添加
	 * @Title: add 
	 * @return void
	 * @throws 
	 */
	public void add(ClassYear classYear);

	/** 
	 * 修改
	 * @Title: update 
	 * @return void
	 * @throws 
	 */
	public void update(ClassYear classYear);

	/** 
	 * 根据老师id查询课程列表
	 * @Title: findByTea 
	 * @param @param userId
	 * @return List<ClassYear>
	 * @throws 
	 */
	public List<ClassYear> findByTea(Integer userId);

	/** 
	 * 根据分类id查询
	 * @Title: findByCode 
	 * @param @param id
	 * @return List<ClassYear>
	 * @throws 
	 */
	public List<ClassYear> findByCode(Integer id);

}

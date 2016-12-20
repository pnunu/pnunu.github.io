package pnunu.ssm.service;

import java.util.List;

import pnunu.ssm.po.Role;

/** 
* @ClassName: RoleService 
* @Description: 角色
* @author Nunu
* @date 2016年12月11日 下午2:12:31  
*/
public interface RoleService {
	public List<Role> findRoleList();

	/** 
	 * @Title: findById 
	 * @Description: 根据id查询
	 * @param @return    设定文件 
	 * @return Role
	 * @throws 
	 */
	public Role findById(Integer roleId);

	/** 
	 * @Title: addRole 
	 * @Description: 添加
	 * @param @param role
	 * @param @param ids    设定文件 
	 * @return void
	 * @throws 
	 */
	public void addRole(Role role, String ids);

	/** 
	 * @Title: updateRole 
	 * @Description: 修改
	 * @param @param role
	 * @param @param ids    设定文件 
	 * @return void
	 * @throws 
	 */
	public void updateRole(Role role, String ids);

	/** 
	 * @Title: del 
	 * @Description: 删除
	 * @param @param roleId    设定文件 
	 * @return void
	 * @throws 
	 */
	public void del(Integer roleId);
}

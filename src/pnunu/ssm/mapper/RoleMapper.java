package pnunu.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pnunu.ssm.po.Role;

/** 
* @ClassName: RoleMapper 
* @Description: 角色列表
* @author Nunu
* @date 2016年12月4日 上午12:04:40  
*/
public interface RoleMapper {
	public void addRole(Role role);
	public void delRole(Integer roleId);
	public void updateRole(Role Role);
	public List<Role> findRole();
	/** 
	 * @Title: findById 
	 * @Description: 根据id查询
	 * @param @param roleId
	 * @param @return    设定文件 
	 * @return Role
	 * @throws 
	 */
	public Role findById(Integer roleId);
	/** 
	 * @Title: grant 
	 * @Description: 授权
	 * @param @param ids    设定文件 
	 * @return void
	 * @throws 
	 */
	public void grant(@Param("resourceId") Integer resourceId, @Param("roleId") Integer roleId);
	/** 
	 * @Title: grantNo 
	 * @Description: 删除权限
	 * @param @param roleId    设定文件 
	 * @return void
	 * @throws 
	 */
	public void grantNo(Integer roleId);
}

package pnunu.ssm.mapper;

import java.util.List;

import pnunu.ssm.po.User;

/** 
* @ClassName: UserMapper 
* @Description: 用户信息的基本增删改查
* @author Nunu
* @date 2016年12月3日 下午11:58:41  
*/
public interface UserMapper {

	/** 
	 * @Title: addUser 
	 * @Description: 添加用户
	 * @param @param user
	 * @return void
	 * @throws 
	 */
	public void addUser(User user);
	/** 
	 * @Title: updateUser 
	 * @Description: 修改用户
	 * @param @param user
	 * @return void
	 * @throws 
	 */
	public void updateUser(User user);
	/** 
	 * @Title: delUser 
	 * @Description: 删除用户
	 * @param @param userId
	 * @return void
	 * @throws 
	 */
	public void delUser(Integer userId);
	public User findById(Integer userId);
	public List<User> findAll(Integer currentPage);
	public User login(User user);
	/** 
	 * @Title: updateT 
	 * @Description: 更改用户角色
	 * @param @param id    设定文件 
	 * @return void
	 * @throws 
	 */
	public void updateT(Integer id);
	/** 
	 * @Title: addT 
	 * @Description: 为用户添加角色
	 * @param @param id    设定文件 
	 * @return void
	 * @throws 
	 */
	public void addT(Integer id);
	/** 
	 * 删除角色
	 * @Title: delUserT 
	 * @return void
	 * @throws 
	 */
	public void delUserT(Integer id);
	/** 
	 * @Title: findUsersCount 
	 * @Description: 查询数量
	 * @param @return    设定文件 
	 * @return Integer
	 * @throws 
	 */
	public Integer findUsersCount();
}

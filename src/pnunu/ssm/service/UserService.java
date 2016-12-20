package pnunu.ssm.service;

import java.util.List;

import pnunu.ssm.po.User;

public interface UserService {
	public void addUser(User user);
	public void delUser(Integer id);
	public void updateUser(User user);
	public List<User> findUsers(Integer currentPage);
	public User findById(Integer id);
	public User login(User user);
	/** 
	 * @Title: updateT 
	 * @Description: 修改角色
	 * @param @param id    设定文件 
	 * @return void
	 * @throws 
	 */
	public void updateT(Integer id);
	/** 
	 * @Title: addT 
	 * @Description: 为用户授角色
	 * @param @param id    设定文件 
	 * @return void
	 * @throws 
	 */
	public void addT(Integer id);
	/** 
	 * @Title: delUserT 
	 * @Description: 删除角色
	 * @return void
	 * @throws 
	 */
	public void delUserT(Integer id);
	/** 
	 * @Title: findUsersCount 
	 * @Description: 查询数量
	 * @return Integer
	 * @throws 
	 */
	public Integer findUsersCount();
}

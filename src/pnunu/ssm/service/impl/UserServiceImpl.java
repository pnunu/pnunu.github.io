package pnunu.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import pnunu.ssm.mapper.UserMapper;
import pnunu.ssm.po.User;
import pnunu.ssm.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	
	@Resource(name="userMapper")
	private UserMapper userMapper;

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void addUser(User user) {
		userMapper.addUser(user);
		userMapper.addT(user.getUserId());
	}

	@Override
	public void delUser(Integer id) {
		userMapper.delUser(id);
	}

	@Override
	public void updateUser(User user) {
		userMapper.updateUser(user);
	}

	@Override
	public List<User> findUsers(Integer currentPage) {
		return userMapper.findAll(currentPage*10);
	}

	@Override
	public User findById(Integer id) {
		return userMapper.findById(id);
	}

	@Override
	public User login(User user) {
		return userMapper.login(user);
	}

	@Override
	public void updateT(Integer id) {
		userMapper.updateT(id);
	}

	@Override
	public void addT(Integer id) {
		userMapper.addT(id);
	}

	@Override
	public void delUserT(Integer id) {
		userMapper.delUserT(id);
	}

	@Override
	public Integer findUsersCount() {
		return userMapper.findUsersCount();
	}

}

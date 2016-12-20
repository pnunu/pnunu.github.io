package pnunu.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pnunu.ssm.mapper.RoleMapper;
import pnunu.ssm.po.Role;
import pnunu.ssm.service.RoleService;

@Service("roleService")
@Transactional
public class RoleServiceImpl implements RoleService {

	@Resource(name="roleMapper")
	private RoleMapper roleMapper;
	@Override
	public List<Role> findRoleList() {
		//System.out.println("===");
		return roleMapper.findRole();
	}
	@Override
	public Role findById(Integer roleId) {
		return roleMapper.findById(roleId);
	}
	@Override
	public void addRole(Role role, String ids) {
		roleMapper.addRole(role);
		if (ids != null && "".equals(ids)) {
			String[] s = ids.split(",");
			for (int i = 0; i < s.length; i++) {
				roleMapper.grant(Integer.valueOf(s[i]),role.getRoleId());
			}
		}
	}
	@Override
	public void updateRole(Role role, String ids) {
		roleMapper.updateRole(role);
		roleMapper.grantNo(role.getRoleId());
		String[] s = ids.split(",");
		for (int i = 0; i < s.length; i++) {
			roleMapper.grant(Integer.valueOf(s[i]),role.getRoleId());
		}
	}
	@Override
	public void del(Integer roleId) {
		roleMapper.grantNo(roleId);
		roleMapper.delRole(roleId);
	}

}

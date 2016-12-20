package pnunu.ssm.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pnunu.ssm.po.ResourcePo;
import pnunu.ssm.po.Role;
import pnunu.ssm.util.Log;

@Controller
@RequestMapping(value="/sys-role")
public class RoleController extends BaseController {
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Role update(@PathVariable("id") Integer id) {
		Role role = roleService.findById(id);
		//System.out.println(role);
		return role;
	}

	//del-a
	@RequestMapping(value="/del-a/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id") Integer id) {
		roleService.del(id);
		return "redirect:/sys-role/list-a";
	}
	/** 
	 * @Title: add 
	 * @Description: 添加方法
	 * @param @param role
	 * @param @param ids
	 * @param @return    设定文件 
	 * @return String
	 * @throws 
	 */
	@RequestMapping(value="/add-a",method=RequestMethod.POST)
	public String add(Role role, String ids) {
		//System.out.println(role);
		//System.out.println(ids);
		if (role.getRoleId() == null) {
			roleService.addRole(role,ids);
		} else {
			roleService.updateRole(role,ids);
		}
		return "redirect:/sys-role/list-a";
	}
	/** 
	 * @Title: listUI 
	 * @Description: 返回角色列表页面
	 * @return String
	 * @throws 
	 */
	@RequestMapping(value="/list-a",method=RequestMethod.GET)
	public ModelAndView listUI() {
		ModelAndView mav = new ModelAndView();
		//TODO
		List<ResourcePo> resoList = resourceService.findResourceList(1);
		mav.addObject("resoList", resoList);
		mav.addObject("url", "sys-role/list-a");
		mav.setViewName("admin/sys/role");
		mav.addObject("lift", "sys-ul");
		Log.logInfo("进入列表页面");
		return mav;
	}
	/** 
	 * @Title: list 
	 * @Description: 返回角色列表数据,返回 Json 字符串
	 * @return List<Role>
	 * @throws 
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public List<Role> list() {
		//System.out.println(roleService);
		List<Role> list = roleService.findRoleList();
		return list;
	}
	
}

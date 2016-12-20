package pnunu.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pnunu.ssm.po.ResourcePo;
import pnunu.ssm.po.User;
import pnunu.ssm.util.IpAddress;

@Controller
@RequestMapping(value="/sys-user")
public class UserController extends BaseController {

	@RequestMapping(value="/ajax_list",method=RequestMethod.GET)
	public String ajaxList() {
		return "user/ajax_list";
	}
	@RequestMapping(value="/list-a/{currentPage}",method=RequestMethod.POST)
	@ResponseBody
	public List<User> ajax(@PathVariable("currentPage") Integer currentPage) {
		List<User> list = userService.findUsers(currentPage);
		return list;
	}
	
	//登录页面
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginsubmit(HttpServletRequest request) {
		HttpSession session = request.getSession();
		//如果用户已登录也放行
		if(session.getAttribute("user") != null){
			return "redirect:/sys-user/list-a";
		} else {
			return "login";
		}
	}

	//登录
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String loginsubmit(HttpSession session,User user) {
		//设置密码为md5加密
		user.setUserPassword(DigestUtils.md5Hex(user.getUserPassword()));
		//从数据库中获取到user信息
		User u = userService.login(user);
		//System.out.println(u);
		if (u != null) {
			//向session记录用户身份信息
			session.setAttribute("user",u);
			return "redirect:/sys-user/list-a";
		} else {
			return "login";
		}
	}
	
	//退出
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		//session过期
		session.invalidate();
		return"redirect:login";
	}
	
	@RequestMapping(value="/add-a",method=RequestMethod.GET)
	public String add() {
		return "sys-user/add";
	}
	
	@RequestMapping(value="/add-a",method=RequestMethod.POST)
	public String add(HttpServletRequest request, User user) {
		user.setUserPassword(DigestUtils.md5Hex(user.getUserPassword()));
		//System.out.println(user.getUserHiredate());
		//System.out.println(user);
		user.setUserIp(IpAddress.getIpAddr(request));
		userService.addUser(user);
		return "redirect:/sys-user/list-a";
	}
	
	@RequestMapping(value="/list-a",method=RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request) {
		String current = request.getParameter("currentPage");
		Integer currentPage = 0;
		if (current == null || "".equals(current)) {
			currentPage = 0;
		} else {
			currentPage = Integer.valueOf(current);
		}
		List<User> userList = userService.findUsers(currentPage);
		Integer count = userService.findUsersCount();
		//System.out.println(userList.get(0).getUserHiredate());
		ModelAndView mav = new ModelAndView();
		mav.addObject("userList", userList);
		mav.setViewName("admin/sys/user");
		mav.addObject("url", "sys-user/list-a");
		mav.addObject("count", count);
		//currentPage
		mav.addObject("currentPage", currentPage);
		//左侧列表页面
		Integer roleId = 1;
		//TODO
		List<ResourcePo> resoList = resourceService.findResourceList(roleId);
		mav.addObject("resoList", resoList);
		mav.addObject("lift", "sys-ul");
		return mav;
	}
	
	@RequestMapping(value="/del-a/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id") Integer id){
		userService.delUserT(id);
		userService.delUser(id);
		return "redirect:/sys-user/list-a";//重定向到action
	}
	
	@RequestMapping(value="/update-a/{id}",method=RequestMethod.GET)
	public ModelAndView update(@PathVariable("id") Integer id){
		User user = userService.findById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", user);
		mv.setViewName("user/update");
		return mv;
	}
	
	@RequestMapping(value="/update-a",method=RequestMethod.POST)
	public String update(User user){
		userService.updateUser(user);
		return "redirect:/sys-user/list-a";
	}
	@RequestMapping(value="/updatePass-a/{id}",method=RequestMethod.GET)
	public String updatePass(@PathVariable("id") Integer id){
		User user = userService.findById(id);
		user.setUserPassword(DigestUtils.md5Hex("123456"));
		userService.updateUser(user);
		return "redirect:/sys-user/list-a";
	}
	//updateT
	@RequestMapping(value="/updateT-a/{id}",method=RequestMethod.GET)
	public String updateT(@PathVariable("id") Integer id){
		userService.updateT(id);
		return "redirect:/sys-user/list-a";
	}
}

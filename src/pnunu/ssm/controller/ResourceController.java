package pnunu.ssm.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pnunu.ssm.po.ResourcePo;

@Controller
@RequestMapping(value="/sys-reso")
public class ResourceController extends BaseController {
	
	/** 
	 * @Title: listUI 
	 * @Description: 返回角色列表页面
	 * @return String
	 * @throws 
	 */
	@RequestMapping(value="/list-a",method=RequestMethod.GET)
	public ModelAndView list() {
		//资源初始化
		//InitDate id = new InitDate();
		//id.add(resourceService);
		//"admin/sys/resource"
		//TODO
		List<ResourcePo> resoList = resourceService.findResourceList(1);
		ModelAndView mav = new ModelAndView();
		mav.addObject("resoList", resoList);
		mav.addObject("url", "sys-reso/list-a");
		mav.setViewName("admin/sys/resource");
		mav.addObject("lift", "sys-ul");
		return mav;
	}
	
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public List<ResourcePo> listRole() {
		//System.out.println(roleService);
		//TODO
		List<ResourcePo> list = resourceService.findResourceList(1);
		return list;
	}
}

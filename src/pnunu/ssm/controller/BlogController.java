package pnunu.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pnunu.ssm.po.Blog;
import pnunu.ssm.po.ClassYear;
import pnunu.ssm.po.ResourcePo;
import pnunu.ssm.po.User;

@Controller
@RequestMapping(value="/jx-blog")
public class BlogController extends BaseController {

	@RequestMapping(value="/listBlog/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Blog blogById(HttpServletRequest request,@PathVariable("id") Integer id) {
		Blog blog = blogService.blogById(id);
		return blog;
	}
	@RequestMapping(value="/listBlog",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView listBlog(HttpServletRequest request) {
		String current = request.getParameter("currentPage");
		Integer currentPage = 0;
		if (current == null || "".equals(current)) {
			currentPage = 0;
		} else {
			currentPage = Integer.valueOf(current);
		}
		List<Blog> blogs = new ArrayList<Blog>();
		blogs = blogService.find(currentPage);
		//TODO
		List<ResourcePo> resoList = resourceService.findResourceList(1);
		Integer count = blogService.findCount();
		ModelAndView mav = new ModelAndView();
		mav.addObject("resoList", resoList);
		mav.addObject("blogs", blogs);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("url", "jx-blog/list-a");
		mav.addObject("lift", "jx-ul");
		mav.setViewName("admin/jx/blog");
		return mav;
	}
	//jx-classcode-list-a
	@RequestMapping(value="/list-a",method=RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request) {
		String current = request.getParameter("currentPage");
		Integer currentPage = 0;
		if (current == null || "".equals(current)) {
			currentPage = 0;
		} else {
			currentPage = Integer.valueOf(current);
		}
		List<Blog> blogs = new ArrayList<Blog>();
		blogs = blogService.find(currentPage);
		//TODO
		List<ResourcePo> resoList = resourceService.findResourceList(1);
		Integer count = blogService.findCount();
		ModelAndView mav = new ModelAndView();
		mav.addObject("resoList", resoList);
		mav.addObject("blogs", blogs);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("url", "jx-blog/list-a");
		mav.addObject("lift", "jx-ul");
		mav.setViewName("admin/jx/blog");
		return mav;
	}
	//jx-classcode-list-a
	@RequestMapping(value="/addUI",method=RequestMethod.GET)
	public ModelAndView add(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<ClassYear> classYears = classYearService.findByTea(user.getUserId());
		//System.out.println(user);
		//TODO
		List<ResourcePo> resoList = resourceService.findResourceList(1);
		ModelAndView mav = new ModelAndView();
		mav.addObject("resoList", resoList);
		mav.addObject("classYears", classYears);
		System.out.println(classYears.size());
		mav.addObject("url", "jx-blog/list-a");
		mav.addObject("lift", "jx-ul");
		mav.setViewName("admin/jx/blogadd");
		return mav;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String addTrue(HttpServletRequest request, Blog blog) {
		//System.out.println(blog);
		/**
		 * Blog [bolgId=null, classId=1, blogName=, blogText=<p><img src="http://127.0.0.1:8080/SSM/assets/umeditor/jsp/upload/20161218/20001482046445831.png" _src="http://127.0.0.1:8080/SSM/assets/umeditor/jsp/upload/20161218/20001482046445831.png"/></p>, blogDate=Sun Dec 18 15:34:19 CST 2016]
		 */
		/*String strBackUrl = "http://" + request.getServerName() //服务器地址  
        + ":"   
        + request.getServerPort()           //端口号  
        + request.getContextPath();      //项目名称  
		//http://127.0.0.1:8080/SSM
		System.out.println(strBackUrl);*/
		/*List<ResourcePo> resoList = resourceService.findResourceList(1);
		ModelAndView mav = new ModelAndView();
		mav.addObject("resoList", resoList);
		mav.addObject("url", "jx-blog/list-a");
		mav.addObject("lift", "jx-ul");
		mav.setViewName("admin/jx/blogadd");*/
		blogService.addBlog(blog);
		return "success";
	}
}

package pnunu.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import pnunu.ssm.po.ClassCode;
import pnunu.ssm.po.ClassYear;
import pnunu.ssm.po.ResourcePo;
import pnunu.ssm.po.User;

@Controller
@RequestMapping(value="/jx-classyear")
public class ClassYearController extends BaseController {

	@RequestMapping(value="/list-year/{id}",method=RequestMethod.GET)
	public ModelAndView listYear(HttpServletRequest request, @PathVariable("id")Integer id) {
		List<ClassYear> classYears = classYearService.findByCode(id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/year.jsp");
		modelAndView.addObject("classYears", classYears);
		return modelAndView;
	}
	@RequestMapping(value="/list-a",method=RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String current = request.getParameter("currentPage");
		Integer currentPage = 0;
		if (current == null || "".equals(current)) {
			currentPage = 0;
		} else {
			currentPage = Integer.valueOf(current);
		}
		//返回当前页，页面分页使用
		mav.addObject("currentPage", currentPage);
		//以上是分页的参数
		//页面数据
		List<ClassYear> classYears = new ArrayList<ClassYear>();
		classYears = classYearService.find(currentPage);
		Integer count = classYearService.count();
		//返回数据
		mav.addObject("classYears", classYears);
		mav.addObject("count", count);
		
		//左侧列表
		//TODO
		List<ResourcePo> resoList = resourceService.findResourceList(1);
		mav.addObject("resoList", resoList);
		mav.addObject("url", "jx-classyear/list-a");
		mav.addObject("lift", "jx-ul");
		
		//返回页面
		mav.setViewName("admin/jx/classyear");
		return mav;
	}
	
	/**课程分类信息查询*/
	@RequestMapping(value="/listCode",method=RequestMethod.GET)
	@ResponseBody
	public List<ClassCode> listCode() {
		List<ClassCode> classCodes = classcodeService.find(0);
		return classCodes;
	}
	
	@RequestMapping(value="/add-a",method=RequestMethod.POST)
	public String add(ClassYear classYear,HttpServletRequest request, MultipartFile pictureFile, HttpSession session) {
		if (pictureFile != null) {
			String fileName = pictureFile.getOriginalFilename();
			String suffix = fileName.substring(fileName.lastIndexOf("."));
			fileName = UUID.randomUUID().toString() + suffix;

			//获取文件的真是路径
			//String path = request.getSession().getServletContext().getRealPath("/uploads");
			String path = "D:/image/class";
			fileName = path + "/" + fileName;
			classYear.setImgUrl(fileName);
			try {
				InputStream is = pictureFile.getInputStream();
				File file = new File(fileName);
				FileUtils.copyInputStreamToFile(is, file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String codeId = request.getParameter("codeName");
		//System.out.println(codeId);
		if (session.getAttribute("user") != null) {
			classYear.setTeacher((User)session.getAttribute("user"));
			System.out.println(session.getAttribute("user")+"===");
		}
		classYear.setId(Integer.valueOf(codeId));
		if (classYear.getClassId() == null) {
			classYearService.add(classYear);
		} else {
			classYearService.update(classYear);
		}
		return "redirect:/jx-classyear/list-a";
	}
}

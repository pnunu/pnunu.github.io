package pnunu.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import pnunu.ssm.po.ClassCode;
import pnunu.ssm.po.ResourcePo;

@Controller
@RequestMapping(value="/jx-classcode")
public class ClasscodeController extends BaseController {

	@RequestMapping(value="/list-index",method=RequestMethod.GET)
	@ResponseBody
	public List<ClassCode> indexList(HttpServletRequest request) {
		List<ClassCode> classCodes = classcodeService.find(0);
		return classCodes;
	}
	//jx-classcode-list-a
	@RequestMapping(value="/list-a",method=RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request) {
		//资源初始化
		//InitDate id = new InitDate();
		//id.add(resourceService);
		//"admin/sys/resource"
		String current = request.getParameter("currentPage");
		Integer currentPage = 0;
		if (current == null || "".equals(current)) {
			currentPage = 0;
		} else {
			currentPage = Integer.valueOf(current);
		}
		//TODO
		List<ClassCode> classCodes = classcodeService.find(currentPage);
		List<ResourcePo> resoList = resourceService.findResourceList(1);
		Integer count = classcodeService.count();
		ModelAndView mav = new ModelAndView();
		mav.addObject("resoList", resoList);
		mav.addObject("url", "jx-classcode/list-a");
		mav.addObject("lift", "jx-ul");
		mav.addObject("classCodes", classCodes);
		mav.setViewName("admin/jx/classcode");
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		return mav;
	}
	
	/** 添加课程分类 */
	@RequestMapping(value="/add-a",method=RequestMethod.POST)
	public String add(ClassCode classCode,HttpServletRequest request, MultipartFile pictureFile) {
		if (pictureFile != null) {
			String fileName = pictureFile.getOriginalFilename();
			String suffix = fileName.substring(fileName.lastIndexOf("."));
			fileName = UUID.randomUUID().toString() + suffix;

			//获取文件的真是路径
			//String path = request.getSession().getServletContext().getRealPath("/uploads");
			String path = "D:/image";
			fileName = path + "/" + fileName;
			classCode.setImgurl(fileName);
			try {
				InputStream is = pictureFile.getInputStream();
				File file = new File(fileName);
				FileUtils.copyInputStreamToFile(is, file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		if (classCode.getId() == null) {
			classcodeService.add(classCode);
		} else {
			classcodeService.update(classCode);
		}
		return "redirect:/jx-classcode/list-a";
	}
	
/*	@RequestMapping(value="/image",method=RequestMethod.GET)
	public void image(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//final String path = request.getParameter("D:/image/fc581aeb-c9e7-42a4-9c53-1c8018c3dd2b.jpg");
		String path = request.getParameter("path");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		BufferedInputStream bis = null;
		OutputStream os = null;
		FileInputStream fileInputStream = new FileInputStream(new File(path));
		bis = new BufferedInputStream(fileInputStream);
		byte[] buffer = new byte[512];
		response.reset();
		response.setCharacterEncoding("UTF-8");
		// 不同类型的文件对应不同的MIME类型
		response.setContentType("image/png");
		// 文件以流的方式发送到客户端浏览器
		// response.setHeader("Content-Disposition","attachment;
		// filename=img.jpg");
		// response.setHeader("Content-Disposition", "inline;
		// filename=img.jpg");
		response.setContentLength(bis.available());
		os = response.getOutputStream();
		int n;
		while ((n = bis.read(buffer)) != -1) {
			os.write(buffer, 0, n);
		}
		bis.close();
		os.flush();
		os.close();
	}*/
}

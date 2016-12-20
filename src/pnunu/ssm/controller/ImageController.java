package pnunu.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/image")
public class ImageController {

	@RequestMapping(value="/upload",method=RequestMethod.GET)
	public String upload(){
		return "image/upload";
	}
	
	@RequestMapping(value="/upload",method=RequestMethod.POST)
	public String upload(HttpServletRequest request, MultipartFile pictureFile) {
		String fileName = pictureFile.getOriginalFilename();
		String suffix = fileName.substring(fileName.lastIndexOf("."));
		fileName = UUID.randomUUID().toString() + suffix;
		
		//获取文件的真是路径
		String path = request.getSession().getServletContext().getRealPath("/uploads");
		fileName = path + "/" + fileName;
		try {
			InputStream is = pictureFile.getInputStream();
			File file = new File(fileName);
			FileUtils.copyInputStreamToFile(is, file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("上传成功");
		
		return "redirect:/image/list";
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request) {
		File file = new File(request.getSession().getServletContext().getRealPath("/uploads"));
		//读取uploads所有文件展示在目标页面中
		File[] files = file.listFiles();
		ModelAndView mav = new ModelAndView();
		if(files != null && files.length >0) {
			List<String> fileNames = new ArrayList<String>();
			for (int i = 0; i < files.length; i++) {
				fileNames.add(files[i].getName());
			}
			mav.addObject("fileNames", fileNames);
		}
		mav.setViewName("/image/list");
		return mav;
	}
}

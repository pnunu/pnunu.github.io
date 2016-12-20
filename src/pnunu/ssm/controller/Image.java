package pnunu.ssm.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/")
public class Image {

	@RequestMapping(value="image",method=RequestMethod.GET)
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
	}
}

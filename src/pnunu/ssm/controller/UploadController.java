package pnunu.ssm.controller;
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;

import com.baidu.ueditor.um.Uploader;  
  
@Controller  
@RequestMapping("/umeditor")
public class UploadController {  
      
  
    @RequestMapping(value = "/upload/", method = { RequestMethod.POST })  
    public void upload(HttpServletRequest request, HttpServletResponse response)  
            throws Exception {  
  
        request.setCharacterEncoding("utf-8");  
        response.setContentType("text/html");  
        response.setCharacterEncoding("utf-8");  
  
        Uploader up = new Uploader(request);  
        up.setSavePath("upload");  
        String[] fileType = { ".gif", ".png", ".jpg", ".jpeg", ".bmp" };  
        up.setAllowFiles(fileType);  
        up.setMaxSize(10000); // 单位KB  
        up.upload();  
  
        String callback = request.getParameter("callback");  
  
        String result = "{\"name\":\"" + up.getFileName()  
                + "\", \"originalName\": \"" + up.getOriginalName()  
                + "\", \"size\": " + up.getSize() + ", \"state\": \""  
                + up.getState() + "\", \"type\": \"" + up.getType()  
                + "\", \"url\": \"" + up.getUrl() + "\"}";  
  
        result = result.replaceAll("\\\\", "\\\\");  
  
        if (callback == null) {  
            response.getWriter().print(result);  
        } else {  
            response.getWriter().print(  
                    "<script>" + callback + "(" + result + ")</script>");  
        }  
    }  
  
}  
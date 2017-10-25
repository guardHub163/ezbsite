package com.lyf.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/uplaod")
public class UploadController extends BasicController{

	public UploadController() {
		super(UploadController.class);
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("uplaod");
		return mv;
	}
	
	@RequestMapping(value="download",method = RequestMethod.GET)
	public void downloadFile(String fileName,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");

		response.setHeader("Content-Disposition", "attachment;fileName="+fileName);
		try {
			File file=new File(fileName);
			System.out.println(file.getAbsolutePath());
			InputStream inputStream=new FileInputStream("file/"+file);
			OutputStream os=response.getOutputStream();
			byte[] b=new byte[1024];
			int length;
			while((length=inputStream.read(b))>0){
				os.write(b,0,length);
			}
			inputStream.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}

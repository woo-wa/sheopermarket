package com.dev.shop.controller.admin;

import java.io.File;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dev.shop.model.product.vo.ProductVO;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	
	// 관리자 페이지로 이동
	@RequestMapping(value = "main.do")
	public String adminPage() {
		return "admin/main";
	}
	
	// 상품 등록 페이지
	@RequestMapping(value = "insertProduct.do", method = RequestMethod.GET)
	public String insertProduct() {
		return "admin/insertProduct";
	}
	// 상품 등록
	@RequestMapping(value = "insertProduct.do", method = RequestMethod.POST)
	public String insertProduct(ProductVO vo) {
		String filename="-";
		if(!vo.getFile1().isEmpty()) {
			filename = vo.getFile1().getOriginalFilename();
			String path = "D:\\dev\\workspace_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\shop\\resources\\images\\";
			//D:\dev\workspace_spring\spring02\src\main\webapp\WEB-INF\views\images
			try {
				new File(path).mkdir();
				vo.getFile1().transferTo(new File(path+filename));
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		vo.setPicture_url(filename);
		/* productService.insertProduct(vo); */

		return "admin/main";
	}
	
	@RequestMapping(value = "imageUpload.do", method = RequestMethod.POST)
	@ResponseBody
	public String imageUpload(MultipartFile file, HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		PrintWriter out = res.getWriter();
		// 업로드할 폴더 경로
		String realFolder = req.getSession().getServletContext().getRealPath("profileUpload");
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = realFolder + "\\" + "admin" + "\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("profileUpload/"+ str_filename);
		out.close();
		
		return filepath;
	}
}

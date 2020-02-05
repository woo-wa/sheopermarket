package com.dev.shop.controller.admin;

import java.io.File;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dev.shop.model.product.vo.ProductVO;
import com.dev.shop.service.product.ProductService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Inject
	ProductService productService;
	
	String path = "D:\\dev\\workspace_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\"
			+ "tmp0\\wtpwebapps\\shop\\resources\\images\\";
	
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
		System.out.println("상품 정보 : " + vo);
		String filename="-";
		
		  if(!vo.getFile1().isEmpty()) { 
			  UUID uuid = UUID.randomUUID();
			  filename = uuid.toString() + "_" + vo.getFile1().getOriginalFilename() ; 
			  String path = this.path + "title\\";
			  try {
				  new File(path).mkdir(); 
				  vo.getFile1().transferTo(new File(path+filename));
			  }catch(Exception e) { 
				  e.printStackTrace(); 
			  } 
		  } vo.setPicture_url(filename);
		 
		productService.insertProduct(vo);

		return "admin/main";
	}
	
	@RequestMapping(value = "imageUpload.do", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
	@ResponseBody
	public String imageUpload(MultipartFile file) throws Exception {
	
		// 업로드할 폴더 경로
		
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = path + "description\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		
		return ""+str_filename;
	}
}

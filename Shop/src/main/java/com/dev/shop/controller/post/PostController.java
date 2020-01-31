package com.dev.shop.controller.post;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.shop.model.address.vo.AddressVO;
import com.dev.shop.service.address.AddressService;

@Controller
@RequestMapping("/post/*")
public class PostController {
	
	@Inject
	AddressService addrService;

	@RequestMapping(value="post.do", method = RequestMethod.GET)
	public String post() {
		return "post/post.page";
	}
	
	// 배송지 리스트
	@ResponseBody
	@RequestMapping(value = "listAddress.do", method = RequestMethod.GET)
	public List<AddressVO> listAddress(Principal p) {
		List<AddressVO> list = addrService.selectAddress(p.getName());
		System.out.println(list.toString());
		return list;
	}
	
	// 배송지 추가
	@RequestMapping(value="insertAddress.do", method = RequestMethod.POST)
	public String insertAddress(AddressVO vo, Principal p) {
		vo.setUserid(p.getName());
		System.out.println("AddressVO = " + vo);
		addrService.insertAddress(vo);
		
		return "";
	}
	// 배송지 수정
	@RequestMapping(value = "updateAddress.do", method = RequestMethod.POST)
	@ResponseBody
	public String updateAddress(AddressVO vo) {
		System.out.println("Address = " + vo);
		addrService.updateAddress(vo);
		return "succ";
	}
	// 배송지 삭제
	@ RequestMapping(value = "deleteAddress.do", method = RequestMethod.POST)
	@ResponseBody
	public String deleteAddress(int addno) {
		
		addrService.deleteAddress(addno);
		
		return "succ";
	}
	
}

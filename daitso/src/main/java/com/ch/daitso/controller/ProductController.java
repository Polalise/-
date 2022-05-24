package com.ch.daitso.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.daitso.model.Likes;
import com.ch.daitso.model.Member;
import com.ch.daitso.model.Product;
import com.ch.daitso.service.LikesService;
import com.ch.daitso.service.MemberService;
import com.ch.daitso.service.PageBean;
import com.ch.daitso.service.ProductService;

@Controller
public class ProductController {
	//board zone
	@Autowired
	private ProductService ps;
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private LikesService ls;
	
	@RequestMapping("p_list")
	public String list(Product product,String pageNum,Model model ) {
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int rowPerPage = 10;
		int currentPage = Integer.parseInt(pageNum);
		int total = ps.getTotal(product);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		product.setStartRow(startRow); 
		product.setEndRow(endRow);
		List<Product> list = ps.list(product);
		PageBean pb = new PageBean(currentPage,rowPerPage,total);
		int p_num = total - startRow + 1;
		//매개변수로 넘어온데이터를 같은 url로 변경없이 전달할 때는 model.addAttribute 생략 가능 
		String[] title = {"작성자","제목","내용","제목+내용"};
//		String[] title2 = {"판매","구매"};
		model.addAttribute("title", title);
//	    model.addAttribute("title2", title2);
		model.addAttribute("p_num", p_num);
		model.addAttribute("pb", pb);
		model.addAttribute("list", list);
		return "/product/list"; 
	}
	@RequestMapping("p_insertForm")
	public String insertForm(int p_num, String pageNum,Model model,HttpSession session, Member member) {
		// 이 부분을 추가해야 회원 세션 정보가 넘어옴
		String id = (String)session.getAttribute("id");
		Member member2 = ms.selectId(id);
		model.addAttribute("member", member2);
		model.addAttribute("p_num",p_num);
		model.addAttribute("pageNum", pageNum);
		return "/product/insertForm"; 
	}
	@RequestMapping("p_insert")
	public String insert(Product product, String pageNum, Model model, HttpServletRequest request, HttpSession session) throws IOException {
		// 비회원이거나 ip추적이 필요한 경우
		product.setIp(request.getRemoteAddr());
		// num을 자동으로 1씩 증가
		int number = ps.getMaxNum();
		String thumnails = product.getFile().getOriginalFilename();
		String thumnails2 = product.getFile2().getOriginalFilename();
		String thumnails3 = product.getFile3().getOriginalFilename();
		String thumnails4 = product.getFile4().getOriginalFilename();
		String thumnails5 = product.getFile5().getOriginalFilename();
		product.setThumnails(thumnails);
					
		String real = session.getServletContext().getRealPath("/resources/upload");	
		if(thumnails != null && !thumnails.equals("")) {
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+ thumnails));
			fos.write(product.getFile().getBytes());
			fos.close();
		}
		
		if(thumnails2 != null && !thumnails2.equals("")) { 
			FileOutputStream fos2 = new FileOutputStream(new File(real+"/"+ thumnails2));
			fos2.write(product.getFile2().getBytes());
			fos2.close();
		}
		if (thumnails3 != null && !thumnails3.equals("")) {
			FileOutputStream fos3 = new FileOutputStream(new File(real+"/"+ thumnails3));
			fos3.write(product.getFile().getBytes());
			fos3.close();
		}
		if (thumnails4 != null && !thumnails4.equals("")) {
			FileOutputStream fos4 = new FileOutputStream(new File(real+"/"+ thumnails4));
			fos4.write(product.getFile().getBytes());
			fos4.close();
		}
		if (thumnails5 != null && !thumnails5.equals("")) {
			FileOutputStream fos5 = new FileOutputStream(new File(real+"/"+ thumnails));
			fos5.write(product.getFile().getBytes());
			fos5.close();
		}
		product.setP_num(number);
		System.out.println("product:" + product);
		int result = ps.insert(product);
		model.addAttribute("thumnails",thumnails); 
		model.addAttribute("thumnails2",thumnails2); 
		model.addAttribute("thumnails3",thumnails3); 
		model.addAttribute("thumnails4",thumnails4); 
		model.addAttribute("thumnails5",thumnails5); 
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		return "/product/insert";
	}
	@RequestMapping("p_view")
	public String view(int p_num, String pageNum, Model model, HttpSession session){
		ps.updateReadCount(p_num);
		Product product = ps.select(p_num);
		model.addAttribute("product", product); 
		model.addAttribute("pageNum", pageNum);
		
		String id = (String)session.getAttribute("id");
		Member member = ms.selectId(id);
		Likes likes2 = ls.searchList(id, p_num);
		model.addAttribute("member" , member);
		if(likes2 == null)
			model.addAttribute("likes", "");
		else model.addAttribute("likes", "1");
		return "/product/view";
	} 
	@RequestMapping("p_updateForm")
	public String updateForm(int p_num, String pageNum, Model model) {
		Product product = ps.select(p_num);
		model.addAttribute("product", product);
		model.addAttribute("pageNum", pageNum);
		return "/product/updateForm";
	}
	@RequestMapping("p_update")
	public String update(Product product,String pageNum,Model model, HttpSession session) throws IOException {
		int result = 0;
		Product product2 = ps.select(product.getP_num());
//		fileName에는 null(현재 사진 그대로 사용)일수도 있고 값(사진 변경)이 넘어올 수도 있다
		
		String thumnails = product.getFile().getOriginalFilename();
		String thumnails2 = product.getFile2().getOriginalFilename();
		String thumnails3 = product.getFile3().getOriginalFilename();
		String thumnails4 = product.getFile4().getOriginalFilename();
		String thumnails5 = product.getFile5().getOriginalFilename();
		String real = session.getServletContext().getRealPath("/resources/upload");	
		if (thumnails != null && !thumnails.equals("")) {
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+ thumnails));
			fos.write(product.getFile().getBytes());
			fos.close();
		}
		if(thumnails2 != null && !thumnails2.equals("")) { 
			FileOutputStream fos2 = new FileOutputStream(new File(real+"/"+ thumnails2));
			fos2.write(product.getFile2().getBytes());
			fos2.close();
		}
		if (thumnails3 != null && !thumnails3.equals("")) {
			FileOutputStream fos3 = new FileOutputStream(new File(real+"/"+ thumnails3));
			fos3.write(product.getFile().getBytes());
			fos3.close();
		}
		if (thumnails4 != null && !thumnails4.equals("")) {
			FileOutputStream fos4 = new FileOutputStream(new File(real+"/"+ thumnails4));
			fos4.write(product.getFile().getBytes());
			fos4.close();
		}
		if (thumnails5 != null && !thumnails5.equals("")) {
			FileOutputStream fos5 = new FileOutputStream(new File(real+"/"+ thumnails));
			fos5.write(product.getFile().getBytes());
			fos5.close(); 
		}
		result = ps.update(product);
		model.addAttribute("thumnails",thumnails); 
		model.addAttribute("thumnails2",thumnails2); 
		model.addAttribute("thumnails3",thumnails3); 
		model.addAttribute("thumnails4",thumnails4); 
		model.addAttribute("thumnails5",thumnails5); 
		model.addAttribute("result",result);
		model.addAttribute("pageNum", pageNum);
		return "/product/update";
	}
	@RequestMapping("p_delete")
	public String delete(int p_num,String pageNum, Model model) {
		int result = 0;
		Product product = ps.select(p_num);
		result = ps.delete(product);
		model.addAttribute("result",result);
		model.addAttribute("pageNum", pageNum);
		return "/product/delete"; 
	}
}
	//photo zone
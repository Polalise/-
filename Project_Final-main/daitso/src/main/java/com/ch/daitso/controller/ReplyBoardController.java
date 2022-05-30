package com.ch.daitso.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.daitso.model.Product;
import com.ch.daitso.model.ReplyBoard;
import com.ch.daitso.service.ProductService;
import com.ch.daitso.service.ReplyBoardService;
@Controller
public class ReplyBoardController {
	@Autowired
	private ReplyBoardService rbs;
	@Autowired
	private ProductService ps;
	@RequestMapping("replyList")
	public String replyList( int bno, Model model) {
		Product product = ps.select(bno);
		List<ReplyBoard> rbdList = rbs.list(bno);
		model.addAttribute("product", product);
		model.addAttribute("rbdList", rbdList);
		return "product/replyList";
	}
	@RequestMapping("rInsert")
	public String rInsert(ReplyBoard rb) {
		rbs.insert(rb);
		return "redirect:replyList.do?bno="+rb.getBno();			
	}
	@RequestMapping("rUpdate")
	public String rUpdate(ReplyBoard rb) {
		rbs.update(rb);
		return "redirect:replyList.do?bno="+rb.getBno();
	}
	@RequestMapping("rDelete")
	public String rDelete(ReplyBoard rb) {
		System.out.println("rb3:" + rb);
		rbs.delete(rb);
		return "redirect:replyList.do?bno="+rb.getBno();
	}
} 
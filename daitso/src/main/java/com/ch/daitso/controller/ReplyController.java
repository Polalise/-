package com.ch.daitso.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.daitso.model.Member;
import com.ch.daitso.model.Product;
import com.ch.daitso.model.Reply;
import com.ch.daitso.service.MemberService;
import com.ch.daitso.service.ProductService;
import com.ch.daitso.service.ReplyService;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService rs;
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private ProductService ps;
	
	@RequestMapping("replyWriteForm2")
	public String replyWriteForm(int rno,int p_num,String pageNum,Model model) {
		   
		   model.addAttribute("p_num",p_num);
		   model.addAttribute("rno",rno);
		   model.addAttribute("pageNum",pageNum);
		return "admin/review/replyWriteForm";
	}
	@RequestMapping("replyWrite2")
	public String replyWrite(Reply board, Model model, HttpSession session,int rating,Member member,Product product
			,String pageNum,int rno,int p_num) throws IOException {
		int result = 0;
		    // num을 자동을 1씩 증가
	 	    int number = rs.getMaxNum();		
			board.setRno(number);
			//별점에 대한 등급영향 grage = rating
			Product product2 = ps.select2(product.getP_num()); //판매자 아이디 정보가져와
			ms.star(board.getRating(),product2.getId());
			//일단 판매자 게시물(num)에 대하여 인서트를 한다
			result = rs.insert(board);
			
		model.addAttribute("board", board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum",pageNum);
		return "admin/review/replyWrite";
	}
	@RequestMapping("replyList2")
	   public String replyList(int p_num,String pageNum,Model model,Product product,Member member) {
			/* NoticeBoard board = ns.select(num); */
		Product product2 = ps.select2(product.getP_num()); //판매자 아이디 정보가져와
        member.setId(product2.getId());  // 저장
		//하나의 게시물에 여러 댓글
		List<Reply> rbdList = rs.list(member.getId()); // 판매자에 대한 리뷰라 판매자 아이디
	//	model.addAttribute("product", product);
		model.addAttribute("rbdList", rbdList);
		  
		   return "admin/review/replyList";
	   }
	@RequestMapping("rDelete2")
	public String rDelete(Reply rb) {
		rs.delete(rb);
		return "redirect:replyList2.do?num="+rb.getNum();
	}
	//댓글 수정
		@RequestMapping("rUpdate2")
		public String rUpdate(Reply rb) {
			rs.update(rb);
			return "redirect:replyList2.do?num="+rb.getNum();
		}
	
}

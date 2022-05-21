package com.ch.daitso.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.daitso.model.EventBoard;
import com.ch.daitso.service.EventService;
import com.ch.daitso.service.PageBean;

@Controller
public class EventController {
   @Autowired
   private EventService es;
   
   @RequestMapping("eventList")
   public String eventList(EventBoard board,String pageNum,Model model) {
	   if(pageNum == null || pageNum.equals("")) pageNum = "1";
	   int rowPerPage = 10;
	   int currentPage = Integer.parseInt(pageNum);
//	   int total = es.getTotal();
	   int total = es.getTotal(board);
	   int startRow = (currentPage - 1) * rowPerPage + 1;
	   int endRow  = startRow + rowPerPage -1;
	   board.setStartRow(startRow);
	   board.setEndRow(endRow);
//	   List<EventBoard> list = es.list(startRow,endRow);
	   List<EventBoard> list = es.list(board);
	   int num = total - startRow + 1;
	   //페이징 하기
	   PageBean pb = new PageBean(currentPage,rowPerPage,total);
	   //답글 번호 순서 
	 
	   String[] title = {"작성자","제목","내용","제목+내용"};
		model.addAttribute("title", title);
	   model.addAttribute("num",num);
	   model.addAttribute("pb",pb);
	   model.addAttribute("list",list);
	   model.addAttribute("total",total);
	  
	   return "admin/event_board/event";
   }
   @RequestMapping("eventWriteForm")
   public String eventWriteForm(int e_num,String pageNum,Model model) {

	   model.addAttribute("e_num",e_num);
	   model.addAttribute("pageNum",pageNum);

	   return "admin/event_board/eventWriteForm";
   }
   @RequestMapping("eventWrite")
	public String eventWrite(EventBoard board, Model model, HttpSession session
			,String pageNum,int e_num) throws IOException {
		int result = 0;
		// num을 자동을 1씩 증가
	 	   int number = es.getMaxNum();
//			String e_fileName = board.getFile().getOriginalFilename();
//			board.setE_fileName(e_fileName);
//			String real = session.getServletContext().getRealPath("/resources/upload");
//			FileOutputStream fos = new FileOutputStream(new File(real+"/"+e_fileName));
//			fos.write(board.getFile().getBytes());
//			fos.close();
	 	  String e_fileName = board.getFile().getOriginalFilename();
	    	if (e_fileName != null && !e_fileName.equals("")) {// 값이 있을때만 처리
	    		board.setE_fileName(e_fileName);
	    		String real = session.getServletContext().getRealPath("resources/upload");
	    		FileOutputStream fos = new FileOutputStream(new File(real+"/"+e_fileName));
	    		fos.write(board.getFile().getBytes());
	    		fos.close();
	    	}
			board.setE_num(number);
			result = es.insert(board);

		model.addAttribute("result", result);
		model.addAttribute("pageNum",pageNum);
		return "admin/event_board/eventWrite";
	}
   @RequestMapping("eventView")
   public String eventView(int e_num,String pageNum,Model model) {
	   //일단 조회수를 증가시켜야함 
	   es.updateReadCount(e_num);
	   // 번호로 대상 정보 가져오기
	   EventBoard board = es.select(e_num);
	   model.addAttribute("board",board);
	   model.addAttribute("pageNum",pageNum);
	   return "admin/event_board/eventView";
   }
   @RequestMapping("eventUpdateForm")
   public String EventUpdateForm(int e_num,String pageNum,Model model) {
	   EventBoard board = es.select(e_num);
	   model.addAttribute("e_num",e_num);
	   model.addAttribute("pageNum",pageNum);
	   model.addAttribute("board",board);
	   return "admin/event_board/eventUpdateForm";
   }
   @RequestMapping("eventUpdate")
   public String eventUpdate(EventBoard board,Model model,String pageNum,int e_num,HttpSession session) throws IOException {
	   int result = 0;
	   //fileName에는 null(현재거 그대로 사용)일수도 있고 값(사진변경)이 넘어 올 수 도 있다.
   	String e_fileName = board.getFile().getOriginalFilename();
   	if (e_fileName != null && !e_fileName.equals("")) {// 값이 있을때만 처리
   		board.setE_fileName(e_fileName);
   		String real = session.getServletContext().getRealPath("resources/upload");
   		FileOutputStream fos = new FileOutputStream(new File(real+"/"+e_fileName));
   		fos.write(board.getFile().getBytes());
   		fos.close();
   	}
	    result = es.update(board);

	   model.addAttribute("result",result);
	   model.addAttribute("pageNum",pageNum);
	   model.addAttribute("e_num",e_num);
	   return "admin/event_board/eventUpdate";
   }
//   @RequestMapping("eventDeleteForm")
//   public String updateDeleteForm(Model model,String pageNum,int e_num) {
//	   EventBoard board = es.select(e_num);
//	   model.addAttribute("pageNum",pageNum);
//	   model.addAttribute("e_num",e_num);
//	   model.addAttribute("board",board);
//	   return "admin/event_board/eventDeleteForm";
//   }
   @RequestMapping("eventDelete")
   public String delete(Model model,String pageNum,int e_num,EventBoard board) {
	   int result = 0;
	   result= es.delete(e_num);

	   model.addAttribute("result",result);
	   model.addAttribute("pageNum",pageNum);
	   model.addAttribute("e_num",e_num);
	   
	   return "admin/event_board/eventDelete";
   }
}

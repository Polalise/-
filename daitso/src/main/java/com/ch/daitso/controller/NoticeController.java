package com.ch.daitso.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.daitso.model.Member;
import com.ch.daitso.model.NoticeBoard;
import com.ch.daitso.service.MemberService;
import com.ch.daitso.service.NoticeService;
import com.ch.daitso.service.PageBean;
@Controller
public class NoticeController {
	@Autowired
	private NoticeService ns;
	
	@Autowired
	private MemberService ms;
	//고객센터
	@RequestMapping("adminMain2")
	public String main2(HttpSession session,Member member,Model model) {
		 // String id = (String)session.getAttribute("id");
		 // session.setAttribute("id", member.getId());
		 // model.addAttribute("id", id);
		  model.addAttribute("member", member);
		return "admin/consumerCenter/main2";
	}
	@RequestMapping("adminMain")
	public String main(HttpSession session,Member member,Model model) {
		 // String id = (String)session.getAttribute("id");
		 // session.setAttribute("id", member.getId());
		 // model.addAttribute("id", id);
		  model.addAttribute("member", member);
		return "admin/consumerCenter/main";
	}
	  @RequestMapping("noticeList")
	   public String noticeList(NoticeBoard board,String pageNum,Model model,HttpSession session,Member member) {
		   if(pageNum == null || pageNum.equals("")) pageNum = "1";
		   int rowPerPage = 10;
		   int currentPage = Integer.parseInt(pageNum);
//		   int total = ns.getTotal();
		   int total = ns.getTotal(board);
		   int startRow = (currentPage - 1) * rowPerPage + 1;
		   int endRow  = startRow + rowPerPage -1;
		   board.setStartRow(startRow);
			board.setEndRow(endRow);
//		   List<NoticeBoard> list = ns.list(startRow,endRow);
		   List<NoticeBoard> list = ns.list(board);
		   int num = total - startRow + 1;
		   //페이징 하기
		   PageBean pb = new PageBean(currentPage,rowPerPage,total);
		   //답글 번호 순서 
		   //id 세션가져오기
		//  session.setAttribute("id", member.getId());
		//  String id = (String)session.getAttribute("id");
		//  model.addAttribute("id", id);
			model.addAttribute("member", member);
			//검색 한글로 계속유지하게 
			String[] title = {"제목","내용","제목+내용"};
			model.addAttribute("title", title);
		   model.addAttribute("num",num);
		   model.addAttribute("pb",pb);
		   model.addAttribute("list",list);
		   model.addAttribute("total",total);
		//   model.addAttribute("id",id);
		   return "admin/notice_board/noticeList";
	   }
	  @RequestMapping("noticeWriteForm")
	   public String noticeWriteForm(int num,String pageNum,Model model,HttpSession session,Member member) {
	//	  String id = (String)session.getAttribute("id");
	//	  session.setAttribute("id", member.getId());
			model.addAttribute("member", member);
		 //  model.addAttribute("id",id);
		   model.addAttribute("num",num);
		   model.addAttribute("pageNum",pageNum);

		   return "admin/notice_board/noticeWriteForm";
	   }
	  @RequestMapping("noticeWrite")
	  public String noticeWrite(NoticeBoard board, Model model, HttpSession session,Member member
				,String pageNum,int num) throws IOException {
		//  String id = (String)session.getAttribute("id");
		//  session.setAttribute("id", member.getId());
			model.addAttribute("member", member);
			int result = 0;
			// num을 자동을 1씩 증가
		 	   int number = ns.getMaxNum();
//				String fileName = board.getFile().getOriginalFilename();
//				board.setFileName(fileName);
//				String real = session.getServletContext().getRealPath("/resources/upload");
//				FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
//				fos.write(board.getFile().getBytes());
//				fos.close();
		 	//fileName에는 null(현재거 그대로 사용)일수도 있고 값(사진변경)이 넘어 올 수 도 있다.
		    	String fileName = board.getFile().getOriginalFilename();
		    	if (fileName != null && !fileName.equals("")) {// 값이 있을때만 처리
		    		board.setFileName(fileName);
		    		String real = session.getServletContext().getRealPath("resources/upload");
		    		FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
		    		fos.write(board.getFile().getBytes());
		    		fos.close();
		    	}
				board.setNum(number);
				result = ns.insert(board);

		 //  model.addAttribute("id",id);
			model.addAttribute("result", result);
			model.addAttribute("pageNum",pageNum);
	    	return "admin/notice_board/noticeWrite";
	    }
	  @RequestMapping("noticeView")
	  public String eventView(int num,String pageNum,Model model) {
		   //일단 조회수를 증가시켜야함 
		   ns.updateReadCount(num);
		   // 번호로 대상 정보 가져오기
		   NoticeBoard board = ns.select(num);
		   model.addAttribute("board",board);
		   model.addAttribute("pageNum",pageNum);
			return "admin/notice_board/noticeView";

	  }
	  @RequestMapping("noticeUpdateForm")
	   public String EventUpdateForm(int num,String pageNum,Model model) {
		  NoticeBoard board = ns.select(num);
		   model.addAttribute("num",num);
		   model.addAttribute("pageNum",pageNum);
		   model.addAttribute("board",board);
		   return "admin/notice_board/noticeUpdateForm";
		}
	  @RequestMapping("noticeUpdate")
	   public String noticeUpdate(NoticeBoard board,Model model,String pageNum,int num,HttpSession session) throws IOException {
		   int result = 0;
		    //fileName에는 null(현재거 그대로 사용)일수도 있고 값(사진변경)이 넘어 올 수 도 있다.
	    	String fileName = board.getFile().getOriginalFilename();
	    	if (fileName != null && !fileName.equals("")) {// 값이 있을때만 처리
	    		board.setFileName(fileName);
	    		String real = session.getServletContext().getRealPath("resources/upload");
	    		FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
	    		fos.write(board.getFile().getBytes());
	    		fos.close();
	    	}
	    	result = ns.update(board);
		   model.addAttribute("result",result);
		   model.addAttribute("pageNum",pageNum);
		   model.addAttribute("num",num);
			return "admin/notice_board/noticeUpdate";
		}
//	     @RequestMapping("noticeDeleteForm")
//	     public String updateDeleteForm(Model model,String pageNum,int num,Member member) {
//	  	   NoticeBoard board = ns.select(num);
//	  	   model.addAttribute("pageNum",pageNum);
//	  	   model.addAttribute("num",num);
//	  	   model.addAttribute("board",board);
//	  	   
//			return "admin/notice_board/noticeDeleteForm";
//		}
	     @RequestMapping("noticeDelete")
	     public String delete(Model model,String pageNum,int num,NoticeBoard board) {
	  	   int result = 0;

	  	   result= ns.delete(num);
	  	   model.addAttribute("result",result);
	  	   model.addAttribute("pageNum",pageNum);
	  	   model.addAttribute("num",num);
	 		return "admin/notice_board/noticeDelete";
	 	}
	     @RequestMapping("download")
	     public void fileDown(String fileName , HttpServletResponse response) throws Exception {

	     // 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
	     byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\DevSpace\\final_project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\daitso\\resources\\upload/" + fileName));

	     response.setContentType("application/octet-stream");
	     response.setContentLength(fileByte.length);
	     response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(fileName, "UTF-8") + "\";");
	     response.getOutputStream().write(fileByte);
	     response.getOutputStream().flush();
	     response.getOutputStream().close();
	 }

	   
	     
}


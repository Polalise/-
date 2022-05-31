package com.ch.daitso.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.daitso.model.Member;
import com.ch.daitso.model.NoticeBoard;
import com.ch.daitso.model.Product;
import com.ch.daitso.model.Report;
import com.ch.daitso.service.MemberService;
import com.ch.daitso.service.PageBean;
import com.ch.daitso.service.ProductService;
import com.ch.daitso.service.ReportService;

@Controller
public class ReportController {
	@Autowired
	private ReportService rs;
	@Autowired
	private MemberService ms;
	@Autowired
	private ProductService ps;
	
//	신고 팝업창
	@RequestMapping("reportForm")
	public String reportForm(Report report,int p_num,Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		Member member = ms.selectId(id);
		Product product = ps.select(p_num);
		report.setP_num(p_num);
		report.setReporter_id(id);
		String badId = product.getId();
		System.out.println("badId : " + badId );
		report.setCriminal_id(badId);
		model.addAttribute("report", report);
		model.addAttribute("product",product);
		return "/report/reportForm";
	}
//	신고전송	
	@RequestMapping("reportAction")
	public String reportAction(Report report, Model model,HttpSession session) {
	int reportNum = rs.report_getMaxNum();
	report.setReport_num(reportNum);
	int result = 0;
	result = rs.addReport(report);
	model.addAttribute("result",result);
	System.out.println("result : " + result);
	System.out.println(report);
	return "/report/reportAction";
	}
//	신고 여부 체크
	@RequestMapping("reportList")
	   public String reportList(Report report,String pageNum,Model model,HttpSession session,Member member) {
		   if(pageNum == null || pageNum.equals("")) pageNum = "1";
		   int rowPerPage = 10;
		   int currentPage = Integer.parseInt(pageNum);
		   int total = rs.getTotal(report);
		   int startRow = (currentPage - 1) * rowPerPage + 1;
		   int endRow  = startRow + rowPerPage -1;
		   report.setStartRow(startRow);
		   report.setEndRow(endRow);
		   List<Report> list = rs.list(report);
		   int num = total - startRow + 1;
		   //페이징 하기
		   PageBean pb = new PageBean(currentPage,rowPerPage,total);
		   //답글 번호 순서 

			//검색 한글로 계속유지하게 
			String[] title = {"작성자","신고문항","신고내용","문항+내용"};
			model.addAttribute("title", title);
		   model.addAttribute("num",num);
		   model.addAttribute("pb",pb);
		   model.addAttribute("list",list);
		   model.addAttribute("total",total);

		   return "report/reportList";
	   }
	 @RequestMapping("reportView")
	  public String reportView(int report_num,String pageNum,Model model) {
		
		   // 번호로 대상 정보 가져오기
		   Report report = rs.select(report_num);
		   model.addAttribute("report",report);
		   model.addAttribute("pageNum",pageNum);
			return "report/reportView";

	  }
	  @RequestMapping("reportUpdateForm")
	   public String reportUpdateForm(int report_num,String pageNum,Model model) {
		  Report report = rs.select(report_num);
		   model.addAttribute("report_num",report_num);
		   model.addAttribute("pageNum",pageNum);
		   model.addAttribute("report",report);
		   return "report/reportUpdateForm";
		}
	 @RequestMapping("reportUpdate")
	   public String EventUpdateForm(Member member,int report_num,Report report ,String pageNum,Model model) {

		  int result = 0;
		  //패널티 부여 먼저 
		  member.setId(report.getCriminal_id());
		  ms.penalty(report.getScore(),member.getId());
//		  ms.penalty(report.getScore(),report.getCriminal_id());
		  //글 업데이트형식 (처리상태 바꾸려고)
		  result = rs.update(report);
	  

		   model.addAttribute("result",result);
		   model.addAttribute("pageNum",pageNum);
		   model.addAttribute("report_num",report_num);
			return "report/reportUpdate";
		}
//		신고 여부 체크
		@RequestMapping("reportmyList")
		   public String reportmyList(Report report,String pageNum,Model model,HttpSession session,Member member) {
			   if(pageNum == null || pageNum.equals("")) pageNum = "1";
			   int rowPerPage = 10;
			   int currentPage = Integer.parseInt(pageNum);
//			   //신고한 사람
//			   int total = rs.getTotal2(report.getReporter_id());
//			   String reporterId = report.getReporter_id();
//			   List<Report> list2 = rs.list2(report.getReporter_id());
//			   //신고당한 사람
//			   String criminalId = report.getCriminal_id();
//			   List<Report> list3 = rs.list3(report.getCriminal_id());
//			   int total2 = rs.getTotal3(report.getCriminal_id());
			   String id = (String)session.getAttribute("id");
			 //  report.setReporter_id("id");
		
			   //신고당한사람
				/*
				 * Product product = ps.select(p_num); String id2 = product.getId();
				 */
			  // System.out.println("id="+id);
			   int total = rs.getTotal2(id);
			   List<Report> list2 = rs.list2(id);
		 
			   int startRow = (currentPage - 1) * rowPerPage + 1;
			   int endRow  = startRow + rowPerPage -1;
//			   report.setStartRow(startRow);
//			   report.setEndRow(endRow);
			  
//			   //신고한사람 총넘버
              int num = total - startRow + 1;
//			   //신고당한사람 총넘버
//			   int num2 = total2 - startRow + 1;
			   
            //   System.out.println("size="+list2.size());
            //  System.out.println("list2="+list2);
			   //페이징 하기
			   PageBean pb = new PageBean(currentPage,rowPerPage,total);
			   //답글 번호 순서 

				//검색 한글로 계속유지하게 
				String[] title = {"작성자","신고문항","신고내용","문항+내용"};
				model.addAttribute("title", title);
			  //신고한사람
//				model.addAttribute("reporterId",reporterId);
		     model.addAttribute("num",num);
    		   model.addAttribute("list2",list2);
			   model.addAttribute("total",total);
			   model.addAttribute("pb",pb);
			   model.addAttribute("id",id);
			   
			   //신고당한사람
//			   model.addAttribute("criminalId",criminalId);
//			   model.addAttribute("num",num);
//			   model.addAttribute("list3",list3);
//			   model.addAttribute("total2",total);
//			   model.addAttribute("num2",num2);
			   return "report/reportmyList";
		   }
}
 
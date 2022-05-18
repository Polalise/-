package com.ch.daitso.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.daitso.model.Member;
import com.ch.daitso.model.Product;
import com.ch.daitso.model.Report;
import com.ch.daitso.service.MemberService;
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
		String badId = product.getP_writer();
		report.setCriminal_id(badId);
		model.addAttribute("report", report);
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
	
}

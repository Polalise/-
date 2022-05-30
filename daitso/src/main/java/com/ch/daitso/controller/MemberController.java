package com.ch.daitso.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.daitso.model.Member;
import com.ch.daitso.model.Product;
import com.ch.daitso.service.EventService;
import com.ch.daitso.service.MemberService;
import com.ch.daitso.service.NoticeService;
import com.ch.daitso.service.PageBean;
import com.ch.daitso.service.ProductService;

@Controller
public class MemberController {

	@Autowired
	private MemberService ms;
	
	@Autowired
	private ProductService ps;
	
	@Autowired
    private NoticeService ns ;
   
	@Autowired
    private EventService es ;
     
	
	// 임시로 만든 메인 화면
	@RequestMapping("main1")
	public String main() {
		return "main";
	}
	
	// 메일 보내기 
	@Autowired
	private JavaMailSender jMailSender;
	
	// 암호화
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	// 로그인 폼
	@RequestMapping("loginForm")
	public String loginForm() {
		return "/member/loginForm";
	}
	
	// 회원가입 폼
	@RequestMapping("joinForm")
	public String joinForm() {
		return "/member/joinForm";
	}
	
	// 회원가입, 아이디 중복 체크
	@RequestMapping(value = "idChk", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp를 통하지 않고 직접 문자 전달해
	public String idChk1(String id) {
		String msg = "";
		Member member = ms.selectId(id);
		if(member == null) msg = "사용 가능한 아이디 입니다.";
		else msg = "중복된 아이디 입니다.";
		return msg;
	}
	
	// 회원가입, 별명 중복 체크
	@RequestMapping(value = "nickChk", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp를 통하지 않고 직접 문자 전달해
	public String nickChk1(String nickName) {
		String msg1 = "";
		Member member = ms.selectNick(nickName);
		if(member == null) msg1 = "사용 가능한 별명 입니다.";
		else msg1 = "중복된 별명 입니다.";
		return msg1;
	}
	
	// 회원 가입(가입)
	@RequestMapping("m_join")
	public String join(Member member, Model model, HttpSession session) {
		int result = 0; 
		Member member2 = ms.selectId(member.getId());
		if (member2 == null) {
			// 가입 시 기본 프로필 지정
			String photoName = "basic3.jpg";
			member.setPhotoName(photoName);
			
			// BCryptPasswordEncoder를 이용한 암호화
			String encPassword = passwordEncoder.encode(member.getPassword());
			member.setPassword(encPassword);
			result = ms.insert(member);
		} else {
			result = -1; // 이미 있는 아이디
		}
		model.addAttribute("result", result);
		return "/member/join";
	}
	
	// 로그인
	@RequestMapping("login")
	public String login(Member member, Model model, HttpSession session, String pageNum, Product product) {
		int result = 0;
		// member : 화면에서 입력한 데이터, member2 : 읽은 데이터 아이디로 검색할 데이터가 있으면 중복입력
		Member member2 = ms.selectId(member.getId());
		if(member2 == null || member2.getDel().equals("y")) {
			result = -1;
		} else {
			if (passwordEncoder.matches(member.getPassword(), member2.getPassword())) {
				result = 1;
				session.setAttribute("id", member.getId());
				// 로그인 했을때 리스트 보여주려고 리스트 가져옴 
				if (pageNum == null || pageNum.equals("")) pageNum = "1";
				int rowPerPage = 10;
				int currentPage = Integer.parseInt(pageNum);
				int total = ps.getTotal(product);
				int startRow = (currentPage - 1) * rowPerPage + 1;
				int endRow = startRow + rowPerPage - 1;
				List<Product> list = ps.list(product);
				PageBean pb = new PageBean(currentPage,rowPerPage,total);
				int p_num = total - startRow + 1;
				model.addAttribute("p_num", p_num);
				model.addAttribute("pb", pb);
				model.addAttribute("list", list);
				
			}
		}
		model.addAttribute("result", result);
		return "/member/login";
	}
	
	// 로그인 하면 갈 화면 지정
	@RequestMapping("m_main")
	public String main(Member member, Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		if (id != null && !id.equals("")) {
			member = ms.selectId(id);
			model.addAttribute("member", member);
		}
		return "/member/main";
	}
	
	// 개인정보 상세 보기
	@RequestMapping("m_view")
	public String view(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		Member member = ms.selectId(id);
		model.addAttribute("member", member);
		return "/member/view";
	}
	
	// 내 정보 수정 폼
	@RequestMapping("updateForm")
	public String update(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		Member member = ms.selectId(id);
		model.addAttribute("member", member);
		return "/member/updateForm";
	}
	
	// 내 정보 수정
	@RequestMapping("m_update")
	public String update(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		// fileName에는 null(현재 사진 그대로 사용)일 수도 있고 값(사진 변경한 경우)이 넘어 올 수도 있다
		String photoName = member.getFile().getOriginalFilename();
		
		// 값이 있을 때만 처리
		if (photoName != null && !photoName.equals("")) {
			member.setPhotoName(photoName);
			String real = session.getServletContext().getRealPath("/resources/upload");
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+photoName));
			fos.write(member.getFile().getBytes());
			fos.close();
		}
		String encPassword = passwordEncoder.encode(member.getPassword());
		member.setPassword(encPassword);
		result = ms.update(member);
		model.addAttribute("result", result);
		
		return "/member/update";
	}
	
	// 로그 아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/member/logout";
	}
	
	// 회원 탈퇴
	@RequestMapping("m_delete")
	public String delete(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		int result = ms.delete(id);
		// 탈퇴한 사람은 session 삭제 해야함
		if(result>0) session.invalidate();
		model.addAttribute("result", result);
		return "/member/delete";
	}
	
	// 아이디 찾기 폼
	@RequestMapping("findIdForm")
	public String findIdForm() {
		return "/member/findIdForm";
	}
	
	// 아이디 찾기, 메일 보내기
	@RequestMapping("findIdCheck")
	public String findIdCheck(Member member, Model model) {
		int result = 0;
		Member member2 = ms.selectFindId(member);
		
		if(member2 != null) {
			result = 1;		// 이름과 이메일이 일치한 회원이 존재
			model.addAttribute("member", member2);
			
			// 난수 생성
			int msg = 0;
			Random random = new Random();
			int num = random.nextInt(999999)+100000; // 6자리 난수 생성
			msg = num;
			
			try {
				MimeMessage message = jMailSender.createMimeMessage();
				MimeMessageHelper mmh = new MimeMessageHelper(message, true, "utf-8");
				
				mmh.setSubject("다있소 본인 확인 인증 번호 입니다.");
				mmh.setText("인증 번호 : "+ msg);
				mmh.setTo(member.getEmail());
				mmh.setFrom("enadlekd@naver.com");
				jMailSender.send(message);
			} catch (Exception e) {
				result = 0; // 메일이 제대로 안갔음
			}
			
			model.addAttribute("msg", msg); // 내가 보낸 난수 다시 홈페이지로 보내서 확인하기
		} else {
			result = -1; // 없는 회원 정보임
		}
		model.addAttribute("result", result);
		
		return "/member/findIdCheck";
	}
	
	// 아이디 찾기, 난수와 일치여부 확인 후 데이터 보내기
	@RequestMapping("findIdResult")
	public String findIdResult(Member member, Model model) {
		model.addAttribute("id", member.getId());
		model.addAttribute("name", member.getName());
		return "/member/findIdResult";
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping("findPasswordForm")
	public String findPasswordForm() {
		return "/member/findPasswordForm";
	}
	
	// 비밀번호 찾기, 메일 보내기
	@RequestMapping("findPasswordCheck")
	public String findPasswordCheck(Member member, Model model) {
		int result = 0;
		Member member2 = ms.selectFindPassword(member);
		
		if(member2 != null) {
			result = 1;		// 아이디와 이메일이 일치한 회원이 존재
			model.addAttribute("member", member2);
			
			// 난수 생성
			int msg = 0;
			Random random = new Random();
			int num = random.nextInt(999999)+100000; // 6자리 난수 생성
			msg = num;
			
			try {
				MimeMessage message = jMailSender.createMimeMessage();
				MimeMessageHelper mmh = new MimeMessageHelper(message, true, "utf-8");
				
				mmh.setSubject("다있소 본인 확인 인증 번호 입니다.");
				mmh.setText("인증 번호 : "+ msg);
				mmh.setTo(member.getEmail());
				mmh.setFrom("enadlekd@naver.com");
				jMailSender.send(message);
				
			} catch (Exception e) {
				result = 0; // 메일이 제대로 안갔음
			}
			
			model.addAttribute("msg", msg); // 내가 보낸 난수 다시 홈페이지로 보내서 확인하기
		} else {
			result = -1; // 없는 회원 정보임
		}
		model.addAttribute("result", result);
		
		return "/member/findPasswordCheck";
	}
	
	// 인증 후 비밀번호 새로 정하는 폼
	@RequestMapping("findPasswordResultForm")
	public String findPasswordResultForm(Member member, Model model) {
		model.addAttribute("id", member.getId());
		return "/member/findPasswordResultForm";
	}
	
	// 비밀번호 바꾸고 로그인 화면으로 보내기
	@RequestMapping("findPasswordUpdate")
	public String findPasswordUpdate(Member member, Model model) {
		int result = 0;
		
		// 비밀번호 바꾸더라도 암호화는 해야제~
		String encPassword = passwordEncoder.encode(member.getPassword());
		member.setPassword(encPassword);
		result = ms.updatePassword(member);
		model.addAttribute("result", result);
		
		return "/member/findPasswordUpdate";
	}
	 @RequestMapping("adminMemberList")
	  	public String adminMemberList(Locale locale,Member member, String pageNum, Model model) {
	  		if(pageNum == null || pageNum.equals("")) {
	  			pageNum = "1" ;
	  		}
	  		int currentPage = Integer.parseInt(pageNum);
	  		int rowPerPage = 10;	// 한 화면에 보여주는 게시글 갯수
	  		int total = ms.getMbTotal(member);
	  		int startRow = (currentPage -1) * rowPerPage + 1;
	  		int endRow = startRow + rowPerPage - 1;
	  		member.setStartRow(startRow);
	  		member.setEndRow(endRow);
	  	//	List<Member> mbList = ms.mbList(startRow,endRow);	// 회원 목록
	  		List<Member> mbList = ms.mbList(member);
	  		int num = total - startRow + 1;
	  		PageBean pb = new PageBean(currentPage, rowPerPage, total);
	  		String[] title = {"아이디", "이름", "닉네임","아이디+이름" };
	  	//게시글
	  		int productConunt = ps.getProductCount();
	  		int noticeCount = ns.getNoticeCount();
	  		int eventCount = es.getEventCount();
	  		int productCount2 = ps.getProductCount2();
	  		int productCount3 = ps.getProductCount3();
	   //회원 
	  		int memberCount = ms.getCount();
	  		int member2Count = ms.getCount2();
	  		int member3Count = ms.getCount3();
            
	  	
	  		model.addAttribute("productCount3", productCount3);
	  		model.addAttribute("productConunt", productConunt);
	  		model.addAttribute("productCount2", productCount2);
	  		model.addAttribute("noticeCount", noticeCount);
	  		model.addAttribute("eventCount", eventCount);
	  		model.addAttribute("memberCount", memberCount);
	  		model.addAttribute("member2Count", member2Count);
	  		model.addAttribute("member3Count", member3Count);
	  		model.addAttribute("title", title);
	  		model.addAttribute("pb", pb);	// paginbean pb
	  		model.addAttribute("mbList", mbList);
	  		model.addAttribute("num", num);	//목록 번호 생성 위한 num
	  		return "admin/member/adminMemberList";
	  	}
	      @RequestMapping("adminDelete")
	  	public String adminDelete(String id, String pageNum, Model model) {
	    	  Member member = ms.select(id);
	  		int result = ms.adminDelete(id);
	  
//            System.out.println("result="+result);
	  		model.addAttribute("result", result);
	  		model.addAttribute("pageNum", pageNum);
	  		return "admin/member/adminDelete";
	  	}
	      @RequestMapping("adminRollback")
	  	public String adminRollback(String id, String pageNum, Model model) {
	  		int result = ms.adminRollback(id);
	  		Member member = ms.select(id);
	 
	  		model.addAttribute("result", result);
	  		model.addAttribute("pageNum", pageNum);
	  		return "admin/member/adminRollback";
	  	}
	  	@RequestMapping("adminView")
	  	public String adminView(String id, String pageNum, Model model) {
	  		Member member = ms.select(id);
	  //		List<NoticeBoard> boardList = vs.list(id);
	  //		model.addAttribute("boardList", boardList);
	  		model.addAttribute("member", member);	// 아이디로 DB에 있는 회원정보 조회
	  		model.addAttribute("pageNum", pageNum);
	  		return "admin/member/adminView";
	  	}
	  	@RequestMapping("adminUpdateForm")
		public String adminUpdateForm(String id, String pageNum, Model model) {
			Member member = ms.select(id);
			model.addAttribute("member", member);
			model.addAttribute("pageNum", pageNum);
			return "admin/member/adminUpdateForm";
		}
	  	@RequestMapping("adminUpdate")
		public String adminUpdate(Member member, String id, String pageNum, Model model) {
			int result = ms.adminUpdate(member);
			
			model.addAttribute("member", member);
			model.addAttribute("result", result);
			model.addAttribute("pageNum", pageNum);
			return "admin/member/adminUpdate";
		}
	}



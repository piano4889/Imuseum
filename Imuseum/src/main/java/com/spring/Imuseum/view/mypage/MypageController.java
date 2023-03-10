package com.spring.Imuseum.view.mypage;


import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.Imuseum.learn.GroupReservationVO;
import com.spring.Imuseum.learn.LearnService;
import com.spring.Imuseum.member.MemberService;
import com.spring.Imuseum.member.MemberVO;
import com.spring.Imuseum.mypage.AddrVO;
import com.spring.Imuseum.mypage.MypageService;
import com.spring.Imuseum.mypage.ProductFaqVO;
import com.spring.Imuseum.mypage.ReturnVO;
import com.spring.Imuseum.mypage.ReviewVO;
import com.spring.Imuseum.mypage.ReviewWriteVO;
import com.spring.Imuseum.mypage.orderOnlineVO;
import com.spring.Imuseum.mypage.ticketPersonalVO;
import com.spring.Imuseum.order.OrderPagePVO;
import com.spring.Imuseum.order.OrderService;
import com.spring.Imuseum.order.OrderVO;
import com.spring.Imuseum.order.PaymentCheck;
import com.spring.Imuseum.qnaBoard.QnaBoardService;
import com.spring.Imuseum.ticket.LearnTicketVO;
import com.spring.Imuseum.ticket.TicketService;


@SessionAttributes("member")

@Controller
public class MypageController {

	@Autowired
	private MypageService mypageService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private PaymentCheck paymentCheck;
	@Autowired
	private TicketService ticketService;
	@Autowired
	private LearnService learnService;
	
	private MemberService memberService;
	private QnaBoardService qnaBoard;	
	
	@Autowired
	private void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	@Autowired
	private void setQnaBoardService (QnaBoardService qnaBoard) {
		this.qnaBoard = qnaBoard;
	}
	
	@RequestMapping("FAQ.do")
	public String FAQ() {
		System.out.println(">> faq ??????");
		return "faq/FAQ";
	}
	 
	@RequestMapping("FAQ_reservation.do")
	public String FAQ_reservation() {
		System.out.println(">> FAQ reservation ??????");
		return "faq/FAQ_reservation";
	}
	 
	@RequestMapping("FAQ_shop.do")
	public String FAQ_shop() {
		System.out.println(">> FAQ shop ??????");
		return "faq/FAQ_shop";
	}
	 
	@RequestMapping("FAQ_location.do")
	public String FAQ_location() {
		System.out.println(">> FAQ location ??????");
		return "faq/FAQ_location";
	}
	 
	@RequestMapping("mypage_main.do")
	public String mypage_main(@ModelAttribute("member") MemberVO mvo,Model model) {
		System.out.println(">>mypage_main ??????~~");
		
		model.addAttribute("QnaBoardCount", qnaBoard.getQnaBoardCount(mvo.getId()));
		
		return "mypage/mypage_main";
	}
	 
	//?????? ?????? ?????? ?????????
	@ModelAttribute("ticketCnt")
	public int ticketCnt(ticketPersonalVO vo, @ModelAttribute("member") MemberVO mvo) {
		vo.setId(mvo.getId());
		int ticketCnt = mypageService.ticketCnt(vo);
		System.out.println("?????? ?????? ?????? ????????? : " + ticketCnt);
		return ticketCnt;
	}
	 
	//?????? ?????? ?????? ?????? : ??????
	@RequestMapping("/mp_ticket_ex.do")
	public String mp_ticket_ex(ticketPersonalVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_ticket ??????~~");
		vo.setId(mvo.getId());
		List<ticketPersonalVO> list = mypageService.ticketPersonal(vo);
		
		model.addAttribute("ticketPersonal", list);
		 
		return "mypage/mp_ticket_ex";
	}
	
	//?????? ?????? ?????? ?????? : ??????
	@RequestMapping("/mp_ticket_le.do")
	public String mp_ticket_le(LearnTicketVO lvo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_ticket ??????~~");
		lvo.setId(mvo.getId());
		List<LearnTicketVO> learnlist = mypageService.getLearnTicket(lvo);
		
		System.out.println(learnlist);
		model.addAttribute("learnlist", learnlist);
		 
		return "mypage/mp_ticket_le";
	}
	 
	//?????? ?????? ??????
	@RequestMapping("/deleteTicket.do")
	public String deleteTicket(String revNum){
		System.out.println(">>?????? ?????? ???????????? ??????");
			
	   if(revNum != null) {
		   String token = paymentCheck.getImportToken();
	       int result = paymentCheck.cancelPayment(token,revNum);
	        
	       mypageService.deleteTicket(revNum);
	       mypageService.deleteLearnTicket(revNum);
	       if (result == -1) {
	    	   System.out.println("result:"+result);
	       } else {
	    	   System.out.println("result:"+result);
	       }
	   }
	   return "redirect:mp_ticket_ex.do";
	 }
	
	//?????? ?????? ??????
		@RequestMapping("/deleteTicket_le.do")
		public String deleteTicketLe(String revNum){
			System.out.println(">>?????? ?????? ???????????? ??????");
				
		   if(revNum != null) {
			   String token = paymentCheck.getImportToken();
		       int result = paymentCheck.cancelPayment(token,revNum);
		        
		       mypageService.deleteTicket(revNum);
		       mypageService.deleteLearnTicket(revNum);
		       if (result == -1) {
		    	   System.out.println("result:"+result);
		       } else {
		    	   System.out.println("result:"+result);
		       }
		   }
		   return "redirect:mp_ticket_le.do";
		 }
	 
	//?????? ?????? ?????? : ??????
	@RequestMapping("/mp_ticket_team.do")
	public String mp_ticket_team(GroupReservationVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_ticket ??????~~");
		vo.setId(mvo.getId());
		List<GroupReservationVO> list = learnService.groupReservationMypage(vo);
		model.addAttribute("groupList", list);
		return "mypage/mp_ticket_team";
	}
	
	//?????? ?????? ?????? ?????? ??????(??????)
	@RequestMapping("/ticketPersonalToday.do")
	public String ticketPersonalToday(Model model) {
		List<ticketPersonalVO> list = mypageService.ticketPersonalToday();
		model.addAttribute("list", list);
		return "mypage/mp_ticket_ex";
	}
	
	//?????? ?????? ?????? ?????? ??????(1???)
	@RequestMapping("/ticketPersonalWeek.do")
	public String ticketPersonalWeek(Model model) {
		List<ticketPersonalVO> list = mypageService.ticketPersonalWeek();
		model.addAttribute("list", list);
		return "mypage/mp_ticket_ex";
	}
	//?????? ?????? ?????? ?????? ??????(??????)
	@RequestMapping("/ticketPersonalMonth.do")
	public String ticketPersonalMonth(Model model) {
		List<ticketPersonalVO> list = mypageService.ticketPersonalMonth();
		model.addAttribute("list", list);
		return "mypage/mp_ticket_ex";
	}
	//?????? ?????? ?????? ?????? ??????(??????)
	@RequestMapping("/ticketPersonalSelect.do")
	public String ticketPersonalSelect(Model model) {
		List<ticketPersonalVO> list = mypageService.ticketPersonalSelect();
		model.addAttribute("list", list);
		return "mypage/mp_ticket_ex";
	}
	 
	//????????????(?????????)
	@RequestMapping("/mp_order_online.do")
	public String mp_order_online(orderOnlineVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_order_online ??????~~");
		vo.setId(mvo.getId());
		List<orderOnlineVO> list = mypageService.orderOnline(vo);
		model.addAttribute("orderOnline", list);
	 
		System.out.println("list : "+ list);
		return "mypage/mp_order_online";
	}
	 
	@RequestMapping("/mp_orderDetail.do")
	 public String mp_orderDetail(String orderNum, Model model) {
		 System.out.println(">>mp_orderDetail ??????~~");
		 System.out.println("????????????:"+orderNum);
		 OrderVO vo = orderService.getOrder(orderNum);
		 System.out.println("OrderVO:"+vo);
		 List<OrderPagePVO> productList = orderService.getOrderProduct(orderNum);
		 model.addAttribute("vo", vo);
		 model.addAttribute("productList", productList);
		 model.addAttribute("productListCnt", productList.size());
		 return "mypage/mp_orderDetail";
	 }
	 @RequestMapping("/mp_orderReturnDetail.do")
	 public String mp_orderReturnDetail(String orderNum, Model model) {
		 System.out.println(">>mp_orderReturnDetail ??????~~");
		 System.out.println("????????????:"+orderNum);
		 OrderVO vo = orderService.getOrder(orderNum);
		 List<OrderPagePVO> productList = orderService.getOrderProduct(orderNum);
		 model.addAttribute("vo", vo);
		 model.addAttribute("productList", productList);
		 model.addAttribute("productListCnt", productList.size());
		 return "mypage/mp_orderReturnDetail";
	 }
	 
	//????????????(????????????)
	@RequestMapping("/mp_order_offline.do")
	public String mp_order_offline() {
		System.out.println(">>mp_order_offline ??????~~");
	 
		return "mypage/mp_order_offline";
	}
	 
	//????????????(??????)
	@RequestMapping("/mp_order_team.do")
	public String mp_order_team() {
		System.out.println(">>mp_order_team ??????~~");
		return "mypage/mp_order_team";
	}
	 
	//?????? ?????? ?????? ??????
	@RequestMapping("/mp_return.do")
	public String mp_return(ReturnVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_return ??????~~");
		vo.setId(mvo.getId());
		List<ReturnVO> list = mypageService.returnList(vo);
		model.addAttribute("returnList", list);
		System.out.println("list :" + list);
		return "mypage/mp_return";
	}
	 
	//????????? ??????
	@ModelAttribute("addrCnt")
	public int getAddrCnt(AddrVO vo, @ModelAttribute("member") MemberVO mvo) {
		vo.setId(mvo.getId());
		int addrCnt = mypageService.getAddrCnt(vo);
		System.out.println("????????? ?????? : " + addrCnt);
		return addrCnt;
	}
	
	//(??????)??????/???????????? ????????? ??????
	@ModelAttribute("orderCnt")
	public int orderCnt(orderOnlineVO vo, @ModelAttribute("member") MemberVO mvo) {
		vo.setId(mvo.getId());
		int orderCnt = mypageService.getOrderCnt(vo);
		System.out.println("??????/?????? ?????? : " + orderCnt);
		return orderCnt;
	}
	 
	//????????? ????????????
	@RequestMapping("/mp_addrHome.do")
	public String mp_addrHome(AddrVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_getAddrList ??????~~");
	 
		vo.setId(mvo.getId());
		List<AddrVO> list = mypageService.getAddrList(vo);
		System.out.println("vo : vo");
	  
		model.addAttribute("getAddrList", list);
		System.out.println("list : " +  list);
		 
		return "mypage/mp_addrHome";
	}
		
	//????????? ??????
	@RequestMapping("/mp_insertAddr.do")
	public String mp_insertAddr(AddrVO vo) throws IllegalStateException, IOException{
		System.out.println(">>mp_insertAddr ??????");
		mypageService.insertAddr(vo);
	
		System.out.println("vo: " + vo);
	  
		return "redirect:mp_addrHome.do";
	}
		  
	//????????? ??????
	@RequestMapping("/mp_updateAddr.do") 
	public String mp_updateAddr(@ModelAttribute("addr") AddrVO vo) throws IllegalStateException, IOException{
	System.out.println(">>mp_updateAddr ??????"); System.out.println("vo : " + vo);
	  
		mypageService.updateAddr(vo);
		return "redirect:mp_addrHome.do";
	}
	  
	//????????? ??????
	@RequestMapping("/mp_deleteAddr.do")
	public String mp_deleteAddr(AddrVO vo) { 
		System.out.println(">>mp_deleteAddr ??????");
		mypageService.deleteAddr(vo);
		return "redirect:mp_addrHome.do";
	}
	
	//?????? ???????????? ??????
	@RequestMapping("/updateAddrDefault.do")
	public String updateAddrDefault(int addrNum) {
		System.out.println(">>?????? ???????????? ?????????");
		AddrVO vo = mypageService.addrOne(addrNum);
		mypageService.updateAddrDefault(vo);
		return "redirect:mp_addrHome.do";
	}
		 
	 
	//????????? ?????? ?????? ??????
	@RequestMapping("/mp_review.do")
	public String productReview(ReviewVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_review ??????~~");
		vo.setId(mvo.getId());
		List<ReviewVO> list = mypageService.productReview(vo);
	 
		model.addAttribute("productReview", list);
		return "mypage/mp_review";
	}
	 
	//??????????????? ??????
	@RequestMapping("/mp_reviewWrite.do")
	public String mp_reviewWrite(ReviewWriteVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_reviewWrite ??????~~");
		vo.setId(mvo.getId());
		List<ReviewWriteVO> list = mypageService.reviewWrite(vo);
	 
		model.addAttribute("reviewWrite", list);
		return "mypage/mp_reviewWrite";
	}
	 
	//?????? ???????????? ???????????? ??????
	@RequestMapping("/moveToInsertReview.do")
	public String insertReview() {
		System.out.println(">> insertReview??? ??????");
		return "mypage/insertReview";
	}
	 
	//???????????? ?????? ??????
	@RequestMapping("/mp_productFaq.do")
	public String mp_productFaq(ProductFaqVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_productFaq ??????~~");
		vo.setId(mvo.getId());
		List<ProductFaqVO> list = mypageService.productFaq(vo);
	 
		model.addAttribute("productFaq", list);
		return "mypage/mp_productFaq";
	}
	 
	/*
	 * //???????????? ??????
	 * 
	 * @RequestMapping("/deleteFaq.do") public String deleteFaq(ProductFaqVO vo) {
	 * System.out.println(">>???????????? ?????? ??????"); mypageService.deleteFaq(vo);
	 * 
	 * return "redirect:mp_productFaq.do"; }
	 */
	
	//???????????? ?????? ?????????~~~~~~~~~~
	@RequestMapping("/deleteFaq.do")
	public String deleteFaq(int pqnaNum) {
		System.out.println(">> ???????????? ?????? ??????~");
		ProductFaqVO vo = mypageService.pqOne(pqnaNum);
		mypageService.deleteFaq(vo);
		return "redirect:mp_productFaq.do";
	}
	
	@RequestMapping("mp_grade.do")
	public String mp_grade() {
		System.out.println(">>mp_grade ??????~~");
		return "mypage/mp_grade";
	}
	@RequestMapping("productReviewInsert.do")
	 public String productReviewInsert(ReviewVO vo, @ModelAttribute("member") MemberVO mvo) {
		 System.out.println(">>productReviewInsert ??????~~");
		 vo.setId(mvo.getId());
		 System.out.println(vo);
		 mypageService.productReviewInsert(vo);
		 return "redirect:mp_review.do";
	 }
	 @RequestMapping("productReviewDelete.do")
	 public String productReviewDelete(int prNum) {
		 System.out.println(">>productReviewDelete ??????~~");
		 mypageService.productReviewDelete(prNum);
		 return "redirect:mp_review.do";
	 
	 }
	 @RequestMapping("productReviewUpdate.do")
	 public String productReviewUpdate(ReviewVO vo) {
		 System.out.println(">>productReviewUpdate ??????~~");
		 mypageService.productReviewUpdate(vo);
		 return "redirect:mp_review.do";
	 };
	 
	 //??????
	 
	 //1:1?????? ????????? ??????
	 @RequestMapping("mp_faq.do")
	 public String mp_faq(@ModelAttribute("member")MemberVO vo,Model model,
			 			  @RequestParam(value="cPage", defaultValue="1")String cPage) {
		 System.out.println(">>mp_faq ??????~~");		 		 				

		 model.addAttribute("qnaBoardList", qnaBoard.getQnaBoardListById(
				 		 qnaBoard.getMapperKeyword(vo.getId(), 
						 qnaBoard.calculatePage(vo.getId(), cPage).getBegin(), 
						 qnaBoard.calculatePage(vo.getId(), cPage).getEnd())
				 		 ));
		 model.addAttribute("pvo", qnaBoard.calculatePage(vo.getId(), cPage));
		 System.out.println();
		 
		 //model.addAttribute("qnaBoardList",qnaBoard.getQnaBoardListById(vo.getId()));		 
		 return "mypage/mp_faq";
	 }
	 /* ?????? ?????? ?????? ADMIN ??????   */	 
	 
	 //?????? ?????? ?????? ??? ???????????? ??????
	 @RequestMapping("/mp_checkPwd.do")
	 public String mp_checkPwd(@ModelAttribute("member") MemberVO vo) {
		 System.out.println(">>mp_checkPwd ??????~~");
		 if(vo.getSnsType() != 1) {
			 return "mypage/mp_updateInfo";
		 }
		 return "mypage/mp_checkPwd";
	 }
		 
	 //???????????? ??????????????? ??????
	 @RequestMapping("/mp_infoUpdate.do")
	 public String mp_updateInfo(@ModelAttribute("member") MemberVO vo) {
		 System.out.println(">>mp_updateInfo ??????~~");
		 System.out.println(vo);
		 
		 return "mypage/mp_updateInfo";
	 }
	 
	 //?????? ?????? ??????(??????)
	 @RequestMapping("/mp_memberUpdate.do")
	 public String mp_memberUpdate(@ModelAttribute("member") MemberVO vo, 
			 @RequestParam("updatePassword") String password,
			 @RequestParam("updateEmail") String email,
			 @RequestParam("updatePhone") String phone) {
		 System.out.println(">>mp_memberUpdate ??????~~");
		 System.out.println("????????? vo:" + vo);
		 System.out.println("password:" + password);
		 System.out.println("email:" + email);
		 System.out.println("phone:" + phone);
		 
		 if(password == "") {
			 System.out.println("???????????? ??? ???");
		 } else {
			 vo.setPassword(password);
		 }
		 if(email == "") {
			 System.out.println("????????? ??? ???");
		 } else {
			 vo.setEmail(email);
		 }
		 if(phone =="") {
			 System.out.println("??? ??? ???");
		 } else {
			vo.setPhone(phone); 
		 }
		 mypageService.updateInfo(vo);
		 System.out.println("?????? ??? vo : " + vo);
		 return "redirect:mypage_main.do";
	 }
	 
	 //?????? ?????? ?????? ????????? ??????
	 @RequestMapping("/mp_infoDelete.do")
	 public String mp_infoDelete() {
		 System.out.println(">>mp_infoDelete ??????~~");
		 return "mypage/mp_infoDelete";
	 }
	 
	 //?????? ?????? ??????
	 @RequestMapping("/dissmissAccount.do")
	 public String dissmissAccount(@ModelAttribute("member") MemberVO vo) {
		 System.out.println("?????? ??? : " + vo);
		 memberService.deleteMember(vo);
		 System.out.println("?????? ??? : " + vo);
		 return "redirect:logout.do";
	 }
	 
	  
	 
}//end

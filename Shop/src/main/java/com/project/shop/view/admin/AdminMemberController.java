package com.project.shop.view.admin;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.admin.member.AdminMemberService;
import com.project.shop.common.base.BaseController;
import com.project.shop.member.MemberVO;

@Controller("adminMemberController")
@RequestMapping(value="/admin/member")
public class AdminMemberController extends BaseController {
	@Autowired
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value="memberList.do")
	public ModelAndView memberList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(viewName);
		
//		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
//		String section = dateMap.get("section");
//		String pageNum = dateMap.get("pageNum");
//		String beginDate=null,endDate=null;
		
//		String [] tempDate=calcSearchPeriod(fixedSearchPeriod).split(",");
//		beginDate=tempDate[0];
//		endDate=tempDate[1];
//		dateMap.put("beginDate", beginDate);
//		dateMap.put("endDate", endDate);
		
		
		HashMap<String,Object> condMap=new HashMap<String,Object>();
		//		if(section== null) {
//			section = "1";
//		}
//		condMap.put("section",section);
//		if(pageNum== null) {
//			pageNum = "1";
//		}
//		condMap.put("pageNum",pageNum);
//		condMap.put("beginDate",beginDate);
//		condMap.put("endDate", endDate);
		ArrayList<MemberVO> member_list=adminMemberService.listMember(condMap);
		mav.addObject("member_list", member_list);
		
		
//		String beginDate1[]=beginDate.split("-");
//		String endDate2[]=endDate.split("-");
//		mav.addObject("beginYear",beginDate1[0]);
//		mav.addObject("beginMonth",beginDate1[1]);
//		mav.addObject("beginDay",beginDate1[2]);
//		mav.addObject("endYear",endDate2[0]);
//		mav.addObject("endMonth",endDate2[1]);
//		mav.addObject("endDay",endDate2[2]);
//		
//		mav.addObject("section", section);
//		mav.addObject("pageNum", pageNum);
		return mav;
	
	}
	
	@RequestMapping(value="/memberDetail.do")
	public ModelAndView memberDetail(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String member_id=request.getParameter("member_id");
		MemberVO member_info=adminMemberService.memberDetail(member_id);
		mav.addObject("member_info",member_info);
		return mav;
	}
	
	
	@RequestMapping(value="/deleteMember.do")
	public ModelAndView removeGoodsImage( @RequestParam("member_id") String member_id,
			                      HttpServletRequest request, HttpServletResponse response)  throws Exception {
		ModelAndView mav = new ModelAndView();
		adminMemberService.deleteMember(member_id);
		mav.setViewName("redirect:/admin/member/memberList.do");
		return mav;
		
		
	}
	
	@RequestMapping(value="/modifyMemberInfo.do")
	public ModelAndView modifyMemberInfo(
			@RequestParam HashMap<String, String> memberMap,
			HttpServletRequest request, HttpServletResponse response)  throws Exception{
		ModelAndView mav = new ModelAndView();
		System.out.println("memberID = " + memberMap.get("member_id"));
		System.out.println("member_date = " + memberMap.get("member_date"));
		adminMemberService.modifyMemberInfo(memberMap);
		
		mav.setViewName("redirect:/admin/member/memberList.do");
		return mav;
	}
	
	

}

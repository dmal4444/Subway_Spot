package com.sub.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.sub.Service.AdsService;
import com.sub.UTIL.FileUtil;
import com.sub.UTIL.PageUtil;
import com.sub.VO.AdsVO;

@Controller
public class AdsController {
	
	@Autowired
	private AdsService aService;
	
	/**
	 * 목록보기 함수
	 * @return
	 * @author eunmi
	 * @since 11.28.17
	 */
	@RequestMapping("/ads/adsList")
	public ModelAndView getAdsList(@RequestParam(value="nowPage", defaultValue="1") int nowPage){
		//파라메터 받고
		//DB에서 받아오고
				
		int total = aService.getTotal();
		PageUtil pInfo = new PageUtil(nowPage, total, 6);
		ArrayList list = aService.getAdsList(nowPage, pInfo); 
		//모델을 만들고
		ModelAndView mv = new ModelAndView();
		mv.addObject("LIST", list);
		mv.addObject("PINFO", pInfo);
		mv.setViewName("/ads/adsList");
		
		return mv;
	}
	
	
	/**
	 * 게시판 글쓰기 요청 함수
	 * @return
	 * @author Eunmi
	 * @since 11.28.17
	 */
	@RequestMapping("/ads/adsWrite")
	public ModelAndView getAdsWrite(){
		//파라메터 받고(없음)
		//DB에서 받아오고(없음)
		//뷰를 호출
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/ads/adsWrite");
		return mv;
	}
	
	/**
	 * 게시판 등록 처리 함수
	 * @param vo
	 * @param session
	 * @return
	 * @author eunmi
	 * @since 11.28.17
	 */
	@RequestMapping("/ads/adsWriteProc")
	public ModelAndView getAdsWriteProc(AdsVO vo, HttpSession session){
		
		//파라메터 받고(vo로 받고)
		String path=session.getServletContext().getRealPath("imgupload");
		
		String fileName = vo.getPath().getOriginalFilename();
		String saveName = FileUtil.upload(vo.getPath(), fileName, path);
		
		vo.setSaveName(saveName);
		//DB로 넣어주고
		aService.getAdsWrite(vo);
		//뷰를 호출한다.
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("./adsList.sub");
		mv.setView(rv);
		
		return mv;
	}
	
	//상세보기 폼 요청 처리 함수
	@RequestMapping("/ads/adsDetail")
	public ModelAndView getAdsDetail(@RequestParam(value="oriNo") int oriNo, @RequestParam(value="nowPage") int nowPage){
		//파라메터 받고
		HashMap map = new HashMap();
		map.put("oriNo", oriNo);
		map.put("nowPage", nowPage);
		
		//DB처리하고
		AdsVO vo = aService.getAdsDetail(oriNo);
		//모델만들고
		ModelAndView mv = new ModelAndView();
		mv.addObject("LIST", vo);
		mv.addObject("INFO", map);
		mv.setViewName("/ads/adsDetail");
		return mv;
		
	}
	
	//수정하기 폼 요청 처리함수
	@RequestMapping("/ads/adsModify")
	public ModelAndView getAdsModify(@RequestParam(value="oriNo") int oriNo, @RequestParam(value="nowPage") int nowPage){
		//파라메터 받고
		HashMap map = new HashMap();
		map.put("oriNo", oriNo);
		map.put("nowPage", nowPage);
		
		//DB처리하고
		AdsVO vo = aService.getAdsDetail(oriNo);
		//모델만들고
		ModelAndView mv = new ModelAndView();
		mv.addObject("LIST", vo);
		mv.addObject("INFO", map);
		mv.setViewName("/ads/adsModify");
		return mv;
		
	}
	
	//수정하기 실행 요청 처리 함수
	@RequestMapping("/ads/adsModifyProc")
	public ModelAndView getAdsModifyProc(AdsVO vo, HttpSession session){
		//파라메터 받고
		//DB 처리하고
		String path=session.getServletContext().getRealPath("imgupload");
		
		String fileName = vo.getPath().getOriginalFilename();
		String saveName = FileUtil.upload(vo.getPath(), fileName, path);

		vo.setSaveName(saveName);
		
		aService.getAdsModify(vo);
		
		
		
		//뷰 호출
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("../ads/adsList.sub");
		mv.setView(rv);
		
		return mv;
		
	}
	
	//삭제하기 실행 처리 함수
	@RequestMapping("/ads/adsDeleteProc")
	public ModelAndView adsDeleteProc(AdsVO vo){
		//파라메터 받고
		HashMap map = new HashMap();
		map.put("pw", vo.getPw());
		map.put("oriNo", vo.getOriNo());
		
		//DB 호출하고
		aService.deleteAds(map);
		
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("../ads/adsList.sub");
		mv.setView(rv);
		return mv;
	}
	
	
	

}

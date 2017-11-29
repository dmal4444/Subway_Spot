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
	 * ��Ϻ��� �Լ�
	 * @return
	 * @author eunmi
	 * @since 11.28.17
	 */
	@RequestMapping("/ads/adsList")
	public ModelAndView getAdsList(@RequestParam(value="nowPage", defaultValue="1") int nowPage){
		//�Ķ���� �ް�
		//DB���� �޾ƿ���
				
		int total = aService.getTotal();
		PageUtil pInfo = new PageUtil(nowPage, total, 6);
		ArrayList list = aService.getAdsList(nowPage, pInfo); 
		//���� �����
		ModelAndView mv = new ModelAndView();
		mv.addObject("LIST", list);
		mv.addObject("PINFO", pInfo);
		mv.setViewName("/ads/adsList");
		
		return mv;
	}
	
	
	/**
	 * �Խ��� �۾��� ��û �Լ�
	 * @return
	 * @author Eunmi
	 * @since 11.28.17
	 */
	@RequestMapping("/ads/adsWrite")
	public ModelAndView getAdsWrite(){
		//�Ķ���� �ް�(����)
		//DB���� �޾ƿ���(����)
		//�並 ȣ��
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/ads/adsWrite");
		return mv;
	}
	
	/**
	 * �Խ��� ��� ó�� �Լ�
	 * @param vo
	 * @param session
	 * @return
	 * @author eunmi
	 * @since 11.28.17
	 */
	@RequestMapping("/ads/adsWriteProc")
	public ModelAndView getAdsWriteProc(AdsVO vo, HttpSession session){
		
		//�Ķ���� �ް�(vo�� �ް�)
		String path=session.getServletContext().getRealPath("imgupload");
		
		String fileName = vo.getPath().getOriginalFilename();
		String saveName = FileUtil.upload(vo.getPath(), fileName, path);
		
		vo.setSaveName(saveName);
		//DB�� �־��ְ�
		aService.getAdsWrite(vo);
		//�並 ȣ���Ѵ�.
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("./adsList.sub");
		mv.setView(rv);
		
		return mv;
	}
	
	//�󼼺��� �� ��û ó�� �Լ�
	@RequestMapping("/ads/adsDetail")
	public ModelAndView getAdsDetail(@RequestParam(value="oriNo") int oriNo, @RequestParam(value="nowPage") int nowPage){
		//�Ķ���� �ް�
		HashMap map = new HashMap();
		map.put("oriNo", oriNo);
		map.put("nowPage", nowPage);
		
		//DBó���ϰ�
		AdsVO vo = aService.getAdsDetail(oriNo);
		//�𵨸����
		ModelAndView mv = new ModelAndView();
		mv.addObject("LIST", vo);
		mv.addObject("INFO", map);
		mv.setViewName("/ads/adsDetail");
		return mv;
		
	}
	
	//�����ϱ� �� ��û ó���Լ�
	@RequestMapping("/ads/adsModify")
	public ModelAndView getAdsModify(@RequestParam(value="oriNo") int oriNo, @RequestParam(value="nowPage") int nowPage){
		//�Ķ���� �ް�
		HashMap map = new HashMap();
		map.put("oriNo", oriNo);
		map.put("nowPage", nowPage);
		
		//DBó���ϰ�
		AdsVO vo = aService.getAdsDetail(oriNo);
		//�𵨸����
		ModelAndView mv = new ModelAndView();
		mv.addObject("LIST", vo);
		mv.addObject("INFO", map);
		mv.setViewName("/ads/adsModify");
		return mv;
		
	}
	
	//�����ϱ� ���� ��û ó�� �Լ�
	@RequestMapping("/ads/adsModifyProc")
	public ModelAndView getAdsModifyProc(AdsVO vo, HttpSession session){
		//�Ķ���� �ް�
		//DB ó���ϰ�
		String path=session.getServletContext().getRealPath("imgupload");
		
		String fileName = vo.getPath().getOriginalFilename();
		String saveName = FileUtil.upload(vo.getPath(), fileName, path);

		vo.setSaveName(saveName);
		
		aService.getAdsModify(vo);
		
		
		
		//�� ȣ��
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("../ads/adsList.sub");
		mv.setView(rv);
		
		return mv;
		
	}
	
	//�����ϱ� ���� ó�� �Լ�
	@RequestMapping("/ads/adsDeleteProc")
	public ModelAndView adsDeleteProc(AdsVO vo){
		//�Ķ���� �ް�
		HashMap map = new HashMap();
		map.put("pw", vo.getPw());
		map.put("oriNo", vo.getOriNo());
		
		//DB ȣ���ϰ�
		aService.deleteAds(map);
		
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("../ads/adsList.sub");
		mv.setView(rv);
		return mv;
	}
	
	
	

}

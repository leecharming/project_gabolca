package com.itwillbs.project_gabolcar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_gabolcar.mapper.ResMapper;
import com.itwillbs.project_gabolcar.vo.ResInfoVO;

@Service
public class ResService {

	@Autowired
	private ResMapper mapper;
	
//	public List<Map<String, Object>> dsbBrcMonthlyCount(List<Map<String, Object>> brcList) {
//		return mapper.dsbBrcMonthlyCount(brcList);
//	}
	
	// 예약 목록 조회
	public List<ResInfoVO> getResList(Map<String, Object> map) {
		return mapper.selectResList();
	}

	// 예약 상세 조회 
//	public ResInfoVO getResDetail(int res_idx) {
//		return mapper.selectResDetail(res_idx);
//	}


}

package com.itwillbs.project_gabolcar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.project_gabolcar.vo.ResInfoVO;

@Mapper
public interface ResMapper {

//	int insertResInfo(ResInfoVO resinfo);
//
//	//인기 차량 리스트 (desc 는 내림차순 관련 true 면 동작)
//	List<Map<String,Object>> selectResPopuler(@RequestParam(required = false) @Param("desc") String desc);
//
//	List<Map<String, Object>> dsbBrcMonthlyCount(List<Map<String, Object>> brcList);
	
	int insertResInfo(ResInfoVO resinfo);
	   List<Map<String,Object>> selectResPopuler();
		
		//예약 목록 조회(관리자모드)
		List<ResInfoVO> selectResList();
		
		// 예약 상세정보 조회
		ResInfoVO selectResDetail(int res_idx);
		
		// 전체 예약 목록 갯수 조회
//		int selectResListCount(
//				@Param("searchType") String searchType, 
//				@Param("searchKeyword") String searchKeyword);
		
		//예약 상세정보 조회
//		ResInfoVO selectResInfo(int res_idx);
	
}

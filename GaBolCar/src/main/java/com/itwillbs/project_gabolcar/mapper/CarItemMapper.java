package com.itwillbs.project_gabolcar.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.project_gabolcar.vo.*;

@Mapper
public interface CarItemMapper {
	//리뷰 관련 Mapper
	//리뷰게시판 목록조회
	//List<ReviewVO> selectReviewList(int startRow, int listLimit);
	
	//List<ReviewVO> selectReviewList(int startRow, int listLimit);
	//리뷰게시판 목록 수 참고위한 카운터
	//int selectReviewListCount();
	//리뷰게시판 메퍼 종료
	
	
	
	// 리뷰게시판 목록(페이징 적용)
	List<ReviewVO> getReviewListPaging(Criteria cri);

	// 리뷰게시판 총 갯수
	int getTotal();
	
	
	
	
	
	
	
	
	
	// 차량 소개 Mapper
	List<Map<String, Object>> selectCarInfoList();
	
	


}

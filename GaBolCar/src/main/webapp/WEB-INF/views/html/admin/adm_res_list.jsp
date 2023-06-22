<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_res_list.css">
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin/adm_res_list.js"></script>
</head>
<body>
    <section id="sec_con" class="inr">
       	<div class="adm_page_title">관리자 페이지</div>
       	<div class="inq_container">
			<!-- 사이드바 -->
			<jsp:include page="../../inc/adm_sidebar.jsp" />
	        <!-- 오른쪽 컨텐츠 -->
			<div class="content_view">
				<section id="adm_car">
					<span id="adm_car_title">[관리자] 예약리스트</span>					
					<article id="adm_car_top">
						<label>
							<input type="checkbox" name="date_type" class="adm_res_date" value="최신순">최신순
						</label>
						<label>
							<input type="checkbox" name="date_type" class="adm_res_date" value="오래된순">오래된순
						</label>
					</article>
					<article id="adm_car_center">
						<table id="adm_res_list" class="adm_res_list">
							<tr id="adm_res_title">
								<td>예약번호</td>
								<td>예약일시</td>
								<td>차량코드</td>
								<td>회원번호</td>
								<td>대여일시</td>
								<td>반납일시</td>
							</tr>
							<c:forEach var="res_info" items="${ResList }">
								<tr>
									<td>${res_info.res_idx }</td>
									<td>${res_info.res_time }</td>
									<td>${res_info.car_idx }</td>
									<td>${res_info.mem_idx }</td>
									<td>${res_info.res_rental_date }</td>
									<td>${res_info.res_return_date }</td>
								</tr>
							</c:forEach>	
						</table>
<!-- 						<button name="item_insert" class="adm_car_button"> -->
<!-- 							상품등록 -->
<!-- 						</button> -->
<!-- 						<button name="option_list" class="adm_car_button"> -->
<!-- 							옵션관리 -->
<!-- 						</button> -->
					</article>
					
					<article id="adm_car_bottom">
						<span id="adm_search">
							<select id="search_cate">
								<option value="">검색 옵션</option>
								<option value="res_idx">예약번호</option>
								<option value="car_idx">차량코드</option>
								<option value="mem_idx">회원번호</option>
<!-- 								<option value="car_old">연식</option> -->
<!-- 								<option value="brc_name">지점</option> -->
<!-- 								<option value="option_name">옵션</option> -->
							</select> 
							<input type="search" name="search_keyword" id="search_box"> <!-- search_cate change -> $(this).val()) -->
							<button name="item_search" class="adm_car_button">
								검색
							</button>
						</span>
					</article>
					
					<article id="pageList">
						<%--
						현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 버튼 동작
						=> 클릭 시 BoardList.bo 서블릿 요청(파라미터 : 현재 페이지번호 - 1)
						--%>
						<c:choose>
							<c:when test="${pageNum > 1 }">
								<input type="button" value="이전" onclick="location.href='MemList?pageNum=${pageNum - 1}'">
							</c:when>
							<c:otherwise>
								<input type="button" value="이전" disabled="disabled">
							</c:otherwise>
						</c:choose>
				
						<%-- 위의 문장을 간소화할 경우(조건에 따라 onclick 속성을 추가) --%>
				<%-- 		<input type="button" value="이전" <c:if test="${pageNum > 1 }">onclick="location.href='BoardList.bo?pageNum=${pageNum - 1}'"</c:if>> --%>
						<%-- ===================================================================== --%>
						<%-- 페이지번호 목록은 시작페이지(startPage) 부터 끝페이지(endPage) 까지 표시 --%>
						<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
							<%-- 각 페이지마다 하이퍼링크 설정(단, 현재 페이지는 하이퍼링크 제거) --%>
							<c:choose>
								<c:when test="${pageNum eq i }">
									<b>${i }</b>
								</c:when>
								<c:otherwise>
									<a href="BoardList?pageNum=${i }">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>		
						<%-- ===================================================================== --%>
						<%--
						현재 페이지 번호(pageNum)가 최대 페이지 번호(maxPage) 보다 작을 경우에만 [다음] 버튼 동작
						=> 클릭 시 BoardList.bo 서블릿 요청(파라미터 : 현재 페이지번호 + 1)
						--%>
						<c:choose>
							<c:when test="${pageNum < pageInfo.maxPage }">
								<input type="button" value="다음" onclick="location.href='ResList?pageNum=${pageNum + 1}'">
							</c:when>
							<c:otherwise>
								<input type="button" value="다음" disabled="disabled">
							</c:otherwise>
						</c:choose>
					</article>
					
					
					
<!-- 					페이지 번호 처리 로직 / 차량리스트 게시판과 같음 -->
<!-- 					<article id="pageList"> -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${pageNum > 1 }"> --%>
<%-- 								<input type="button" class="adm_car_button" value="이전" onclick="location.href='BoardList.bo?pageNum=${pageNum - 1}'"> --%>
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<input type="button" class="adm_car_button" value="이전" disabled="disabled"> -->
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<%-- 						<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }"> --%>
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${pageNum eq i }"> --%>
<%-- 									<b>${i }</b> --%>
<%-- 								</c:when> --%>
<%-- 								<c:otherwise> --%>
<%-- 									<a href="BoardList.bo?pageNum=${i }">${i }</a> --%>
<%-- 								</c:otherwise> --%>
<%-- 							</c:choose> --%>
<%-- 						</c:forEach>		 --%>
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${pageNum < pageInfo.maxPage }"> --%>
<%-- 								<input type="button" class="adm_car_button" value="다음" onclick="location.href='BoardList.bo?pageNum=${pageNum + 1}'"> --%>
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<input type="button" class="adm_car_button" value="다음" disabled="disabled"> -->
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<!-- 					</article> -->
				</section>
			</div>
		</div>
   	</section>
</body>
</html>
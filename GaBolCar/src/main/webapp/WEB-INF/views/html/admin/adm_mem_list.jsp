<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_mem_list.css">
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin/adm_mem_list.js"></script>
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
					<span id="adm_car_title">[관리자] 회원리스트</span>
					<article id="adm_car_center">
						<table id="adm_mem_list" class="adm_mem_list">
							<tr id="adm_mem_title">
								<td>회원번호</td>
								<td>ID</td>
								<td>이름</td>
								<td>가입일</td>
							</tr>
							<c:forEach var="mem_info" items="${MemList }">
								<tr>
									<td>${mem_info.mem_idx }</td>
									<td>${mem_info.mem_id }</td>
									<td>${mem_info.mem_name }</td>
									<td>${mem_info.mem_sign_date }</td>
									<!-- 상세 정보 버튼 생성 필요 -->
<!-- 								<td> -->
<!-- 									<input type="button" value="상세정보" onclick="location.href = 'MemberInfo?id=${member.id }'"> --%>
<!-- 								</td> -->
								</tr>
							</c:forEach>	
						</table>
					</article>
					<article id="adm_car_bottom">
						<span id="adm_search">
							<select id="search_cate">
								<option value="">검색 옵션</option>
								<option value="mem_idx">회원번호</option>
								<option value="mem_name">회원이름</option>	
							</select>
						</span>
					</article>
					
					<!-- 페이지 번호 처리 로직 / 차량리스트 게시판과 같음-->
					<article id="pageList">
						<c:choose>
							<c:when test="${pageNum > 1 }">
								<input type="button" class="adm_car_button" value="이전" onclick="location.href='BoardList.bo?pageNum=${pageNum - 1}'">
							</c:when>
							<c:otherwise>
								<input type="button" class="adm_car_button" value="이전" disabled="disabled">
							</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
							<c:choose>
								<c:when test="${pageNum eq i }">
									<b>${i }</b>
								</c:when>
								<c:otherwise>
									<a href="BoardList.bo?pageNum=${i }">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>		
						<c:choose>
							<c:when test="${pageNum < pageInfo.maxPage }">
								<input type="button" class="adm_car_button" value="다음" onclick="location.href='BoardList.bo?pageNum=${pageNum + 1}'">
							</c:when>
							<c:otherwise>
								<input type="button" class="adm_car_button" value="다음" disabled="disabled">
							</c:otherwise>
						</c:choose>
					</article>
				</section>
			</div>
		</div>
   	</section>
</body>
</html>
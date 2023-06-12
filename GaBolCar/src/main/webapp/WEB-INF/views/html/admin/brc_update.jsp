<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>지점 수정</title>
<link href="${pageContext.request.contextPath }/resources/css/inc/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1a47a651626dab122ca303d5b28aeda&libraries=services"></script>
</head>
<body>
	<section id="reg_section">
	    <div id="title_container">
			<h1>지점 수정</h1>
	    </div>
		<form action="brcUpdatePro" name="writeForm" method="post">
			<input type="hidden" name="brc_idx" value="${param.brc_idx }">
			<div id="modifyForm">
		    <table>
	          <tr>
	            <td class="td_left"><label for="brc_name">지점명</label></td>
	            <td class="td_right"><input type="text" name="brc_name" required="required" class="form-control" value="${brc.brc_name }"></td>
	          </tr>
	          <tr>
	        	<td class="td_left"><label for="brc_addr">주소</label></td>
	          	<td class="td_right">
	      			<input type="text" size="40" name="brc_addr" id="address" class="form-control" required="required" value="${brc.brc_addr }">
					<input type="hidden" name="map_x">
					<input type="hidden" name="map_y">
				</td>
	          </tr>
	          <tr>
	            <td class="td_left"><label for="brc_tel">전화번호</label></td>
	            <td class="td_right"><input type="text" name="brc_tel" required="required" class="form-control" value="${brc.brc_tel }"></td>
	          </tr>
	        </table>
		    <div id="commandCell">
		      <input type="submit" value="수정" class="btn btn-warning" style="background-color: rgb(255, 94, 0); color: #FFFFFF;">&nbsp;&nbsp;
		      <input type="reset" value="다시쓰기" class="btn btn-secondary">&nbsp;&nbsp;
		      <input type="button" value="닫기" onclick="close()" class="btn btn-secondary">
		    </div>
		  </div>
		</form>
	</section>
	<script src="${pageContext.request.contextPath }/resources/js/admin/brc_update.js"></script>
</body>
</html>
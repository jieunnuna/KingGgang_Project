<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/top.jsp"%>
<%-- <%@ include file="index_top.jsp" %>  --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<html>
<head>
<title>낑깡</title>
<meta charset="utf-8" />
</head>

<body>
	<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3>돌하르방</h3>
							</div>
							<div class="full">
								<ul class="menu_footer">
									<li><a href="comm_writeForm.do">> Write</a></li>
									<li><a href="comm_myPage.do">> Mypage</a></li>
									<li><a href="comm_bookMark.do">> BookMark</a></li>
									<li><a href="commadmin.comm">> 관리자모드</a></li>
									<li><c:if test="${comm_login == null }">
											<a href="comm_login.do?memberNum=${memberNum }">> 로그인</a>
											<a href="comm_checkMember.do?memberNum=${memberNum}">>
												가입하기</a>

										</c:if> <c:if test="${comm_login != null }">
											<a
												href="comm_member_delete.do?comm_memberNum=${comm_memberNum }">>
												회원탈퇴</a>
											<a
												href="comm_member_edit.do?comm_memberNum=${comm_memberNum }">>
												수정</a>
											<a href="comm_memberList.do">> 목록</a>
											<li><a
												href="comm_friendAll.do?comm_memberNum=${comm_memberNum }">>
													Friends 목록</a></li>
											<li><a href="#"
												onclick="window.open('roomList', '_blank', 'width=600 height=600')">>
													채팅 목록</a></li>
										</c:if></li>
								<li class="search-box" style="top:0 !important;position: inherit !important;">
                    			
                    			
                    			<input type="text" id="word" class="search-txt" placeholder="검색어를 입력하세요" onkeyup="search(this);">
                    			<a href ="#" class="search-btn" id="btn_search">
                        		<img src="${pageContext.request.contextPath}/resources/main/images/search_icon.png" alt="#" /></a>
              					<ul id="searchList"></ul>
              					
              					</li>
								
								</ul>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<div class="section layout_padding">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="full">
						<div class="heading_main text_align_center">
							<h2>
								<span class="theme_color"></span><a href="comm_togetherList.do">뉴스피드</a>
							</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

		<div class="row">
			<c:if test="${empty boardList}">
				<h4>등록된 페이지가 없습니다.</h4>
			</c:if>
			<c:forEach var="dto" items="${boardList}" varStatus="status">
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="full services_blog">
						<a href="">
						<img class="img-responsive" src="http://localhost:8080/img/${dto.file_name}" alt="#" />
						</a>
					</div>
				</div>
			</c:forEach>
			<div class="row margin-top_30">
				<div class="col-sm-12">
					<div class="full">
					<br>
						<div class="center">
							<a class="main_bt" href="moreList();">See More ></a>

						</div>
					</div>
				</div>
			</div>
		</div>

</body>
<!-- End Footer -->
<%@ include file="/WEB-INF/views/bottom.jsp"%>

<script> function search(target){ 
	var word = target.value; 
	var encodeWord = encodeURI(word);
	
	console.log(word); 
	console.log(encodeWord); 
	
	//start Ajax 
	
	$.ajax({ type : 'POST', 
		dataType : 'json',
		contentType: "application/json; charset=utf-8;",
		url : "/commSearch",
		data: encodeWord,
		error : function(err) { console.log("실행중 오류가 발생하였습니다."); }, 
		success : function(data) { 
		
		console.log("data확인 : "+data);
		console.log("결과 개수 : "+data.dataSearch.content.length); 
		console.log("첫번째 결과 : "+data.dataSearch.content[0]); 
		
		$("#searchList").empty(); 
		
		var checkWord = $("#word").val(); 
		//검색어 입력값
		console.log(data.dataSearch.content.length); 
		if(checkWord.length > 0 && data.dataSearch.content.length > 0){ 
			for (i = 0; i < data.dataSearch.content.length; i++) {
				$("#searchList") .append( "<li class='searchList' value='" 
						+ data.dataSearch.content[i].comm_nickname 
						+ "' data-input='" 
						+ data.dataSearch.content[i].comm_nickname 
						+ ">" 
						+ "<a href='javascript:void(0);'>" 
						+ data.dataSearch.content[i].comm_nickname
						+ "</a>" 
						+ "</li>"); 
				} 
			} 
		} 
		
		});//end Ajax 
		
		}
</script>


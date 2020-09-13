<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	이	   름 : comm_together.jsp
	개  발   자 : 최 인 아
	설	   명 : 투게더 게시판 목록
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/top.jsp"%>
<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3><font size=7>낑</font><font size=3>깡</font><font size=7>같</font><font size=3>이</font><font size=7>따</font><font size=3>러갈래?</font></h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>
<div class="section layout_padding">
<div align="center">
	<table width="800">
		<tr>
			<td align="right"><a href="commhome.comm">뒤로가기</a>|<a href="comm_togetherWF.do">글쓰기</a></td>
		</tr>
	</table>
	<table width="800" id="eventTable">
		<tr bgcolor="orange" align="center">
			<th>번호</th>
			<th width="30%">제목</th>
			<th>작성자</th>
			<th>이메일</th>
			<th>작성일</th>
			<th>조회</th>
		</tr> 
	<c:if test="${empty togetherList}">		
		<tr>
			<td colspan="6">
				등록된 게시글이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${togetherList}">		
		<tr align="center">
			<td>
				<c:out value="${dto.togetherNum}"/>
			</td>
			<td>
			<c:if test="${dto.treadcount>10}">
				<img src="${pageContext.request.contextPath}/resources/img/crown.PNG" width="30" height="30">
			</c:if>	
				<a href="comm_tcontent.do?togetherNum=${dto.togetherNum}">${dto.ttitle}</a>
			</td>
			<td>${comm_nickname}</td>
			<td>${dto.temail}</td>
			<td><fmt:formatDate value="${dto.tregdate}" pattern="yyyy-MM-dd"/></td>
			<td>${dto.treadcount}</td>
		</tr>		
	</c:forEach>	
	</table>
</div>	
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>
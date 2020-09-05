<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../index_top.jsp"%>    
<div align="center">
	<b>목 록</b>
	<table width="800">
		<tr bgcolor="pink">
			<td align="right"><a href="comm_newsfeed.do">뒤로가기</a>|<a href="comm_togetherWF.do">글쓰기</a></td>
		</tr>
	</table>
	<table width="800">
		<tr bgcolor="skyblue">
			<th>번호</th>
			<th width="40%">제목</th>
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
		<tr>
			<td><c:out value="${dto.togetherNum}"/></td>
			<td>
				<a href="comm_tcontent.do?togetherNum=${dto.togetherNum}">
					${dto.ttitle}
				</a>
		<c:if test="${dto.treadcount>10}">
				<img src="img/hot.gif">
		</c:if>		
			</td>
			<td>${dto.tname}</td>
			<td>${dto.temail}</td>
			<td>${dto.tregdate}</td>
			<td>${dto.treadcount}</td>
		</tr>		
	</c:forEach>	
	</table>
</div>	
<%@ include file="../index_bottom.jsp"%>
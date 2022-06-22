<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>getNoticeOne</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
	<h1>getNoticeOne</h1>
		<C:forEach var="n" items="${board}">
			<table class="table table=striped">
				<tr>
					<td>번호</td>
					<td>${n.boardNo}</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>${n.memberId}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${n.boardTitle}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${n.boardContent}</td>
				</tr>
				<tr>
					<td>생성날짜</td>
					<td>${n.createDate}</td>
				</tr>
				<tr>
					<td>수정날짜</td>
					<td>${n.updateDate}</td>
				</tr>
			</table>
				<a href="${pageContext.request.contextPath}/removeNotice?noticeId=${n.boardNo}">삭제</a>
				<a href="${pageContext.request.contextPath}/modifyNotice?noticeId=${n.boardNo}">수정</a>
		</C:forEach>
		<div>첨부파일</div>
			<C:forEach var="boardfile" items="${boardfile}">
				<div>
					<a href="${pageContext.request.contextPath}/file/board_file/${boardfile.boardFileName}${boardfile.boardFileType}" download="${boardfile.boardFileName}${boardfile.boardFileType}">${boardfile.boardFileName}${boardfile.boardFileType}</a>
				</div>
			</C:forEach>
</div>
</body>
</html>
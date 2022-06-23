<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert Subject Report(운영자)</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <h1>과제 게시판 글 추가</h1>
	    <div>
	   		<a href="${pageContext.request.contextPath}/getSubjectReportListByPage?subjectNo=${subjectNo}">이전</a>
	    </div>
		    <form id="addSubjectReportForm" method="post" name="addSujectReportForm" action="${pageContext.request.contextPath}/addSubjectReport">
		    	<div>
		   			<input type="number" id="subjectNo" name="subjectNo" class="form-control" placeholder="강좌번호~ 이거 나중에 자동으로 받아지게 할거임">
		   		 	<span id="subjectNoHelper" class="helper"></span>	
		    	</div>
		    	<div>  	
		    		<input type="text" id="memberId" name="memberId" class="form-control" placeholder="멤버ID 세션값받아와서 넘기게 할거임">
		    		<span id="memberIdHelper" class="helper"></span>	
		    	</div>
		    	<div>
		    		<input type="text" id="subjectReportTitle" name="subjectReportTitle" class="form-control" placeholder="과제 제목">
		    		<span id="subjectReportTitleHelper" class="helper"></span>	
		    	</div>
		    	<div>
		    		<textarea id="subjectReportContent" name="subjectReportContent" class="form-control" placeholder="과제 설명 작성"></textarea>
		    		<span id="subjectInfoHelper" class="helper"></span>
		    	</div>
		    	<div>
		    		<input type="date" id="subjectReportPeriod" name="subjectReportPeriod" class="form-control" placeholder="과제 기한 설정">
		    		<span id="subjectReportPeriodHelper" class="helper"></span>	
		    	</div>
		    	<div class="form-group">
					 <button type="button" id="signup">과제 추가</button>
				</div>
		    </form>
</div>
	<!-- 과제 게시판 입력 유효성 검사 -->
	<script type="text/javascript">	
		// 유효성 검사 추가 예정
	</script>
</body>
</html>
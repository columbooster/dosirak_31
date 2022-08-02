<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/images/common/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/common/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<title>에러 페이지</title>
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script> 
		<script type="text/javascript" src="/resources/include/js/common.js"></script>	
		  
	</head>
	<body>
		<%--이 부분은 개발 당시에는 사용하면 된다. (예외메시지를 확인하기 위해서) --%>
		<h4><c:out value="${exception.getMessage()}"></c:out></h4> 
		<ul>
			<c:forEach items="${exception.getStackTrace()}" var="stack">
				<li><c:out value="${stack}"></c:out></li>
			</c:forEach>
		</ul>
		<%-- 개발이 완료되면 이 부분을 주석해제 하면 된다. 
		<div class="alert alert-danger alert-dismissible fade in" role="alert" id="errorAlert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4>예상하지 못한 오류가 발생했습니다.</h4>
			<p>
				일시적인 현상이거나 네트워크 문제일 수 있으니, 잠시 후 다시 시도해 주세요.<br />
				계속 발생하는 경우 홈페이지를 통해 문의해 주세요.<br />
				감사합니다<br />
			</p>
			<p>
				<button type="button" class="btn btn-danger" id="main">홈으로</button>
			</p>
		</div>--%>
		
	</body>
</html>
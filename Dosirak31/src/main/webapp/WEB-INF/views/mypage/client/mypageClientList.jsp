<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	
	<script type="text/javascript">
	// 편집 클릭시 상세 페이지 이동
	$(".goDetail").click(function() {
		let client_no=$(this).attr("data-num");
		$("#client_no").val(client_no);
		console.log("글번호 : " + client_no);
		// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
		$("#detailForm").attr({
			"method":"get",
			"action":"/mypage/client/mypageClientDetail"
		});
		$("#detailForm").submit();
	});
	</script>
	
	
	
</head>
	<body>
		<h1>회원정보</h1>
		
		<form id="detailForm">
	      	<input type="hidden" id="client_no" name="client_no" />
	    </form>
		
		<form id="f_search" name="f_search" class="form-inline">
	      	<input type="hidden" name="client_no" id="client_no" value="${sessionScope.client_no }">
	    </form>	
		
		<form name="f_data" id="f_data" method="post">
      		<input type="hidden" name="client_no" value="${mypageClient.client_no }">
      	</form>
		<c:choose>
		      	<c:when test="${not empty mypageClientList}" >
			      	<c:forEach var="mypageClient" items="${mypageClientList}" varStatus="status">
				        <ul data-num="${mypageClient.client_no}">
				          <li>
				            <article>
				              <header>
				                <figure class="avatar"><img src="/resources/images/demo/avatar.png" alt=""></figure>
				                <address>
				                By <a href="#">${mypageClient.client_name}</a>
				                </address>
				                <span>별점 : ${mypageClient.client_id}</span>
				                <div>${mypageClient.client_date}</div>
				              </header>
				              <div class="comcont">
				                <p>${mypageClient.client_address}</p>
				              </div>
				              
				            </article>
				          </li>
				        </ul> 
			        </c:forEach>
		        </c:when>
		        <c:otherwise>
		        	<div>등록된 회원정보가 존재하지 않습니다.</div>
		        </c:otherwise>
	        </c:choose>
		
		<a class="goDetail" href="/mypage/client/mypageClientDetail?client_no=${mypageClient.client_no }">편집</a>
		<div class="btn">
        <input type="button" value="회원정보 수정" id="client_infoUpdateBtn" class="btn1">
        <input type="button" value="회원정보 삭제" id="client_infoDeleteBtn" class="btn1">
        </div>
		
		
		
	</body>
</html>
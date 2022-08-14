<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	
	<script type="text/javascript">
		let buttonCheck = 0; 
					$(function() {
						
						// 수정 버튼 클릭시 처리 이벤트
						$("#updateFormBtn").click(function() {
							buttonCheck =1;
							
							if(buttonCheck==1){
								goUrl = "/mypage/client/updateForm";
								$("#f_data").attr("action",goUrl);
								$("#f_data").submit();
							}
						});
						
						// 삭제 버튼 클릭시 처리 이벤트
						$("#mypageReviewDeleteBtn").on("click", function(e){
							buttonCheck =2;
							
							if(buttonCheck==2){	// 삭제버튼 클릭시
								if(confirm("정말 삭제하시겠습니까?")){
									goUrl = "/mypage/client/mypageReviewDelete";
									
									$("#f_data").attr("action",goUrl);
									$("#f_data").submit();
								}
							}
						});
						
						// 목록 버튼 클릭 시 처리 이벤트
						$("#mypageReviewListBtn").click(function() {
							location.href = "/mypage/client/mypageReviewList";
						});
					}); 
	</script>

</head>
	<body>
		<div class="wrapper row2 bgded" style="background-image:url('/resources/images/common/detail.jpeg'); height: 300px;">
  
    <div id="breadcrumb" class="clear"> 
      
      
      
    </div>
  
</div>

<div class="wrapper row3">
	<main class="container clear" style="padding: 20px 0;">
    	<div class="contentContainer container" style="padding: 20px 0;">
    		
    		<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="review_no" value="${detail.review_no}"/>
			</form>
    		
    		<div class="header-title" style="padding-bottom: 10px;">
        		"My page"
        	<span class="right-arrow">&gt;</span>
        		'review'
        	<span class="right-arrow">&gt;</span>
        	<strong>Review_modify</strong>
        	<br/>
        	</div>
       		<h3 class="title">Review Detail</h3>
			
			<div class="contentTB text-center">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td class="col-md-3">작성자</td>
									<td class="col-md-3 text-left">${detail.review_name}</td>
									<td class="col-md-3">작성일</td>
									<td class="col-md-3 text-left">${detail.review_date}</td>
								</tr>
								<tr>
									<td class="col-md-4">별점</td>
									<td colspan="3" class="col-md-8 text-left">${detail.review_score}</td>
								</tr>
								<tr class="table-tr-height">
									<td class="col-md-4">글내용</td>
									<td colspan="3" class="col-md-8 text-left">${detail.review_contents}</td>
								</tr>
							</tbody>
						</table>
						<input type="button" value="글 수정" id="updateFormBtn" class="dosirakBtn">
						<input type="button" value="글 삭제" id="mypageReviewDeleteBtn" class="dosirakBtn">
						<input type="button" value="목록" id="mypageReviewListBtn" class="dosirakBtn">
				</div>
        </div>
    <div class="clear"></div>
  	</main>
</div>
	</body>
</html>
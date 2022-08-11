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
		<div class="wrapper row2 bgded" style="background-image:url('/resources/images/demo/backgrounds/01.png');">
  <div class="overlay">
    <div id="breadcrumb" class="clear"> 
      
      <ul>
         <li><a href="/client/successlogin">Home</a></li>
        <li><a href="/mypage/client/mypageMain">MYPAGE</a></li>
        <li><a href="/mypage/client/mypageMain">MYPAGE</a></li>
        <li><a href="/foodReview/client/foodReviewList">Review</a></li>
      </ul>
      
    </div>
  </div>
</div>

<div class="wrapper row3">
	<main class="container clear">
    	<div class="contentContainer container">
    		
    		<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="review_no" value="${detail.review_no}"/>
			</form>
    		
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
									<td class="col-md-4">글제목</td>
									<td colspan="3" class="col-md-8 text-left">${detail.review_score}</td>
								</tr>
								<tr class="table-tr-height">
									<td class="col-md-4">글내용</td>
									<td colspan="3" class="col-md-8 text-left">${detail.review_contents}</td>
								</tr>
							</tbody>
						</table>
						<input type="button" value="글 수정" id="updateFormBtn" class="btn btn-success">
						<input type="button" value="글 삭제" id="mypageReviewDeleteBtn" class="btn btn-success">
						<input type="button" value="목록" id="mypageReviewListBtn" class="btn btn-success">
				</div>
        </div>
    <div class="clear"></div>
  	</main>
</div>
	</body>
</html>
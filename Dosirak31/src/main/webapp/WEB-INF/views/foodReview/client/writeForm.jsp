<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<style type="text/css">
			text, btn{
				vertical-align: right;
			}
			.btn1{
				display :inline-block;
			}
			
		</style>
		
		
		<script type="text/javascript">
			$(function() {
				// submit 버튼 클릭시 처리 이벤트
				$("#foodReviewInsertBtn").click(function() {
					
					// 점수 제한 정규식
					let scoreval = $('#review_score').val()
					let scorecheck = /[0-5]/
					if (!scorecheck.test(scoreval)){
						alert('점수는 0~5점 사이의 숫자를 입력해주세요.')
						$('review_score').focus();
						return false
					}
					
					// 입력값 체크
					if(!chkData("#review_name", "작성자를")) return;
					else if(!chkData("#review_score", "점수를")) return;
					else if(!chkData("#review_contents", "내용을")) return;
					else {
						$("#f_writeForm").attr({
							"method" : "post",
							"action" : "/foodReview/client/foodReviewInsert"
						});
						$("#f_writeForm").submit();
						}
					});
					
					// 목록 버튼 클릭시 처리 이벤트
					$("#foodReviewListBtn").click(function() {
						console.log("버튼누름");
						location.href = "/foodReview/client/foodReviewList";
					
					});
			});
			
		</script>
</head>
<body id="top">
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2 bgded" style="background-image:url('/resources/images/demo/backgrounds/01.png');">
  <div class="overlay">
    <div id="breadcrumb" class="clear"> 
      <!-- ################################################################################################ -->
      <ul>
          <li><a href="/client/successlogin">Home</a></li>
        <li><a href="/food/foodClientBasicList">FOOD</a></li>
        <li><a href="/foodReview/client/foodReviewList">FOOD REVIEW</a></li>
         <li><a href="/foodReview/client/foodReviewList">FOOD REVIEW</a></li>
      </ul>
      <!-- ################################################################################################ -->
    </div>
  </div>
</div>
<div class="wrapper row3">
	<main class="container clear"> 
    <div class="content" >
	<h2>Write A Comment</h2>
		<div>
        <form  id="f_writeForm" name="f_writeForm">
        	<input type="hidden" name="client_no" value="${sessionScope.client_info.client_no }">
        	
          <div class="one_third">
            <label for="review_name">Name <span>*</span></label>
            <input type="text" name="review_name" id="review_name" value="<c:out value='${sessionScope.client_info.client_id}'/>" size="22" readonly="readonly">
          </div>
          <div class="one_third">
            <label for="review_score">Score <span>*</span></label>
            <input type="text" name="review_score" id="review_score" size="22">
          </div>
          <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 빼야 될것 -->
          <div class="one_third">
            <label for="order_no">Score <span>*</span></label>
            <input type="text" name="order_no" id="order_no" size="22">
          </div>
          <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 빼야 될것 -->
          <div class="block clear">
          	<br />
            <label for="review_contents">Text</label>
            <textarea name="review_contents" id="review_contents" cols="80" rows="10" class="text"></textarea>
          </div>
          <div class="btn">
            <input type="button" id="foodReviewInsertBtn" value="Submit" class="dosirakBtn">
            &nbsp;
            <input type="reset" value="Reset" class="dosirakBtn">
            &nbsp;
            <input type="button" id="foodReviewListBtn" value="List" class="dosirakBtn">
          </div>
        </form>
        </div>
        </div>
    <div class="clear"></div>
  	</main>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<style type="text/css">
			 btn{
				vertical-align: right;
			}
			.btn1{
				display :inline-block;
			}
			div.one_third {
				margin: auto;
			}
		</style>
		
		
		<script type="text/javascript">
			$(function() {
				// submit 버튼 클릭시 처리 이벤트
				$("#foodReviewInsertBtn").click(function() {
					
					// 점수 제한 정규식
					let scoreval = $('#review_score').val()
					let scorecheck = /^[0-5]$/
					if (!scorecheck.test(scoreval)){
						alert('점수는 0~5점 사이의 정수를 입력해주세요.')
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
<div class="wrapper row2 bgded" style="background-image:url('/resources/images/common/writeForm.jpeg'); height: 270px;">
  
    <div id="breadcrumb" class="clear"> 
      <!-- ################################################################################################ -->
     
      <!-- ################################################################################################ -->
    </div>
  
</div>

<div class="wrapper row3">
	
	<main class="container clear" style="padding-top: 30px;"> 
	<hr/>
    <div class="content" >
     <div class="header-title" style= "padding-bottom: 10px;">
        		"My page"
        	<span class="right-arrow">&gt;</span>
        		'orderhistory'
        	<span class="right-arrow">&gt;</span>
        	<strong>'Review'</strong>
        	</div>
       		<h3 class="title">리뷰</h3>
	<h2>Write A Comment</h2>
		<div>
        <form  id="f_writeForm" name="f_writeForm">
        	<input type="hidden" name="client_no" value="${sessionScope.client_info.client_no }">
        	<input type="hidden" id="order_no" name="order_no" value="${data.order_no}" />
          <div class="one_third">
            <label for="review_name">Name <span>*</span></label>
            <input type="text" name="review_name" id="review_name" value="<c:out value='${sessionScope.client_info.client_id}'/>" size="22" readonly="readonly">
          </div>
          <div class="one_third">
            <label for="review_score">Score <span>*</span></label>
            <input type="text" name="review_score" id="review_score" size="22" placeholder="0~5점 사이의 정수를 입력해주세요."  style="width: 246px;">
          </div>
          <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 빼야 될것 -->
          
          <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 빼야 될것 -->
          <div class="block clear">
          	<br />
            <label for="review_contents">Text</label>
            <textarea name="review_contents" id="review_contents" cols="80" rows="10" class="text" placeholder="자유로운 의견을 남겨주세요."></textarea>
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
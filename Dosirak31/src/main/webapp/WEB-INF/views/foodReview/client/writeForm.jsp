<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>



		<script type="text/javascript">
			$(function() {
				// submit 버튼 클릭시 처리 이벤트
				$("#foodReviewInsertBtn").click(function() {
					// 입력값 체크
					console.log("버튼누름");
					if(!chkData("#review_name", "작성자를")) return;
					else if(!chkData("#review_score", "점수를")) return;
					else if(!chkData("#review_comments", "내용을")) return;
					else {
						$("#f_writeForm").attr({
							"method" : "post",
							"action" : "/foodReview/client/foodReviewInsert"
						});
						console.log("버튼누름");
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
<body>
	<h2>Write A Comment</h2>
		<div>
        <form  id="f_writeForm" name="f_writeForm">
          <div class="one_third first">
            <label for="review_name">Name <span>*</span></label>
            <input type="text" name="review_name" id="review_name" size="22">
          </div>
          <div class="one_third">
            <label for="review_score">Score <span>*</span></label>
            <input type="text" name="review_score" id="review_score" size="22">
          </div>
          <div class="block clear">
            <label for="review_comments">Text</label>
            <textarea name="review_comments" id="review_comments" cols="25" rows="10"></textarea>
          </div>
          <div>
            <input type="button" name="submit" id="foodReviewInsertBtn" value="Submit">
            &nbsp;
            <input type="reset" name="reset" value="Reset">
            &nbsp;
            <input type="button" id="foodReviewListBtn" value="List">
          </div>
        </form>
        </div>
</body>
</html>
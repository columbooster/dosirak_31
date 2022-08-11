<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>



		<script type="text/javascript">
			$(function() {
				// 수정 버튼 클릭시 처리 이벤트
				$("#foodReviewUpdateBtn").click(function() {
					//입력값 체크
					if(!chkData("#review_score", "점수를")) return;
					else if(!chkData("#review_comments", "작성할 내용을")) return;
					else 
						$("#f_updateForm").attr({
							"method" : "post",
							"action" : "/foodReview/foodReviewUpdate"
						});
				})
			})
		</script>
</head>


	<body id="top">
<!-- ################################################################################################ -->
<div class="wrapper row1">
  <header id="header" class="clear"> 

    <div id="logo" class="fl_left">
      <h1><a href="/resources/index.html">DOSIRAK31</a></h1>
    </div>
    <nav id="mainav" class="fl_right">
      <ul class="clear">
        <li class="active"><a href="/resources/index.html">Home</a></li>
        <li><a href="/health/hBoardList">WORKOUT</a>  
        </li>
        <li><a class="drop" href="/food/foodNoClientBasicList">FOOD</a>
          <ul>
            <li><a href="/food/foodNoClientBasicList">FOOD</a>
            <li><a href="/foodReview/client/foodReviewList">FOOD REVIEW</a>
            </li>
          </ul>
        </li>
        <li><a href="/community/client/communityList">COMMUNITY</a></li>
        <li><a class="drop" href="/client/loginmain">LOGIN</a>
       	 <ul>
            <li><a href="/client/loginmain">CLIENT LOGIN</a></li>
            <li><a href="/food/foodAdminBasicList">ADMIN LOGIN</a></li>
          </ul>
        </li>
        <li><a href="/signup/client/signupForm">SIGN UP</a></li>
        <li><a href="/mypage/client/mypage">MY PAGE</a></li>
      </ul>
    </nav>
  </header>
</div>
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
    <div class="content">
		<h2>Update A Comment</h2>
		<div>
        <form  id="f_updateForm" name="f_updateForm">
        	<input type="hidden" id="review_no" name="review_no" value="${updateData.review_no}" />
        	
	          <div class="one_third first">
	            <label for="review_name">Name <span>*</span></label>
	            <input type="text" name="review_name" id="review_name" size="22" value="${updateData.review_name}">
	          </div>
	          
	          <div class="one_third">
	            <label for="review_score">Score <span>*</span></label>
	            <input type="text" name="review_score" id="review_score" size="22" value="${updateData.review_score}">
	          </div>
	          
	          <div class="one_third">
            	<label for="review_score">Date</label>
           		 <input type="text" name="review_score" id="review_score" size="22" value="${updateData.review_date}">
        	  </div>
        	  
	          <div class="block clear">
	            <label for="review_comments">Text</label>
	            <textarea name="review_comments" id="review_comments" cols="25" rows="10">${updateData.review_comments}</textarea>
	          </div>
	          <div>
	            <input type="button" value="Update" id="foodReviewUpdateBtn">
	            &nbsp;
	            <input type="reset" name="reset" value="Reset">
	            &nbsp;
	            <input type="button" id="foodReviewListBtn" value="List">
	          </div>
        	</form>
        </div>
        </div>
    <div class="clear"></div>
  	</main>
</div>
	</body>
</html>
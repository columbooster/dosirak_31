<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>



		<script type="text/javascript">
			$(function() {
				// 수정 버튼 클릭시 처리 이벤트
				$("#mypageReviewUpdateBtn").click(function() {
					//입력값 체크
					if(!chkData("#review_score", "점수를")) return;
					else if(!chkData("#review_contents", "작성할 내용을")) return;
					else {
						$("#f_updateForm").attr({
							"method" : "post",
							"action" : "/mypage/client/mypageReviewUpdate"
						});
						$("#f_updateForm").submit();
					}
				});
				
				// 취소 버튼 클릭시 처리 이벤트
				$("#mypageReviewCancelBtn").click(function() {
					$("#f_updateForm").each(function() {
						this.reset();
					});
				});
				
				// 목록 버튼 클릭 시 처리 이벤트
				$("#mypageReviewListBtn").click(function() {
					location.href="/mypage/client/mypageReviewList";
				});
			});
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
        <li><a href="#">Home</a></li>
        <li><a href="/client/successlogin">Home</a></li>
        <li><a href="/mypage/client/mypageMain">MYPAGE</a></li>
        <li><a href="/mypage/client/mypageMain">MYPAGE</a></li>
      </ul>
      <!-- ################################################################################################ -->
    </div>
  </div>
</div>
	<div class="wrapper row3">
	<main class="container clear"> 
    <div class="content">
		<div class="contentTB text-center">
					<form id="f_updateForm" name="f_updateForm">
						<input type="hidden" id="review_no" name="review_no" value="${updateData.review_no}" />
						
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td class="col-md-3">글번호</td>
									<td class="text-left col-md-3">${updateData.review_no}</td>
									<td class="col-md-3">작성일</td>
									<td class="text-left col-md-3">${updateData.review_date}</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td colspan="3" class="text-left">${updateData.review_name}</td>
								</tr>
								<tr>
									<td>별점</td>
									<td colspan="1" class="text-left">
										<input type="text" name="review_score" id="review_score" value="${updateData.review_score}" class="form-control" />
									</td>
								</tr>
								<tr class="table-tr-height">
									<td>내용</td>
									<td colspan="3" class="text-left">
										<textarea name="review_contents" id="review_contents" class="form-control" rows="8">${updateData.review_contents}</textarea>
									</td>
								</tr>
								
								
							</tbody>
						</table>
					</form>		
				</div>
				<div class="contentBtn text-right">
					<input type="button" value="수정" id="mypageReviewUpdateBtn" class="btn btn-success">
					<input type="button" value="취소" id="mypageReviewCancelBtn" class="btn btn-success">
					<input type="button" value="목록" id="mypageReviewListBtn" class="btn btn-success">
				</div>
     </div>
    <div class="clear"></div>
  	</main>
	</div>
	</body>
</html>
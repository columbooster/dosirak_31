<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<!-- Bootstrap core CSS -->
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/include/dist/css/jumbotron-narrow.css"
	rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

 <script type="text/javascript">
         $(function(){
            /*수정 버튼 클릭 시 처리 이벤트*/
            $("#cardioUpdateFormBtn").click(function(){
            	goUrl = "/health/admin/cardioUpdateForm";
                $("#cardioData").attr("action",goUrl);
                $("#cardioData").submit();
            })
            
            /* 삭제 버튼 */
            $("#cardioDeleteBtn").click(function(){
            	if(confirm("정말 삭제하시겠습니까?")){
                    goUrl = "/board/boardDelete";
                    $("#cardioData").attr("action",goUrl);
                    $("#cardioData").submit();
            })
            
            /*삭제버튼 클릭 시 댓글 확인 후 처리 이벤트
            $("#cardioDeleteBtn").click(function(){
               $.ajax({
                  url:"/board/replyCnt",
                  type:"post",
                  data:"health_no="+$("#health_no").val(),
                  dataType:"text",
                  error:function(){
                     alert("시스템 오류")
                  },
                  success:function(resultData){
                     if(resultData==0){//댓글이 존재하지 않을 경우
                        $("#pwdChk").css("visibility","visible");
                        $("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color","#000099");
                        buttonCheck=2;
                     }else{ //댓글이 존재하는 경우
                        alert("댓글 존재시 게시물 작성할 수가 없습니다.\n댓글 삭제 후 다시 확인해주세요.");
                        return;
                     }
                  }
               })
            })*/
           
            //글쓰기 버튼
            $("#cardioInsertFormBtn").click(function(){
               location.href="/health/admin/healthWriteForm";
            })
            
            //목록 버튼
            $("#cardioListBtn").click(function(){
               location.href="/health/admin/cardioList?health_category_no=2"
            })
          
         });
</script>

</head>
	<div class="wrapper row3">
		
			<!-- main body -->
			<!-- ################################################################################################ -->
			<div class="content">
				<!-- ################################################################################################ -->
				<div id="gallery">
					<figure>
						<form name="cardioData" id="cardioData" method="post">
				            <input type="hidden" name="health_no" value="${cardioDetail.health_no }"/>
				            <input type="hidden" name="file" value="${cardioDetail.file }"/>
				            <input type="hidden" name="health_img" value="${cardioDetail.health_img }"/>
				         </form>
						<header class="heading">${cardioDetail.health_title }</header>
						<!-------------------------------------------------- 동영상 & 소개 공간 ---------------------------------------------------->
						<div >

							<section>
								<iframe width="560" height="315"
									src="https://www.youtube.com/embed/${cardioDetail.health_url }?mute=1&autoplay=1"></iframe>
								<div>
								</div>	
							</section>
						</div>
						<div>
							<input type="button" value="글수정" id="cardioUpdateFormBtn" class="btn btn-success" />
			                <input type="button" value="글삭제" id="cardioDeleteBtn" class="btn btn-success" />
			                <input type="button" value="글쓰기" id="cardioInsertFormBtn" class="btn btn-success" />
			                <input type="button" value="목록" id="cardioListBtn" class="btn btn-success" />
						</div>
						<div class="row marketing">
							<div class="col-lg-6">
								<h4>운동영상 댓글</h4>
								<p>댓글</p>
							</div>
						</div>

					</figure>
				</div>
				<!-- ################################################################################################ -->
				<!-- ################################################################################################ -->

				<!-- ################################################################################################ -->
			</div>
			<!-- ################################################################################################ -->
			<!-- / main body -->
			<div class="clear"></div>

	</div>
	
</body>
</html>

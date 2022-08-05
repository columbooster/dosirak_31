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
	$(function() {
		//저장 버튼 클릭 시 처리 이벤트
		$("#boardInsertBtn").click(function() {
			//입력값체크
			if (!chkData("#admin_id", "이름을"))
				return;
			else if (!chkData("#health_category_no", "카테고리를"))
				return;
			else if (!chkData("#health_name", "제목을"))
				return;
			else if (!chkData("#health_contents", "내용을"))
				return;
			else if (!chkFile($("#file")))
				return;
			else {
				$("#healthWriteForm").attr({
					"method" : "post",
					"enctype" : "multipart/form-data",
					//enctype 속성의 기본값은 "application/x-www.form-urlcencoded". POST방식 폼 전송에 기본값으로 사용
					"action" : "/health/admin/healthBoardInsert"
				});
				$("#healthWriteForm").submit();
			}
		});

		//취소버튼 클릭 시 처리 이벤트
		$("#boardCancelBtn").click(function() {
			$("#healthWriteForm").each(function() {
				this.reset();
			})
		})

		//목록버튼 클릭시 처리 이벤트
		$("#boardListBtn").click(function() {
			location.href = "/health/admin/hBoardlist";

		});
	})
</script>

</head>

	<div class="wrapper row3">
		<main class="container clear">
			<!-- main body -->
			<!-- ################################################################################################ -->
			<div class="content">
				<!-- ################################################################################################ -->
				<div id="gallery">
					<!-- 글쓰기 시작 -->

					<section>
						<div class="container">
							<div class="text-center">
								<h3>게시판 글 작성</h3>
							</div>

							<form class="form-horizontal" id="healthWriteForm"
								name="healthWriteForm">
								<div class="form-group">
									<label for="author" class="col-sm-2 control-label">작 성
										자</label>

									<div class="col-sm-10">
										<input type="text" class="form-control" id="admin_id"
											name="admin_id" placeholder="작성자 입력" maxlength="6">
									</div>

								</div>
								<div class="form-group">
									<label for="author" class="col-sm-2 control-label">카테고리</label>
									<div class="col-sm-10">
										<input type="radio" name="health_category_no" value="1">웨이트
										<input type="radio" name="health_category_no" value="2">유산소
									</div>

								</div>

								<div class="form-group">
									<label for="title" class="col-sm-2 control-label">글 제 목</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="health_name"
											name="health_name" placeholder="글제목 입력">
									</div>
								</div>
								<div class="form-group">
									<label for="content" class="col-sm-2 control-label">글 내
										용</label>
									<div class="col-sm-10">
										<textarea id="health_contents" name="health_contents"
											placeholder="글내용 작성" rows="8" class="form-control"></textarea>
									</div>
								</div>

								<div class="form-group">
									<label for="file" class="col-sm-2 control-label">파일첨부</label>
									<div class="col-sm-10">
										<input type="file" class="form-control" id="file" name="file" />
									</div>
								</div>
							</form>
							<div class="text-right">
								<button type="button" class="btn btn-primary"
									id="boardInsertBtn">저장</button>
								<button type="button" class="btn btn-primary"
									id="boardCancelBtn">취소</button>
								<button type="button" class="btn btn-primary" id="boardListBtn">목록</button>
							</div>
						</div>
					</section>
					<!-- 글쓰기 끝 -->
				</div>
				<!-- ################################################################################################ -->
				<!-- ################################################################################################ -->

				<!-- ################################################################################################ -->
			</div>
			<!-- ################################################################################################ -->
			<!-- / main body -->
			<div class="clear"></div>
		</main>

	</div>

</body>
</html>

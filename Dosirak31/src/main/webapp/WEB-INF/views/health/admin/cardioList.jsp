<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<script type="text/javascript">
<!-- 이미지 클릭 시 공지사항 상세 페이지 이동을 위한 처리 이벤트 -->
	$(function() {
		$(".goNoticeDetail").click(function() {
			let health_no = $(this).parents("tr").attr("data-num");
			$("#health_no").val(health_no);
			console.log("헬스번호 : " + health_no);
			$("#detailForm").attr({
				"meothd" : "get",
				"action" : "/health/noticeDetail"
			});
			$("#detailForm").submit();
		});
	});
<!-- 이미지 클릭 시 운동 동영상 상세 페이지 이동을 위한 처리 이벤트 -->
	$(function() {
		$(".goImgDetail").click(function() {
			let health_no = $(this).parents("tr").attr("data-num");
			$("#health_no").val(health_no);
			console.log("헬스번호 : " + health_no);
			$("#detailForm").attr({
				"meothd" : "get",
				"action" : "/health/cardioDetail"
			});
			$("#detailForm").submit();
		});
	});
	
</script>

</head>

	<div class="wrapper row3">
		<main class="container clear">
			<!-- main body -->
			<!-- ################################################################################################ -->
			<div class="content">
				<!-- ################################################################################################ -->
				<div id="gallery">
					<figure>
						<header class="heading">Cardio Exercise</header>
						<!-------------------------------------------------- 유산소 게시판 공지사항 리스트 시작 ---------------------------------------------------->
						<!-- 히든 상세 게시판 -->
						<form id="detailForm">
							<input type="hidden" id="health_no" name="health_no" />
						</form>
						<div id="cardioList" class="table-height">
							<table summary="유산소 게시판 공지사항 리스트 " class="table table-striped">
								<thead>
									<tr>
										<th data-value="health_no" class="order text-center col-md-1">글번호</th>
										<th class="text-left col-md-4">글제목</th>
										<th data-value="health_date" class="order col-md-1">작성일</th>
										<th class="text-center col-md-2">작성자</th>
										<th class="text-center col-md-1">조회수</th>
									</tr>
								</thead>
								<tbody id="list" class="table-striped text-center">
									<c:choose>
										<c:when test="${not empty cardioList }">
											<c:forEach var="cardioBoard" items="${cardioList }"
												varStatus="status">
												<tr class="text-center" data-num="${cardioBoard.health_no }">
													<th>${cardioBoard.health_no }</th>
													<!-- 게시글 번호 -->
													<th class="goNoticeDetail text-left">${cardioBoard.health_name }
														<!-- 조회수 --> <c:if test="${cardioBoard.health_hits > 0 }">
															<span class="reply_count">[${cardioBoard.health_hits}]</span>
														</c:if>
													</th>
													<!-- 게시글 제목 -->
													<th class="text-left">${cardioBoard.health_date }</th>
													<!-- 게시글 작성일 -->
													<th class="name">${cardioBoard.admin_id }</th>
													<!-- 게시글 작성자 -->
													<th class="read">${cardioBoard.health_hits }</th>
													<!-- 게시글 조회수 -->
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="4" class="tac text-center">유산소 공지사항 게시물이
													존재하지 않습니다</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<table>
								<!-------------------------------------------------- 유산소 게시판 공지사항 리스트 끝 ---------------------------------------------------->

								<!-------------------------------------------------- 유산소 게시판 운동 리스트(이미지) 시작 ---------------------------------------------------->
								<c:choose>
									<c:when test="${not empty cardioList }">
										<c:forEach var="imgBoard" items="${cardioList }"
											varStatus="status">
											<tr class="text-center" data-num="${imgBoard.health_no }">
												<td><img class="goImgDetail"
													src="/dosirak31img/health/${imgBoard.health_img }" /> <span>${imgBoard.health_img_name }</span>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4" class="tac text-center">유산소 동영상(이미지)
												게시물이 존재하지 않습니다</td>
										</tr>
									</c:otherwise>
								</c:choose>

							</table>
						</div>
					</figure>
				</div>
				<!-------------------------------------------------- 유산소 게시판 운동 리스트(이미지) 끝 ---------------------------------------------------->

				<!-- ################################################################################################ -->
				<!-------------------------------------------------- 게시판 페이지 바 시작 ---------------------------------------------------->
				<nav class="pagination">
					<ul>
						<li><a href="#">&laquo; Previous</a></li>
						<li class="current"><strong>1</strong></li>
						<li><a href="#">2</a></li>
						<li><strong>&hellip;</strong></li>
						<li><a href="#">6</a></li>
						<li><a href="#">7</a></li>		
						<li><a href="#">8</a></li>
						<li><a href="#">9</a></li>
						<li><strong>&hellip;</strong></li>
						<li><a href="#">14</a></li>
						<li><a href="#">15</a></li>
						<li><a href="#">Next &raquo;</a></li>
					</ul>
				</nav>
				<!-------------------------------------------------- 게시판 페이지 바 끝 ---------------------------------------------------->
			</div>
			<!-- ################################################################################################ -->
			<!-- / main body -->
			<div class="clear"></div>
		</main>
	</div>
	
</body>
</html>
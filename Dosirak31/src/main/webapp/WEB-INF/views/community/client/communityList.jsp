<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
      <style type="text/css">
      </style>
      <script type="text/javascript">
				$(function() {
					
					// 검색 후 검색 대상과 검색 단어 출력
					let word ="<c:out value='${communityVO.keyword}' />";
					let value="";
					if(word!=""){
						$("#keyword").val("<c:out value='${communityVO.keyword}' />");
						$("#search").val("<c:out value='${communityVO.search}' />");
						
						if($("#search").val()!='community_contents'){
							//:contains()는 특정 텍스트를 포함한 요소반환
							if($("#search").val()=='community_title') value = "#list tr td.goDetail";
							else if($("#search").val()=='client_id') value="#list tr td.name";
							console.log($(value+":contains('"+word+"')").html());
							
							$(value+":contains('"+word+"')").each(function() {
								let regex = new RegExp(word,'gi');
								$(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
							});
						}
						
					}
					
					// 입력 양식 enter 제거
					$("#keyword").bind("keydown", function(evnet){
						if(event.keyCode == 13){
							event.preventDefault();
						}
					});
					
					// 검색 대상이 변경될 때마다 처리 이벤트
					$("#search").change(function() {
						if($("#search").val()=="all"){
							$("#keyword").val("전체 데이터 조회합니다.");
						}else if($("#search").val()!="all"){
							$("#keyword").val("");
							$("#keyword").focus();
						}
					});
					
					// 검색 버튼 클릭 시 처리 이벤트
					$("#searchData").click(function() {
						if($("#search").val()!="all"){ // 제목 /내용/작성자 선택시 검색어 유효성 체크.
							if(!chkData("#keyword","검색어를")) return;
						}
						goPage();
						
					});
					
					
					// 글쓰기 버튼 클릭시 처리 이벤트.
					$("#insertFormBtn").click(function() {
						location.href = "/community/client/writeForm";
					});
					
					// 제목 클릭시 상세 페이지 이동을 위한 처린 이벤트
					$(".goDetail").click(function() {
						let community_no = $(this).parents("tr").attr("data-num");
						$("#community_no").val(community_no);
						console.log("글번호 : " + community_no);
						// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
						$("#detailForm").attr({
							"method":"get",
							"action":"/community/client/communityDetail"
						});
						$("#detailForm").submit();
					});
					
					$(".paginate_button a").click(function(e) {
						e.preventDefault();
						$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
						goPage();
					});
					
				});
				
				// 검색을 위한 실질적인 처리 함수
				function goPage(){
					if($("#search").val()=="all"){
						$("#keyword").val("");
					}
					$("#f_search").attr({
						"method":"get",
						"action":"/community/client/communityList"
					});
					$("#f_search").submit();
				}
				
			</script>
      
</head>
<body>
<div class="wrapper row2 bgded"
	style="background-image: url('/resources/images/demo/backgrounds/01.png');">
	<div class="overlay">
		<div id="breadcrumb" class="clear">
			
			<ul>
				<li><a href="/resources/index.html">Home</a></li>
				<li><a href="/community/client/communityList">Community</a></li>
			</ul>
			
		</div>
	</div>
</div>

<div class="wrapper row3">
	<main class="container clear">
		<div class="contentContainer container">
				<!-- <div class="contentTit page-header"><h3 class="text-center">게시판 리스트</h3></div>  -->
				
				<form id="detailForm">
					<input type="hidden" id="community_no" name="community_no" />
				</form>
				
					<%-- ==================== 검색 기능 시작 ========================= --%>
				<div id="communitySearch" class="contentBtn text-right">
					<form id="f_search" name="f_search" class="form-inline">
						<%-- 페이징 처리를 위한 파라미터 --%>
						<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
						<div class="form-group">
							<label>검색조건</label>
							<select id="search" name="search" class="form-control">
								<option value="all">전체</option>
								<option value="community_title">제목</option>
								<option value="community_contents">내용</option>
								<option value="client_id">작성자</option>
							</select>
							<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control">
							<button type="button" id="searchData" class="btn btn-success">검색</button>
						</div>
					</form>
				</div>	
					<%-- ==================== 검색 기능 종료 ========================= --%>
				
				<%-- ==================== 리스트 시작 ========================= --%>
				<div id="communityList" class="table-height">
					<table summary="게시판 리스트" class="table table-striped">
						<thead>
							<tr>
								<th data-value="community_no" class="order text-center col-md-1" >글번호</th>
								<th class="text-center col-md-4">글제목</th>
								<th class="text-center col-md-2">작성자</th>
								<th data-value="community_date" class="order col-md-1">작성일</th>
								<th class="text-center col-md-1">조회수</th>
								<th class="text-center col-md-4">이미지</th>
							</tr>
						</thead>
						<tbody id="list" class="table-striped">
							<!-- 데이터 출력 -->
							<c:choose>
								<c:when test="${not empty communityList }">
									<c:forEach var="community" items="${communityList}" varStatus="status">
										<tr class="text-center" data-num="${community.community_no}">
											<td>${community.community_no}</td>
											<td class="goDetail text-left">
												${community.community_title}
												<c:if test="${community.reply_cnt > 0}"><span class="reply_count">[${community.reply_cnt}]</span></c:if>
											</td>
											<td class="name">${community.client_id}</td>
											<td class="text-left">${community.community_date}</td>
											<td class="text-center">${community.community_hits}</td>
											<td>
												<c:if test="${not empty community.file_thumb}">
													<img src="/dosirak31img/community/thumbnail/${community.file_thumb}" />
												</c:if>
												<c:if test="${empty community.file_thumb}">
													<img src="/resources/images/common/noimage.png" />
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
					<%-- ==================== 리스트 종료 ========================= --%>
					
				<%-- ======== 페이징 처리를 커스텀태그(pagination)를 정의============ --%>
				<tag:pagination endPage="${pageMaker.endPage}" startPage="${pageMaker.startPage}" amount="${pageMaker.cvo.amount}" 
				prev="${pageMaker.prev}" pageNum="${pageMaker.cvo.pageNum}" next="${pageMaker.next}" />		
					
					<%-- ==================== 글쓰기 버튼 출력 시작 ========================= --%>
				<div class="contentBtn text-right">
					<c:if test="${sessionScope.client_info.client_id != null}">
						<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-success">
					</c:if>
				</div>	
					<%-- ==================== 글쓰기 버튼 출력 종료 ========================= --%>
			</div>
	</main>		
</div>
	</body>
</html>
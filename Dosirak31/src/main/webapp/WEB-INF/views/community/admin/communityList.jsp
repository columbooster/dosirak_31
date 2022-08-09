<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>    


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
					$("#searchBtn").click(function() {
						if($("#search").val()!="all"){ // 제목 /내용/작성자 선택시 검색어 유효성 체크.
							if(!chkData("#keyword","검색어를")) return;
						}
						goPage();
						
					});
					
					
					// 글쓰기 버튼 클릭시 처리 이벤트.
					$("#insertFormBtn").click(function() {
						location.href = "/community/client/writeForm";
					});
					
					
					$(".paginate_button a").click(function(e) {
						e.preventDefault();
						$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
						goPage();
					});
					
				});	// $ 함수 종료문
				
				// 검색을 위한 실질적인 처리 함수
				function goPage(){
					if($("#search").val()=="all"){
						$("#keyword").val("");
					}
					$("#f_search").attr({
						"method":"get",
						"action":"/community/admin/communityList"
					});
					$("#f_search").submit();
				}
				
			</script>



<div class="wrapper row3">
	<main class="container clear">
<h2 class="sub-header">Community 관리</h2>


	<%-- ==================== 검색 기능 시작 ========================= --%>
				<div class="well">
					<form id="f_search" class="form-inline">
						<%-- 페이징 처리를 위한 파라미터 --%>
						<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
						
						<h3><span class="label label-success">검색조건</span> </h3>
						<div class="form-group">
							<select id="search" name="search" class="form-control">
								<option value="community_title">제목</option>
								<option value="client_id">작성자</option>
								<option value="community_contents">내용</option>
								<option value="community_date">작성일자</option>
							</select>
						</div>
						<div class="form-group" id="textCheck">
							<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="form-control">
						</div>
						<div class="form-group" id="dataCheck">	
							<input type="date" name="start_date" id="start_date" placeholder="시작일자" class="form-control">
							<input type="date" name="end_date" id="end_date" placeholder="종료일자" class="form-control">
						</div>
						<button type="button" id="searchBtn" class="btn btn-primary">Search</button>
						<button type="button" id="allSearchBtn" class="btn btn-primary" >All Search</button>
					</form>
				</div>	
					<%-- ==================== 검색 기능 종료 ========================= --%>

			<%-- 게시판 리스트 --%>
				<div class="table-responsive table-height">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th class="text-center" >글번호</th>
								<th class="text-center">글제목</th>
								<th class="text-center">작성일</th>
								<th class="text-center">작성자</th>
							</tr>
						</thead>
						<tbody>
							<!-- 데이터 출력 -->
							<c:choose>
								<c:when test="${not empty communityList }">
									<c:forEach var="community" items="${communityList}" varStatus="status">
										<tr class="text-center" data-num="${community.community_no}">
											<td>${count - status.index}</td>
											<td class="goDetail tal">${community.community_title}</td>
											<td>${community.community_date}</td>
											<td class="name">${community.client_id}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4" class="text-center">등록된 게시물이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>

				<%-- ======== 페이징 처리를 커스텀태그(pagination)를 정의============ --%>
				<tag:pagination endPage="${pageMaker.endPage}" startPage="${pageMaker.startPage}" amount="${pageMaker.cvo.amount}" 
				prev="${pageMaker.prev}" pageNum="${pageMaker.cvo.pageNum}" next="${pageMaker.next}" />
			</main>
		</div>
			


     
     
     
  
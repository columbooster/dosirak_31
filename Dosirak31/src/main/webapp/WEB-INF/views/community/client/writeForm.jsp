<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
      <style type="text/css"></style>
      <script type="text/javascript">
				$(function() {
					// 저장 버튼 클릭 시 처리 이벤트
					$("#communityInsertBtn").click(function() {
						// 입력값 체크
						/*if(!chkData("#client_id","아이디를")) return;  아이디 자동 입력되게 만들자. */
						if(!chkData("#community_title","제목을")) return;
						else if(!chkData("#community_contents","작성할 내용을")) return;
						else if(!chkData("#community_pw","비밀번호를")) return;
						else {
							if($("#file").val()!=""){
								if(!chkFile($("#file"))) return;
							}
							
							$("#f_writeForm").attr({
								"method":"post",
								"enctype":"multipart/form-data", //enctype 속성의 기본 값은 "applictuon/x-www-form-urlcencoded". POST 방식 폼 전송에 기본값으로 사용
								"action":"/community/client/communityInsert"
							});
							$("#f_writeForm").submit();
						}
					});
					
					// 취소 버튼 클릭 시 처리 이벤트
					$("#communityCancelBtn").click(function() {
						$("#f_writeForm").each(function() {
							this.reset();
						});
					});
					
					// 목록 버튼 클릭 시 처리 이벤트
					$("#communityListBtn").click(function() {
						location.href = "/community/client/communityList";
					});
				});
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
				<div class="contentTit page-header"><h3 class="text-center">게시판 글작성</h3></div>
				
				<div class="contentTB text-center">
					<form id="f_writeForm" name="f_writeForm" class="form-horizontal">
						<table class="table table-bordered">
							<colgroup>
								<col width="20%" />
								<col width="65%" />
								<col width="15%" />
							</colgroup>
							<tbody>
								<tr>
									<td>작성자</td>
									<td class="text-left"><input type="text" name="client_id" id="client_id" class="form-control" value="<c:out value='${sessionScope.client_info.client_id}'/>" readonly="readonly" /></td>
									<td class="text-left"><label><input type="checkbox" name="community_category_no" value="QnA">QnA</label>
														  <label><input type="checkbox" name="community_category_no" value="community">community</label>
									</td>
								</tr>
								<tr>
									<td>글제목</td>
									<td class="text-left" colspan="2"><input type="text" name="community_title" id="community_title" class="form-control" /></td>
									
								</tr>
								<tr>
									<td>글내용</td>
									<td class="text-left" colspan="2"><textarea name="community_contents" id="community_contents" class="form-control" rows="8"></textarea></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td class="text-left"><input type="text" name="community_pw" id="community_pw" class="form-control" /></td>
									<td class="text-left"><label><input type="checkbox" name="community_closed" value="비밀글">비밀글</label></td>
								</tr>
								<tr>
									<td>파일첨부</td>
									<td class="text=left" colspan="2"><input type="file" name="file" id="file" /></td>
								</tr>
							</tbody>
						</table>
						
						<div class="text-right">
							<input type="button" value="저장" id="communityInsertBtn" class="btn btn-success">
							<input type="button" value="취소" id="communityCancelBtn" class="btn btn-success">
							<input type="button" value="목록" id="communityListBtn" class="btn btn-success">
						</div>	
					</form>
				</div>
			</div>
		</main>
	</div>		
	</body>
</html>
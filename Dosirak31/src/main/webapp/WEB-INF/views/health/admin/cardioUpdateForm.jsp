<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<script type="text/javascript">
	$(function() {
		
		//수정버튼 클릭 시 처리 이벤트
		$("#cardioUpdateBtn").click(function() {
			//입력값 체크
			if (!chkData("#health_title", "제목을")) return;
			else if (!chkData("#health_contents","작성할 내용을")) return;
			else{
				if($("#file").val()!==""){
					if(!chkFile($("#file"))) return;
				}
				$("#cardioUpdateForm").attr({
					"method" : "post",
					"enctype":"multipart/form-data",
					"action" : "/health/admin/cardioUpdateForm"
				});
				$("#cardioUpdateForm").submit();
			}
		});
		
		/* 취소버튼 클릭시 처리 이벤트 */
		$("#cardioCancelBtn").click(function() {
			location.href = "/health/admin/cardioList";
		})

	})
</script>
</head>
<body>
	<div class="contentContainer container">
		<form class="form-horizontal" id="cardioUpdateForm" name="cardioUpdateForm">
			<input type="hidden" id="health_no" name="health_no" value="${updateData.health_no }" />
			<input type="hidden" id="file" name="file" value="${updateData.file }" />
			<input type="hidden" id="health_img" name="health_img" value="${updateData.health_img }" />
			
			<table summary="게시판 상세보기" class="table table-bordered">

				<!--============ 상세정보 보여주기 시작=========== -->

				<tr>
					<td class="col-md-3">글번호</td>
					<td class="text-left col-md-5">${updateData.health_no }</td>
					<td class=" col-md-3">작성일</td>
					<td class="text-center col-md-5">${updateData.health_date }</td>
				</tr>
				<tr>
					<td class="col-md-4">작성자</td>
					<td colspan="3" class="col-md-8">${updateData.admin_id }</td>
				</tr>
				<tr>
					<td class="col-md-4">글제목</td>
					<td colspan="3" class="col-md-8"><input type="text"
						name="health_title" id="health_title" value="${updateData.health_title }" /></td>
				</tr>
				<tr>
					<td class="col-md-4">글내용</td>

					<td colspan="3" class="col-md-8"><textarea rows="10" cols="50"
							name="health_contents" id="health_contents">${updateData.health_contents }</textarea></td>
				</tr>
				<tr>
					<td>이미지 파일 첨부</td>
					<td colspan="3" class="text-left"><input type="file"
						name="image" id="image" /></td>
				</tr>
				<tr>
					<td>동영상 URL 입력</td>
					<td colspan="3" class="text-left"><input type="file"
						name="videoUrl" id="videoUrl" /></td>
				</tr>
			</table>
		</form>
		<div class="text-right">
			<button type="button" class="btn btn-primary" id="cardioUpdateBtn">수정완료</button>
			<button type="button" class="btn btn-primary" id="cardioCancelBtn">취소</button>
		</div>
	</div>
</body>
</html>
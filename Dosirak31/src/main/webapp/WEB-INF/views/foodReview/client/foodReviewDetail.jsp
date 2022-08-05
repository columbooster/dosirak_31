<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>



		<script type="text/javascript">
	
		</script>
</head>
	<body>
		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="review_no" value="${detail.review_no }" />
		</form>
		
		<div>
        <h2>게시글 상세보기</h2>
            <table>
            <tbody>
                <tr>
                    <th>내용</th>
                    <td>${detail.review_contents }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${detail.review_name }</td>
                </tr>
                <tr>
                    <th>작성시간</th>
                    <td>${detail.review_date }</td>
                </tr>
                <tr>
                    <th>점수</th>
                    <td>${detail.review_score }</td>
                </tr>
            </tbody>   
            </table>
            <input class="btn" type="submit" value="새글 작성">
            <input class="btn" type="reset" value="글 수정">
            <input class="btn" type="button" value="글 삭제">
            <input class="btn" type="button" value="목록으로">   
    </div>
</body>
</html>
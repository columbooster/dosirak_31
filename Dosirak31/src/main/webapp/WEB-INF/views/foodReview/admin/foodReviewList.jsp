<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>



		<script type="text/javascript">
	
		</script>
</head>
<body id="top">
	<div class="wrapper row3">
	<main class="container clear"> 
    <div class="content">
	 <div id="comments">
	      <h2>Comments</h2>
	      	<!-- 페이징 처리를 위한 파라미터 -->
	      	<form id="f_search" name="f_search" class="form-inline">
	      		<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
	      		<input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
	      	</form>
	      	<!-- 페이징 처리를 위한 파라미터 -->
	      	
	      	<c:choose>
		      	<c:when test="${not empty foodReviewList}" >
			      	<c:forEach var="review" items="${foodReviewList}" varStatus="status">
				        <ul data-num="${review.review_no}">
				          <li>
				            <article>
				              <header>
				                <figure class="avatar"><img src="/resources/images/demo/avatar.png" alt=""></figure>
				                <address>
				                By <a href="#">${review.review_name}</a>
				                </address>
				                <span>${review.review_score}</span>
				                <div>${review.review_date}</div>
				              </header>
				              <div class="comcont">
				                <p>${review.review_contents}</p>
				              </div>
				            </article>
				          </li>
				        </ul> 
			        </c:forEach>
		        </c:when>
		        <c:otherwise>
		        	<div>등록된 게시글이 존재하지 않습니다.</div>
		        </c:otherwise>
	        </c:choose>
      </div>
      </div>
    <div class="clear"></div>
  	</main>
</div>
</body>
</html>
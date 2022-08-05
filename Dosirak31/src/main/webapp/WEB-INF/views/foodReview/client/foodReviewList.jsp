<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>



		<script type="text/javascript">
	
		</script>
</head>
	<body>

		
<div class="wrapper row2 bgded" style="background-image:url('/resources/images/demo/backgrounds/01.png');">
  <div class="overlay">
    <div id="breadcrumb" class="clear"> 
      
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Lorem</a></li>
        <li><a href="#">Ipsum</a></li>
        <li><a href="/mypage/client/mypageMain">MYPAGE</a></li>
      </ul>
      
    </div>
  </div>
</div>











<!-- main body @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="wrapper row3">
	<main class="container clear"> 
    <div class="content"> 
     
      <div id="comments">
	      <h2>Comments</h2>
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
<!-- main body @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->







<!-- 상단으로 올라가는 페이지@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
	</body>
</html>
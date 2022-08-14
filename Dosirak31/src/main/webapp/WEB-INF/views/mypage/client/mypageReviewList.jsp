<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<style type="text/css">
			div.sidebar one_quarter first{
				height: 100%;
			}
			
			div.comcont {
				width: 100%;
			}
			
			a.goDetail {
				float: right;
			}
			
		</style>

		<script type="text/javascript">
			$(function() {
				
				// 편집 클릭시 상세 페이지 이동
				$(".goDetail").click(function() {
					let review_no = $(this).attr("data-num");
					$("#review_no").val(review_no);
					console.log("글번호 : " + review_no);
					// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
					$("#detailForm").attr({
						"method":"get",
						"action":"/mypage/client/mypageReviewDetail"
					});
					$("#detailForm").submit();
				});
				
				$(".paginate_button a").click(function(e) {
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
			});
			
			function goPage() {
				$("#f_search").attr({
					"method" : "get",
					"action" : "/mypage/client/mypageReviewList"
				});
				$("#f_search").submit();
			}
		</script>
</head>
	<body>
		<body id="top">
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2 bgded" style="background-image:url('/resources/images/common/mypagereview.jpeg'); height: 300px;">
  
    <div id="breadcrumb" class="clear"> 
      <!-- ################################################################################################ -->
      
      <!-- ################################################################################################ -->
    </div>
  
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="sidebar one_quarter first"> 
      <!-- ################################################################################################ -->
      <h6>Category</h6>
      <nav class="sdb_holder">
        <ul>
          <li><a href="#">회원정보</a></li>
          <li><a href="#">주문 내역</a>
          <li><a href="/mypage/client/mypageReviewList">나의 리뷰</a>
            <ul>
              <li><a href="/foodReview/client/writeForm">리뷰 입력</a></li>
            </ul>
          </li>
          
        </ul>
      </nav>
      </div>
      <!-- ################################################################################################ -->
      <div class="content three_quarter">
      <div class="content">
	 <div id="comments">
	      <div class="header-title">
        		"My page"
        	<span class="right-arrow">&gt;</span>
        	<strong>Reviews</strong>
        	</div>
       		<h3 class="title">리뷰</h3>
	      	<form id="detailForm">
	      		<input type="hidden" id="review_no" name="review_no" />
	      	</form>
	   
	      	<!-- 페이징 처리를 위한 파라미터 -->
	      	<form id="f_search" name="f_search" class="form-inline">
	      		<input type="hidden" name="client_no" value="${sessionScope.client_no }">
	      		<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
	      		<input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
	      	</form>
	      	
	      	
	      	<form name="f_data" id="f_data" method="post">
	      		<input type="hidden" name="review_no" value="${mypage.review_no }">
	      	</form>
	     
	      	<c:choose>
		      	<c:when test="${not empty mypageReviewList}" >
			      	<c:forEach var="mypage" items="${mypageReviewList}" varStatus="status">
				        <ul data-num="${mypage.review_no}">
				          <li>
				            <article>
				              <header>
				                <figure class="avatar"><img src="/resources/images/demo/avatar.png" alt=""></figure>
				                <address>
				                By <a href="#">${mypage.review_name}</a>
				                </address>
				                <span>별점 : ${mypage.review_score}</span>
				                <div>${mypage.review_date}</div>
				              </header>
				              <div class="comcont">
				                <p>${mypage.review_contents}</p>
				              </div>
				              <a class="goDetail" href="/mypage/client/mypageReviewDetail?review_no=${mypage.review_no }">편집</a>
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
      </div>

	 	</main>
	</div>	
	       <%-- ===================페이징 출력=================== --%>
     <tag:pagination pageNum="${pageMaker.cvo.pageNum }" amount="${pageMaker.cvo.amount }"
     startPage="${pageMaker.startPage }" endPage="${pageMaker.endPage }" prev="${pageMaker.prev }" next="${pageMaker.next }" />
		
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		 
<!-- JAVASCRIPTS -->
<script src="/resources/layout/scripts/jquery.min.js"></script>
<script src="/resources/layout/scripts/jquery.backtotop.js"></script>
<script src="/resources/layout/scripts/jquery.mobilemenu.js"></script>
	</body>
</html>
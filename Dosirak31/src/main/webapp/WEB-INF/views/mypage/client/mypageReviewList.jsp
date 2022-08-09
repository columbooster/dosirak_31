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
<div class="wrapper row1">
  <header id="header" class="clear"> 

    <div id="logo" class="fl_left">
      <h1><a href="/resources/index.html">DOSIRAK31</a></h1>
    </div>
    <nav id="mainav" class="fl_right">
      <ul class="clear">
        <li class="active"><a href="/resources/index.html">Home</a></li>
        <li><a href="/health/hBoardList">WORKOUT</a>  
        </li>
        <li><a class="drop" href="/food/foodNoClientBasicList">FOOD</a>
          <ul>
            <li><a href="/food/foodNoClientBasicList">FOOD</a>
            <li><a href="/foodReview/client/foodReviewList">FOOD REVIEW</a>
            </li>
          </ul>
        </li>
        <li><a href="/community/client/communityList">COMMUNITY</a></li>
        <li><a class="drop" href="/client/loginmain">LOGIN</a>
       	 <ul>
            <li><a href="/client/loginmain">CLIENT LOGIN</a></li>
            <li><a href="/food/foodAdminBasicList">ADMIN LOGIN</a></li>
          </ul>
        </li>
        <li><a href="/signup/client/signupForm">SIGN UP</a></li>
        <li><a href="/mypage/client/mypage">MY PAGE</a></li>
      </ul>
    </nav>
  </header>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2 bgded" style="background-image:url('/resources/images/demo/backgrounds/01.png');">
  <div class="overlay">
    <div id="breadcrumb" class="clear"> 
      <!-- ################################################################################################ -->
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Lorem</a></li>
        <li><a href="#">Ipsum</a></li>
        <li><a href="#">Sidebar Left</a></li>
      </ul>
      <!-- ################################################################################################ -->
    </div>
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
          <li><a href="/foodReview/client/foodReviewDetail">나의 리뷰</a>
            <ul>
              <li><a href="/foodReview/client/writeForm">리뷰 입력</a></li>
            </ul>
          </li>
          
        </ul>
      </nav>
      </div>
      <!-- ################################################################################################ -->
      <div class="content">
	 <div id="comments">
	      <h2>Comments</h2>
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
				                <span>${mypage.review_score}</span>
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
	        
	        <%-- ======== 페이징 처리를 커스텀태그(pagination)를 정의============ --%>
				<tag:pagination endPage="${pageMaker.endPage}" startPage="${pageMaker.startPage}" amount="${pageMaker.cvo.amount}" 
				prev="${pageMaker.prev}" pageNum="${pageMaker.cvo.pageNum}" next="${pageMaker.next}" />
	        
      </div>
      </div>
      
      
      
      
      
      
      
   		 
	 	</main>
		</div>	
		
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		<div class="wrapper row5">
  <footer id="footer" class="clear"> 
    <!-- ################################################################################################ -->
    <div class="one_quarter first">
      <h6 class="title">Viral</h6>
      <address class="btmspace-15">
      Company Name<br>
      Street Name &amp; Number<br>
      Town<br>
      Postcode/Zip
      </address>
      <ul class="nospace">
        <li class="btmspace-10"><span class="fa fa-phone"></span> +00 (123) 456 7890</li>
        <li><span class="fa fa-envelope-o"></span> info@domain.com</li>
      </ul>
    </div>
    <div class="one_quarter">
      <h6 class="title">Quick Links</h6>
      <ul class="nospace linklist">
        <li><a href="#">Home Page</a></li>
        <li><a href="#">Blog</a></li>
        <li><a href="#">Gallery</a></li>
        <li><a href="#">Portfolio</a></li>
        <li><a href="#">Contact Us</a></li>
      </ul>
    </div>
    <div class="one_quarter">
      <h6 class="title">From The Blog</h6>
      <article>
        <h2 class="nospace"><a href="#">Praesent Vestibulum</a></h2>
        <time class="smallfont" datetime="2045-04-06">Friday, 6<sup>th</sup> April 2045</time>
        <p>Vestibulumaccumsan egestibulum eu justo convallis augue estas aenean elit intesque sed.</p>
      </article>
    </div>
    <div class="one_quarter">
      <h6 class="title">Grab Our Newsletter</h6>
      <form method="post" action="#">
        <fieldset>
          <legend>Newsletter:</legend>
          <input class="btmspace-15" type="text" value="" placeholder="Name">
          <input class="btmspace-15" type="text" value="" placeholder="Email">
          <button type="submit" value="submit">Submit</button>
        </fieldset>
      </form>
    </div>
    <!-- ################################################################################################ -->
  </footer>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row6">
  <div id="copyright" class="clear"> 
    <!-- ################################################################################################ -->
    <p class="fl_left">Copyright &copy; 2018 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">Template by <a target="_blank" href="https://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 
<!-- JAVASCRIPTS -->
<script src="/resources/layout/scripts/jquery.min.js"></script>
<script src="/resources/layout/scripts/jquery.backtotop.js"></script>
<script src="/resources/layout/scripts/jquery.mobilemenu.js"></script>
	</body>
</html>
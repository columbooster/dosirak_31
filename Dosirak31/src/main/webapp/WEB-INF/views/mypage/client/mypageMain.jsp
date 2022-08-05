<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

	<script type="text/javascript">
	
	</script>
	
	
</head>
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
<!-- ################################################################################################ -->
<div class="wrapper row2 bgded" style="background-image:url('../images/demo/backgrounds/01.png');">
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
          <li><a href="/foodReview/client/foodReviewDetail">내가 쓴 리뷰들</a>
            <ul>
              <li><a href="/foodReview/client/writeForm">리뷰 입력</a></li>
              <li><a href="/foodReview/client/updateForm">리뷰 수정</a></li>
              <li><a href="#">리뷰 삭제</a></li>
            </ul>
          </li>
          
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <div class="content three_quarter"> 
      <!-- ################################################################################################ -->
      <h1>회원정보</h1>
      <div class="scrollable">
        <table>
          <tbody>
            <tr>
              <th class="one_quarter">회원아이디</th>
              <td class="one_quarter">1234</td>
            </tr>
          
          
            <tr>
              <th class="one_quarter">회원비밀번호</th>
              <td class="one_quarter">1234</td>
            </tr>
            <tr>
              <th class="one_quarter">회원이름</th>
              <td class="one_quarter">1234</td>
            </tr>
            <tr>
              <th class="one_quarter">회원이메일</th>
              <td class="one_quarter">1234</td>
            </tr>
            <tr>
              <th class="one_quarter">회원핸드폰번호</th>
              <td class="one_quarter">1234</td>
            </tr>
            <tr>
              <th class="one_quarter">회원 주소</th>
              <td class="one_quarter">1234</td>
            </tr>
          </tbody>
        </table>
      </div>
      
      <!-- ################################################################################################ -->
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
      <%-- <jsp:include page="../../foodReview/client/foodReviewList.jsp" />  --%>     
<!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    
    <!-- / main body -->
    <div class="clear"></div>
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
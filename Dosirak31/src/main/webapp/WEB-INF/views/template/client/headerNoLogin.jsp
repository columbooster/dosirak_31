<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page trimDirectiveWhitespaces="true" %>
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
        <li><a href="/food/foodNoClientBasicList">FOOD</a>
          <ul>
            <li><a href="/food/foodNoClientBasicList">MY LUNCHBOX</a></li>
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
      </ul>
    </nav>
   
  </header>
</div>
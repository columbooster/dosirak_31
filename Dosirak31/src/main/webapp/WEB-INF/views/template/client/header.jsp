<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page trimDirectiveWhitespaces="true" %>
 <div class="wrapper row1">
  <header id="header" class="clear"> 
  
    <div id="logo" class="fl_left">
      <h1><a href="/client/successlogin">DOSIRAK31</a></h1>
    </div>
    <nav id="mainav" class="fl_right">
      <ul class="clear">
        <li class="active"><a href="/client/successlogin">Home</a></li>
        <li><a href="/health/hBoardList">WORKOUT</a>  
        </li>
        <li><a class="drop" href="/food/foodClientBasicList">FOOD</a>
          <ul>
            <li><a href="/food/foodClientBasicList">MY LUNCHBOX</a></li>
            <li><a href="/foodReview/client/foodReviewList">FOOD REVIEW</a>
            </li>
          </ul>
        </li>
        <li><a class="drop" href="/community/client/communityList">COMMUNITY</a>
          <ul>
            <li><a href="/community/client/communityList?community_category_no=0">FREE COMMUNITY</a></li>
            <li><a href="/community/client/communityList?community_category_no=1">QnA COMMUNITY</a></li>
          </ul>
        </li>
        <li><a href="/mypage/client/mypageMain">MYPAGE</a></li>
        <li><a href="/client/logout">LOGOUT</a></li>
      </ul>
    </nav>
   
  </header>
</div>
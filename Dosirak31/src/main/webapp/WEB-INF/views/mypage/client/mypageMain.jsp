<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	
	<style type="text/css">
	 section#content ul li { display:inline-block; margin:10px; }
	 section#content div.goodsThumb img { width:200px; height:200px; }
	 section#content div.goodsName { padding:10px 0; text-align:center; }
	 section#content div.goodsName a { color:#000; }
	 section#content ul.client_info{margin:0px 0px;}
	 section#content ul li { border:5px solid #eee; padding:10px 20px; margin:40px 0px 0px 0px; width:500px; height:auto;}
	 section#content .client_info span { font-size:15px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
	 
	</style>
	
	<style type="text/css">
			.btn{
				float: right;
			}
			.btn1{
				display :inline-block;
			}
			
	</style>
	
	
	<script type="text/javascript">
		let buttonCheck = 0;	// 수정과 삭제를 구별하기 위한 변수
		$(function() {
			
			// 회원수정버튼 클릭시 처리 이벤트
			$("#client_infoUpdateBtn").click(function() {
				
				location.href = "/mypage/client/cUpdateForm";
			});
			
			
			// 회원삭제버튼 클릭시 처리 이벤트
			$("#client_infoDeleteBtn").click(function() {
				
				buttonCheck = 2;
			}); 
		});
		
		function orderList(client_no){
			location.href="/mypage/client/mypageOrderList?client_no="+client_no;
		}
	</script>
	
	
</head>
<body id="top">
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2 bgded" style="background-image:url('/resources/images/demo/backgrounds/01.png');">
  <div class="overlay">
    <div id="breadcrumb" class="clear"> 
      <!-- ################################################################################################ -->
      <ul>
       <li><a href="/client/successlogin">Home</a></li>
        <li><a href="/mypage/client/mypageMain">MYPAGE</a></li>
        <li><a href="/mypage/client/mypageMain">MYPAGE</a></li>
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
          <li><a href="/mypage/client/mypageMain">회원정보</a></li>
          <li><a href="javascript:orderList(${sessionScope.client_info.client_no })">주문 내역</a>
          <li><a href="/mypage/client/mypageReviewList">나의 리뷰</a>
            <ul>
              <li><a href="/foodReview/client/writeForm">리뷰 입력</a></li>
              
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
      <h1>Client_Info</h1>
      <form>
      	<input type="hidden" name="client_no" value="${sessionScope.client_info.client_no }">
      </form> 
      <div id="comments">
        <section id="content">
 
					 <ul class="client_info">
					 
					  <li>		
					  <div>
					   <p><span>회원아이디</span>${client_info.client_id }</p>
					   <p><span>회원비밀번호</span>${client_info.client_pw }</p>
					   <p><span>회원이름</span>${client_info.client_name}</p>
					   <p><span>회원이메일</span>${client_info.client_email}</p>
					   <p><span>핸드폰번호</span>${client_info.client_phone}</p>
					   <p><span>회원주소</span>${client_info.client_address}</p>
					   <p><span>가입일</span>${client_info.client_date}</p>
					  <c:if test="${not empty client_info.client_update}">
					  	 <p><span>정보 변경일</span>${client_info.client_update }</p>
					   </c:if>		   
					  </div>				  
					  </li>
					 </ul>				
		</section>
      </div>
      <div class="btn">
      <input type="button" value="회원정보 수정 및 탈퇴" id="client_infoUpdateBtn" class="dosirakBtn">
      </div>
      
      <!-- ################################################################################################ -->      
<!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 

</body>
</html>
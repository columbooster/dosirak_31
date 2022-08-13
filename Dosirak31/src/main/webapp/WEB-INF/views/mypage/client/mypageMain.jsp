<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	
	<style type="text/css">
	 section#content ul li { display:inline-block; margin:10px; }
	 section#content div.goodsThumb img { width:200px; height:200px; }
	 section#content div.goodsName { padding:10px 0; text-align:center; }
	 section#content div.goodsName a { color:#000; }
	 section#content ul.client_info{margin:0px 0px;}
	 section#content ul li { border:5px solid #eee; padding:10px 20px; margin:40px 0px 0px 0px; width:500px; height:250px;}
	 section#content .client_info span { font-size:15px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
	 
			 .btn{
				float: right;
			}
			.btn1{
				display :inline-block;
			}

			.btn{
				float: right;
			}
			.btn1{
				display :inline-block;
			}
			
	</style>
	<style type="text/css">
		.info-title {
			display : inline;
			width:200px; height:50px; 
			background-color:#234234;

		}
		.info-subtitle {
			display :inline-block;
			background-color:#481525;
		}
		
	</style>
	
	
	<script type="text/javascript">
		let buttonCheck = 0;	// 수정과 삭제를 구별하기 위한 변수
		$(function() {
			
			// 회원수정,삭제 버튼 클릭시 처리 이벤트
			$("#client_infoUpdateBtn").click(function() {
				
				location.href = "/mypage/client/cUpdateForm";
			});
		
		});
	</script>
	
	
</head>
<body id="top">
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2 bgded" style="background-image:url('/resources/images/common/info1.png'); height: 200px;">
  
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
          <li><a href="/mypage/client/mypageOrderList">주문 내역</a>
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
      <form>
      	<input type="hidden" name="client_no" value="${sessionScope.client_info.client_no }">
      </form> 
    <div class="content three_quarter"> 
      <!-- ################################################################################################ -->
      <div id="comments">
        <section id="content">
        	<div class="header-title">
        		"My page"
        	<span class="right-arrow">&gt;</span>
        	<strong>Client_info</strong>
        	</div>
       		<h3 class="title">회원정보</h3>

     		<div class="block">
          	
            	<div class="table">
              		<div class="info-title">아이디</div>
              		<div class="info-subtitle">id</div>
            	</div>
            	<div class="table">
                	<div class="info-title">이름</div>
                	<div class="info-subtitle">name</div>
            	</div>
           		<div class="table">
               		<div class="info-title">주민번호</div>
               		<div class="info-subtitle">joomin</div>
            	</div>
            	<div class="table">
               		<div class="info-title">성별</div>
               		<div class="info-subtitle">man / woman</div>
            	</div>
           
            </div>
        	
        	<p>아이디, 이름, 주민번호, 성별은 변경이 불가능합니다.</p>
        		
			<div class="block">
          	
            	<div class="table">
              		<div class="info-title">비밀번호</div>
              		<div class="info-subtitle">password</div>
            	</div>
            	<div class="table">
                	<div class="info-title">이메일</div>
                	<div class="info-subtitle">email</div>
            	</div>
           		<div class="table">
               		<div class="info-title">휴대폰</div>
               		<div class="info-subtitle">phone</div>
            	</div>
            	           
            </div>
            
            
            <div class="block">
          	
            	<div class="table">
              		<div class="info-title">주소</div>
              		<div class="info-subtitle">address</div>
            	</div>
            	<div class="table">
                	<div class="info-title">가입일자</div>
                	<div class="info-subtitle">date</div>
            	</div>
      
            </div>
        
            
             
            


 			
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	
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
				
				buttonCheck = 1;
			});
			
			
			// 회원삭제버튼 클릭시 처리 이벤트
			$("#client_infoDeleteBtn").click(function() {
				
				buttonCheck = 2;
			}); 
		});
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
          <li><a href="/mypage/client/mypageReviewList">내가 쓴 리뷰들</a>
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
      <div class="scrollable">
        <table>
          <tbody>
            <tr>
              <th class="one_quarter">회원아이디</th>
              <td class="one_quarter">${client_info.client_id}</td>
            </tr>
          
          
            <tr>
              <th class="one_quarter">회원비밀번호</th>
              <td class="one_half">${client_info.client_pw }</td>
            </tr>
            <tr>
              <th class="one_quarter">회원이름</th>
              <td class="one_half">${client_info.client_name }</td>
            </tr>
            <tr>
              <th class="one_quarter">회원이메일</th>
              <td class="one_half">${client_info.client_email }</td>
            </tr>
            <tr>
              <th class="one_quarter">회원핸드폰번호</th>
              <td class="one_half">${client_info.client_phone}</td>
            </tr>
            <tr>
              <th class="one_quarter">회원 주소</th>
              <td class="one_half">${client_info.client_address}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="btn">
      <input type="button" value="회원정보 수정" id="client_infoUpdateBtn" class="btn1">
      <input type="button" value="회원정보 삭제" id="client_infoDeleteBtn" class="btn1">
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
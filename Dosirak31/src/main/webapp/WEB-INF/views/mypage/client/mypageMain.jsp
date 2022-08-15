<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	
	<style type="text/css">
	 section#content ul li { display:inline-block; margin:first0px; }
	 section#content div.goodsThumb img { width:200px; height:200px; }
	 section#content div.goodsName { padding:first0px 0; text-align:center; }
	 section#content div.goodsName a { color:#000; }
	 section#content ul.client_info{margin:0px 0px;}
<<<<<<< HEAD
	 section#content ul li { border:5px solid #eee; padding:10px 20px; margin:40px 0px 0px 0px; width:500px; height:auto;}
	 section#content .client_info span { font-size:15px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
=======
	 section#content ul li { border:5px solid #eee; padding:first0px 20px; margin:40px 0px 0px 0px; width:500px; height:250px;}
	 section#content .client_info span { font-size:first5px; font-weight:bold; display:inline-block; width:first00px; margin-right:first0px; }
>>>>>>> branch 'feature/ssm4/ssm444444' of https://github.com/columbooster/dosirak_31.git
	 
			
		

			.btn{
				float: right;
			}
			
			
	</style>
	<style type="text/css">
		table {
			all: unset;
		}
		
		
		.apple {
			
			width: 100px;
			text-align: center;
			vertical-align: middle;
			
		}
		
		.second {
			
			width:450px;
			text-align: left;
			height:auto;
			vertical-align: middle;
		}
		
		#top {
			border-top: 1px solid #999999;
		}
		
		#bottom {
			border-bottom: 1px solid #999999;
		}
		
		p {
			font-size: 7px;
			font-color: #FFFAFA;
		}
		
		
		
	</style>
	
	
	<script type="text/javascript">
		$(function() {
			
			// 회원수정,삭제 버튼 클릭시 처리 이벤트
			$("#client_infoUpdateBtn").click(function() {
				
				location.href = "/mypage/client/cUpdateForm";
			});
		
		});
		
		function orderList(client_no){
<<<<<<< HEAD
			location.href="/mypage/client/mypageOrderList?client_no="+client_no;
		}
=======
	         location.href="/mypage/client/mypageOrderList?client_no="+client_no;
	      }

>>>>>>> branch 'feature/ssm4/ssm444444' of https://github.com/columbooster/dosirak_31.git
	</script>
	
	
</head>
<body id="top">
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2 bgded" style="background-image:url('/resources/images/common/mypage2.jpeg');
 	height: 350px;">
  
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
          <li><a href="/mypage/client/mypageMain">회원정보</a></li>
          <li><a href="javascript:orderList(${sessionScope.client_info.client_no })">주문 내역</a>
          <li><a href="/mypage/client/mypageReviewList">나의 리뷰</a>
            <ul>
              
              
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
			
				<table>
					<tr>  
						<td class="apple" id="top">아이디</td>
						<td class="second" id="top">${client_info.client_id }</td>
					</tr>
					<tr>  
						<td class="apple" style="width: 100px;">이름</td>
						<td class="second">${client_info.client_name }</td>
					</tr>
					<tr>  
						<td class="apple" id="bottom">주민번호</td>
						<td class="second" id="bottom">${client_info.client_rrn }</td>
					</tr>
					
				</table>
					<p><em>  ※ 아이디, 이름, 주민번호는 변경이 불가합니다.</em></p>
				<table>
					<tr>  
						<td class="apple" id="top">비밀번호</td>
						<td class="second" id="top"><a href="/mypage/client/cUpdateForm">변경</a></td>
					</tr>
					<tr>  
						<td class="apple">이메일</td>
						<td class="second">${client_info.client_email }</td>
					</tr>
					<tr>  
						<td class="apple">휴대폰</td>
						<td class="second">${client_info.client_phone }</td>
					</tr>
					<tr>  
						<td class="apple">주소</td>
						<td class="second">${client_info.client_address }</td>
					</tr>
					<tr>  
						<td class="apple" id="bottom">가입일자</td>
						<td class="second" id="bottom">${client_info.client_date }</td>
					</tr>
					
					
					
				
				
				</table>
					
		</section>
		<div class="btn" style="margin-right: 15%;">
      <input type="button" value="회원정보 수정 및 탈퇴" id="client_infoUpdateBtn" class="dosirakBtn">
      </div>		
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
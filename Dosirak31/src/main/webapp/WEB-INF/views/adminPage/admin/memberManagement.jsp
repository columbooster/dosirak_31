<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 	
 	
	<style type="text/css">
	 section#content ul li { display:inline-block; margin:10px; }
	 section#content div.goodsThumb img { width:200px; height:200px; }
	 section#content div.goodsName { padding:10px 0; text-align:center; }
	 section#content div.goodsName a { color:#000; }
	section#content ul.memberList{margin:0px 0px;}
	 section#content ul li { border:5px solid #eee; padding:10px 20px; margin:40px 0px 0px 0px; width:500px; height:250px;}
	 section#content .memberList span { font-size:15px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
	 
	</style>
	
	<script type="text/javascript">

		$(function(){
		
	
			//페이지버튼	 
			$(".paginate_button a").click(function(e){
				e.preventDefault();
				$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
				goPage();
			});
			
			
		});//최상위함수
		
		//검색을 위한 실질적인 처리 함수
		function goPage(){
			
			$("#f_search").attr({
				"method":"get",
				"action":"/adminPage/admin/memberManagement"
			})
			$("#f_search").submit();
		}
		
	
		
		
	
	</script>

</head>
	<body>
	<div class="wrapper row3">
	
   <h3>회원 목록</h3>
   <%--=======검색기능 시작 =========--%>
			<div id="boardSearch">
				<form id="f_search" name="f_search" class="form-inline">
				<%--페이징 처리를 위한 파라미터 --%>
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }" id="pageNum">
				<input type="hidden" name="amount" value="${pageMaker.cvo.amount }"> <!-- ${pageMaker.cvo.amount } -->
				</form>
			</div>
			 <%--=======회원 목록 시작============--%>
       
	
       <div id="comments">
   	
			<c:forEach items="${memberList}" var="member">
					
			  
			      <section id="content">
 
					 <ul class="memberList">
					 
					  <li>		
					  <div>
					   <p><span>회원번호</span><a href="javascript:popup(${order.order_no })" class="popUpBtn">${member.client_no }</a></p>
					   <p><span>이름</span>${member.client_name }</p>
					   <p><span>아이디</span>${member.client_id}</p>
					   <p><span>이메일</span>${member.client_email}</p>
					   <p><span>주소</span>${member.client_address}</p>
					   <p><span>전화번호</span>${member.client_phone}</p>
					   <p><span>가입일</span>${member.client_date}</p>
					  <c:if test="${not empty member.client_update}">
					  	 <p><span>정보 변경일</span>${member.client_update }</p>
					   </c:if>		   
					  </div>				  
					  </li>
					 </ul>				
					</section>		      
			  
			</c:forEach>

     		 </div>
     		  <%--=======회원 목록 끝============ --%>
     
    		<%--===================페이징 출력 시작============== --%>
    		<tag:pagination pageNum="${pageMaker.cvo.pageNum }" amount="${pageMaker.cvo.amount }"
			startPage="${pageMaker.startPage }" endPage="${pageMaker.endPage }" prev="${pageMaker.prev }" next="${pageMaker.next }"/>
			
			<%--===================페이징 출력 끝============== --%>
     
  <!-- ################################################################################################ --> 
    <!-- / main body -->
    <div class="clear"></div>
  
</div>

	
	</body>
</html>
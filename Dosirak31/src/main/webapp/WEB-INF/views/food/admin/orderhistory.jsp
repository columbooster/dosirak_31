<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
	<style type="text/css">
	 section#content ul li { display:inline-block; margin:10px; }
	 section#content div.goodsThumb img { width:200px; height:200px; }
	 section#content div.goodsName { padding:10px 0; text-align:center; }
	 section#content div.goodsName a { color:#000; }
	section#content ul.orderList{margin:0px 0px;}
	 section#content ul li { border:5px solid #eee; padding:10px 20px; margin:40px 0px 0px 0px; width:550px; height:210px;}
	 section#content .orderList span { font-size:15px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
	</style>
	<script type="text/javascript">

	
		$(function(){
			
			 /*
			//검색 후 검색 대상과 검색 단어 출력
			let word="<c:out value='${data.search}'/>";
			let value="";
			if(search!=""){
				$("#search").val("<c:out value='${data.search}'/>");
				
			}
			 		
			
			 //검색대상이 변경될 때마다 처리 이벤트
			 $("#search").change(function(){
				 if($("#search").val()=="all"){
					 $("#keyword").val("전체 데이터를 최신순으로 조회합니다.");
				 }else if($("#search").val()!="all"){
					 $("#keyword").val("");
					 $("#keyword").focus();
				 }
			 });
			 
			*/
	
				 
			$(".paginate_button a").click(function(e){
				e.preventDefault();
				$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
				goPage();
			})
		});//최상위함수
		
		//검색을 위한 실질적인 처리 함수
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			$("#f_search").attr({
				"method":"get",
				"action":"/food/admin/orderhistory"
			})
			$("#f_search").submit();
		}
		
		
		
	
	
	
	</script>

</head>
	<body>
	<div class="wrapper row3">
	
   <h3>최신순으로 조회</h3>
   <%--=======검색기능 시작 =========--%>
			<div id="boardSearch">
				<form id="f_search" name="f_search" class="form-inline">
				<%--페이징 처리를 위한 파라미터 --%>
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
					<div class="form-group">
						<select id="search" name="search" class="form-control">
							<option value="all">주문전체내역</option>
							<option value="4">주문취소내역</option>
							<option value="5">배송완료내역</option>
						</select>
					</div>
				</form>
			</div>
			
      <%--=======주문내역테이블 시작============ --%>
     
	
       <div id="comments">
   		<c:set var="previousCol1" value=""/>   
			<c:forEach items="${orderhistory}" var="order">
					
			    <c:if test="${order.order_no ne previousCol1}">
			      <section id="content">
 
					 <ul class="orderList">
					 
					  <li>
					  <div>
					   <p><span>주문번호</span><a href="/food/admin/orderDetail">${order.order_no }</a></p>
					   <p><span>주문상태</span><c:if test="${order.order_status_no eq 3}">주문 완료</c:if>
					   <p><span>결제상태</span><c:if test="${order.payment_delete eq 0}">결제 완료</c:if>
					   	<c:if test="${order.payment_delete eq 1}">결제 취소</c:if>
					   	${order.payment_method }
					   </p>
					   <c:if test="${order.order_status_no eq 4}">주문 취소</c:if>
					   <c:if test="${order.order_status_no eq 5}">배송 완료</c:if>
					   </p>
					   <p><span>주문자 정보</span>${order.order_client_name}/${order.client_phone}</p>
					   <p><span>수령인 정보</span>${order.client_name}/${order.order_client_phone}</p>
					   <p><span>주소</span>${order.order_address }</p>
					   
					  </div>
					  </li>
					  
					 </ul>
					
					</section>
			      
			      
			      
			    </c:if>
				
			    <c:set var="previousCol1" value="${order.order_no }"/>
			</c:forEach>
     		<%--=======주문내역테이블 끝============ --%>
     		 </div>
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
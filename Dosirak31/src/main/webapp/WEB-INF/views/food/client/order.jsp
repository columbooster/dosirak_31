<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
	<style type="text/css">
		#delivery{width:700px;}
		#orderbox{width:700px;}
		#comments #same{float:left; width:30px;}
		/*총가격 테이블 설정*/
		.total{width:500px; text-align:center;}
		
	</style>
	<!-- 주소검색 관련 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<!-- iamport.payment.js 결제관련 js-->
	
	<script type="text/javascript"
   	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	
	<script type="text/javascript">
	 $(function(){
			 /*주소 검색*/
			  $("#postcodify_search_button").postcodifyPopUp(); 
	 		/*배송지 정보에 주문자정보와 같게 했을때*/
			 $("#same").click(function(){
			        if($(this).is(":checked")){
			           $("#order_client_name").val($("#cn").html());
			           $("#order_client_phone").val($("#cp").html());
			           $("#order_address").val($("#ca").html());
			        }else{
			           $("#order_client_name").val("");
			           $("#order_client_phone").val("");
			           $("#order_address").val("");
			        }
			    });
	 		/*가격 총합 구하기*/
	 			let totalPrice=$("#tp").html();
				$("#totalPrice").html(totalPrice);
				let totalPrice2=0
				$(".tp2").each(function(){
					totalPrice2+=parseInt($(this).html());
				});
	    		$("#totalPrice2").html(totalPrice2); 
	    		  
	    	
	    		
	    		
	    	/*결제하기*/
    		  
		      $("#iampayment").click(function() {
		    	  $("#iampayment").unbind('click');//한번만 클릭하도록
		    	  if(!chkData("#order_client_name","배달받을 고객의 이름을")) return;
	  				else if(!chkData("#order_client_phone","배달받을 고객의 번호를")) return;
	  				else if(!chkData("#order_address","배달받을 주소를")) return; 
	  			
		    	  
			    	 let name=$("#cn").html();
			    	 let phone=$("#cp").html();
			    	 let email=$("#ce").html();
			    	 let address=$("#ca").html();
			    	 
			    	 let order_name="";
			    	 let price=0;
		    		 let order_no=0; 
		    	  
		    	if($("#isForm").val()!=null){
		    		//원래 있던것 delete하고 실행
		    	  $.ajax({
			            url:"/order/orderInsert",
			            type: "get",
			            data: $('#orderInsert').serialize(),
			            dataType:"text",//객체 타입이니까/////고민해보기
			            async : false,//여러번 호출되지않도록 response받을때까지
			            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			            error:function(xhr,textStatus,errorThrown){//실행시 오류가 발생하였을 경우
		    				  alert("주문 insert에 실패하였습니다.");
			            }, 
			            success: function(data){//객체 타입이니까/////고민해보기
			            	
			            		let please=JSON.parse(data);
			            		order_no=please.order_no;
			            		dosirak_no=please.dosirak_no;
			            		$("#on").val(order_no);
			            		$("#order_no1").val(order_no);
			               		$("#don").val(dosirak_no);
			            		console.log(order_no);

				    		 //order_name=$("#dn").html();
				    		 order_name="Dosirak31 도시락";
				    		 price=parseInt($("#totalPrice").html());
				    		 
				    		
				    		 console.log(name,phone,email,address,order_name,price,order_no);
				    		 payment(name,phone,email,address,order_name,price,order_no); //버튼클릭하면 호출.
			            }
		    	  	 
			     	});
		    	  	
		    	 } else{
		    		 order_name="Dosirak31 도시락";
		    		 //order_name=$("#comments>ul:nth-child(2)>.order2name").html();
		    		 price=parseInt($("#totalPrice2").html());
		    		 order_no=$("#comments ul:eq(1)").find(".order2no:eq(0)").val();
		    		 $("#order_no1").val(order_no);
		    		 console.log(name,phone,email,address,order_name,price,order_no);
		    		payment(name,phone,email,address,order_name,price,order_no); //버튼클릭하면 호출.
		    	 }
	  			
		    	 
		      });//결제버튼 눌렀을 때
   			  
		      function payment(name,phone,email,address,order_name,price,order_no) {
			    	 
			      IMP.init("imp21367780");
			      // IMP.request_pay(param, callback) 결제창 호출
			      IMP.request_pay({ // param
			         pg : "kakaopay.TC0ONETIME", // 결제
			         pay_method: "card",
			         merchant_uid :"f"+order_no, // 주문 번호
			         name : order_name, //상품명
			         amount : price, //가격
			         buyer_email : email, //이메일
			         buyer_name : name, //이름
			         buyer_tel : phone, //연락처
			         buyer_addr: address, //주소o
			         m_redirect_url:"/food/foodClientBasicList"
			      }, function(rsp) { // callback
			         if (rsp.success) {
			            console.log(rsp);
	            
			            let client_no=parseInt($("#client_no").val());
			           
			          	  let jdata={
				            	"order_no":order_no,
				            	"client_no":client_no
				            	
				           }
			            $.ajax({
			            	
				            url:"/order/paymentInsert",
				            type: "post",
				            contentType: 'application/json',
				            data: JSON.stringify(jdata),
				            dataType:"text",
				            
				            error:function(xhr,textStatus,errorThrown){//실행시 오류가 발생하였을 경우
			    				 
				            	alert("결제 테이블 생성에 실패하였습니다.");
				            }, 
				            success: function(data){
				   
				            }
			    	  	 
				     	});	
			            
			            /*결제 성공하는경우,  주문 후인 3번, 회원 이름, 번호, 주소 update바꾸기 후 마이페이지로 이동*/
			           
			            $("#orderAfterBtn").submit();
			    	  		
			            
			         } else {
			        	 /*주문 취소하는 경우, 2번으로 담았던 바로구매 삭제하기*/
			            console.log(rsp);
			            let order_no=$("#on").val();
			            let dosirak_no=$("#don").val();
			            let jdata={
			            	"order_no":order_no,
			            	"dosirak_no":dosirak_no
			            }
			            $.ajax({
				            url:"/order/delete",
				            type: "post",
				            contentType: 'application/json',
				            data: JSON.stringify(jdata),
				            dataType:"text",
				            
				            error:function(xhr,textStatus,errorThrown){//실행시 오류가 발생하였을 경우
			    				 
				            	alert("주문 삭제에 실패하였습니다.");
				            }, 
				            success: function(data){
				   
				            }
			    	  	 
				     	});
			            
			         }
			      });
		   }

	    		
	    		  
		});//최상위
	 
	 
		
		
		
		     
		
		

			
	
	</script>

</head>

<div class="wrapper row3">
<input type="hidden" id="client_no" value="${sessionScope.client_info.client_no}"/>	
<!-- 주문 상태 2번 insert -->
<c:choose>
     <c:when test="${not empty order1 }">
     	<form id="orderInsert">
     		<input type="hidden" name="client_no" id="client_no" value="${sessionScope.client_info.client_no }"/>
			<input type="hidden" name="dosirak_name" value="${order1.dosirak_name} "/>
			<input type="hidden" name="food_img1" id="isForm"value="${order1.food_img1}" />
			<input type="hidden" name="food_img2" value="${order1.food_img2}"  />
			<input type="hidden" name="food_img3" value="${order1.food_img3}" />
			<input type="hidden" name="food_img4" value="${order1.food_img4}" />
			<input type="hidden" name="food_img5" value="${order1.food_img5}"  />
			<input type="hidden" name="order_quantity" value="${order1.order_quantity}" />
			<input type="hidden" name="order_price" value="${order1.order_price}" />
     	</form>
     </c:when>
 </c:choose>

  <main class="container clear"> 
  
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="content"> 
      
				<div id="comments">
		        <h2>주문서 작성</h2>
		        <!-- ========주문자 정보 ======================-->
					<ul>
			          <li>
			            <article>
			              <header>
			                <address>
			               	<label><h3>주문자 정보</h3></label>
			                </address>
			              </header>
			              <div class="comcont">
			             
			            	<table id="orderbox">
			            		<tr>
			            			<td>이름</td>
									<td id="cn">${client_info.client_name }</td>
			            		</tr>
			            		<tr>
			            			<td>연락처</td>
									<td id="cp">${client_info.client_phone }</td>
			            		</tr>
			            		<tr>
			            			<td>이메일</td>
			            			
									<td id="ce">${client_info.client_email }</td>
			            		</tr>
			            		<tr>
			            			<td>주소</td>
			            			
									<td id="ca">${client_info.client_address }</td>
			            		</tr>
			            	</table>
						
			              </div>
			            </article>
			          </li>
			           <!-- ========주문자 정보 끝======================-->
			           <!-- ========배송지 정보 ======================-->
			          <li>
			            <article>
			              <header>			               
			                <address>
			               	<label><h3>배송지 정보</h3></label>
			               	<input type="checkbox" id="same"/>주문자 정보와 같음
			                </address>
			              </header>
			             
				              <div class="comcont">
				             
				            	<table id="delivery">
				            		 <form id="orderAfterBtn" action="/food/orderConfirmation" method="get">
				        		
					            		<tr>
					            			<td>이름</td>
											<td><input type="text" id="order_client_name" name="order_client_name"/></td>
					            		</tr>
					            		<tr>
					            			<td>연락처</td>
											<td><input type="text" id="order_client_phone" name="order_client_phone"/></td>
												<input type="hidden" name="order_no" id="order_no1" />
					            		</tr>
				            		 
				            		<tr>
				            			<td>주소</td>
				            			<td>
										<input type="text" id="order_address" name="order_address" class="postcodify_address" value="" /><br />
										</form>
										<button id="postcodify_search_button" class="btn btn-default">주소 검색</button><br />
				            		</tr>
				            		
					            
					            			

				            	</table>
							
				              </div>
			             
			            </article>
		          </li>
		          <!-- ========배송지 정보 끝======================-->
		       	 <!-- ========고른 식품 정보======================-->
		       	 	   
	         </ul>
	         <ul>
	         	<c:choose>
	         	
					<c:when test="${not empty order1 }">
					<input type="hidden" id="on"/>
					<input type="hidden" id="don"/>
								<li>
					            <article>
					              <header>
					                <address>
					               	<label><h3>최종 선택 상품</h3></label>
					                </address>
					              </header>
					              <div class="comcont">
					             
					            	<table class="orderList">
					            		<tr>
					            			<td>상품 이름</td>
											<td id="dn">${order1.dosirak_name}</td>
					            		</tr>
					            		<tr>
					            			<td>상품수량</td>
											<td id="oq">${order1.order_quantity}</td>
					            		</tr>
					            		<tr>
					            			<td>상품금액</td>
					            			
											<td id="tp">${order1.order_price}</td>
					            		</tr>
					            	</table>
								
					              </div>
					            </article>
					          </li>
					          <li>
					          	<table class="total" class="text-center">
									<tr class="warning">
										<td class="warning">총 주문금액</td>
									</tr>
									<tr class="danger">
										<td class="danger" id="totalPrice"></td>
									</tr>
								</table>
					          </li>
							</c:when>
					
							<c:when test="${not empty order2 }">	
								<c:forEach var="order" items="${order2.orderlist}">
								<input type="hidden" class="order2no" value="${order.order_no }"/>
									<li>
							            <article>
							              <header>
							                <address>
							               	<label><h3>최종 선택 상품</h3></label>
							                </address>
							              </header>
							              <div class="comcont">
							             
							            	<table class="orderList">
							            		<tr>
							            			<td>상품 이름</td>
													<td class="order2name">${order.dosirak_name}</td>
							            		</tr>
							            		<tr>
							            			<td>상품수량</td>
													<td>${order.order_quantity}</td>
							            		</tr>
							            		<tr>
							            			<td>상품금액</td>
													<td class="tp2">${order.order_price}</td>
							            		</tr>
							            	</table>
										
							              </div>
							            </article>
							          </li>
									</c:forEach>
										<li>
							          	<table class="total" class="text-center">
											<tr class="warning">
												<td class="warning">총 주문금액</td>
											</tr>
											<tr class="danger">
												<td class="danger" id="totalPrice2"></td>
											</tr>
										</table>
							          </li>
							</c:when>
							
						</c:choose>
	         			</ul>
	         	 <!-- ========고른 식품 정보 끝======================--> 
	         	 <div class="text-right">
	         		 <button id="iampayment" type="button" class="btn btn-default">결제하기</button>
	         	 </div>
	         
	         
	         
	         
	         
	         
	       </div>
			
			
			
			
			
			    


      </div>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
</body>
</html>

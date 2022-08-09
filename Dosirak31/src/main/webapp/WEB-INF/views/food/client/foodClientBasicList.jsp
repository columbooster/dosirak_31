<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
	<style type="text/css">
	/*tab 만드는 css*/
	ul.tabs{
		margin: 0px;
		padding: 0px;
		list-style: none;
	}
	ul.tabs li{
		background: none;
		color: #222;
		display: inline-block;
		padding: 10px 15px;
		cursor: pointer;
		font-weight:bold;
	}
	
	ul.tabs li.current{
		background: lightgray;
		color: #222;
		font-weight:bold;
	}
	
	/*탭 안 내용*/
	.tab-content{
		display: none;
		background:lightgray;
		padding: 50px;
		text-align:center;
		height:auto;
		overflow:auto;
	}
	
	.tab-content.current{
		display: inherit;
		padding: 50px;
		text-align:center;
	}
	/*탭 안 음식관련 ul 가로 정렬 */
	.clear{clear:none;}
	.clear, ul.nospace.clear.fd::after, .group {clear:none;}/*여긴보류*/
	#comments ul{margin:0px;}
	/*이미지 정렬 및 탭안 li 가로정렬*/
	.img-thumbnail{width:100px; height:100px;}
	.li_control{width:200px; height:250px; border:1px solid black;}
	.one_half, .one_third, .two_third, .one_quarter, .two_quarter, .three_quarter{float:left;}
	#foodMenu{display:none;}
	/*폰트색*/
	#tab-1{color:black;}
	#total_price{color:orage; font-weight:bold;}
	
	
	/*테이블 설정*/
	#addFood{display:none;}
	#nutritionResult{border:1px solid gray;}
	/*수량크기 조절*/
		#comments input[type='number']{display:inline; width:10%; height:50%;}
	
	
	</style>
	<script type="text/javascript">
	<!--===================도시락 메뉴 탭 기능 =========================== -->
		$(document).ready(function(){
			$("#popup1").hide();
			$(".tabs li").click(function(){
				let tab_id = $(this).attr("data-tab");
	
				$(".tabs li").removeClass("current");
				$(".tab-content").removeClass("current");
	
				$(this).addClass("current");
				$("#"+tab_id).addClass("current");
			});
		});
		<!--===================도시락 메뉴 탭 기능 끝=========================== -->
		<!--===================기초대사량 계산 시작 =========================== -->
		$(function(){
			
			//장바구니화면
			let bag="${bag}";
			console.log(bag);
			if(bag!=""){
				 if (confirm('장바구니에 담겼습니다. 이동하시겠습니까?')) {
					location="/food/bagList";
					
	              } 
			}

	       
			$("#submitBtn").click(function(){
				if(!chkData("#height","키를")) return;
				else if(!chkData("#weight","몸무게를")) return;
				else if(!chkData("#age","나이를")) return;
				else if($("input[name='gender']:radio:checked").length<1){
					alert("성별을 선택하세요");
					return;
				}else{
					let gender=$("input[name='gender']").val();
					let height=parseInt($("#height").val());
					let weight=parseInt($("#weight").val());
					let age=parseInt($("#age").val());
					let bmr;
					
					if(gender=='man'){
						bmr=66+(13.8*weight)+(5*height)-(6.8*age);
					}else if(gender=="woman"){
						bmr=655+(9.6*weight)+(1.8*height)-(4.7*age);
					}
					
					$("#comment").html("당신의 기초대사량은 "+bmr+"kcal입니다.");
				}
			})
			/*숫자만 입력되도록하는 함수*/
			$('input[onlyNumber]').on('keyup',function(){
				$(this).val($(this).val().replace(/[^0-9]/g,""));
			});
			<!--===================기초대사량 계산 끝=========================== -->
			<!--=========메뉴카테고리 탭 		선택시 그에 맞는 메뉴 출력====================-->
			for(let i=1; i<=5; i++){
				$("#menu"+i).click(function(){
					$(".fd").detach();
					let food_category=$(this).attr("data-value");
					let url="/food/all/"+food_category;
					/*ajax불러오기*/
					$.getJSON(url,function(data){
						$(data).each(function(){
							let food_no=this.food_no;
							let food_name=this.food_name;
							let food_img=this.food_img;
							let food_price=this.food_price;
							let food_kcal=this.food_kcal;
							let food_volume=this.food_volume;
							/*ajax불러온것 화면 구성*/
							let $div=$("#tab-"+(i+1));
							let $ul =$("#foodMenu").clone().removeAttr("id");
							$ul.find(".addBtn").attr("data-num",food_no);
							$ul.addClass("fd");
							$ul.find(".img-thumbnail").attr("src","/dosirak31img/food/"+food_img);
							$ul.find(".menuList").html(food_name+food_volume+"g<br/>"+food_kcal+"kcal<br/>"+food_price+"원");
							$div.append($ul);
							
						})
					}).fail(function(){
						alert("음식목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해주세요.");
					})
				})
				
				
			}
			<!--=========메뉴카테고리 탭 선택시 그에 맞는 메뉴 출력 끝====================-->
			<!--=========음식 클릭했을 때 영양정보 출력 시작====================-->
				let i=1;
				<!--음식을 클릭했을 때 그의 따른 영양정보와 가격을 추가하려고함 ajax로 구현함-->
				$(document).on("click",".addBtn",function(){
					
					if(i>5){
						alert("5개까지만 추가가능합니다.");
						return;
					}
					let food_no=$(this).attr("data-num");
					console.log(food_no);
					let url="/food/all2/"+food_no;
					/*ajax불러오기*/
					$.getJSON(url,function(data){
						$(data).each(function(){
							let food_no=this.food_no;
							let food_category=this.food_category;
							let food_name=this.food_name;
							let food_volume=this.food_volume;
							let food_price=this.food_price;
							let food_calb=this.food_calb;
							let food_protein=this.food_protein;
							let food_fat=this.food_fat;
							let food_kcal=this.food_kcal;
							
							/*ajax불러온것 화면 구성*/
								
							let $tbody=$("#addMenu");
							let $tr=$("#addFood").clone().removeAttr("id");
							$tr.addClass(".plus")
							$tr.attr("data-num",food_no);
							$tr.find(".category").html(food_category);
							$tr.find(".name").html(food_name);
							$tr.find(".g").html(food_volume);
							$tr.find(".kcal").html(food_kcal);
							$tr.find(".tan").html(food_calb);
							$tr.find(".dan").html(food_protein);
							$tr.find(".ji").html(food_fat);
							$tr.find(".price").html(food_price);
							$tr.find(".delete").html("<input type='button' value='삭제' class='foodDelete'/>");
							i++;
							$tbody.append($tr);
						
							/*테이블 안 계산*/
							let gplus=isNaN(parseInt($(".gplus").html()))?0:parseInt($(".gplus").html());
							let kcalplus=isNaN(parseFloat($(".kcalplus").html()))?0:parseFloat($(".kcalplus").html());
							let tanplus=isNaN(parseFloat($(".tanplus").html()))?0:parseFloat($(".tanplus").html());
							let danplus=isNaN(parseFloat($(".danplus").html()))?0:parseFloat($(".danplus").html());
							let jiplus=isNaN(parseFloat($(".jiplus").html()))?0:parseFloat($(".jiplus").html());
							let priceplus=isNaN(parseInt($(".priceplus").html()))?0:parseInt($(".priceplus").html());
							
							
							
							$(".gplus").html(gplus+food_volume+"g");
							$(".kcalplus").html((kcalplus+food_kcal).toFixed(1)+"kcal");
							$(".tanplus").html((tanplus+food_calb).toFixed(1)+"g");
							$(".danplus").html((danplus+food_protein).toFixed(1)+"g");
							$(".jiplus").html((jiplus+food_fat).toFixed(1)+"g");
							$(".priceplus").html(priceplus+food_price+"원");
							
						})
					}).fail(function(){
						alert("음식목록을 추가하는데 실패하였습니다. 잠시후에 다시 시도해주세요.");
					})
				})
				/*삭제버튼 눌렀을 때
				음식에서 삭제 버튼 누르면 사라지도록 함
				계산에서도 빠져야함*/
				
				$(document).on("click",".foodDelete",function(){
					let gplus=isNaN(parseInt($(".gplus").html()))?0:parseInt($(".gplus").html());
					let kcalplus=isNaN(parseFloat($(".kcalplus").html()))?0:parseFloat($(".kcalplus").html());
					let tanplus=isNaN(parseFloat($(".tanplus").html()))?0:parseFloat($(".tanplus").html());
					let danplus=isNaN(parseFloat($(".danplus").html()))?0:parseFloat($(".danplus").html());
					let jiplus=isNaN(parseFloat($(".jiplus").html()))?0:parseFloat($(".jiplus").html());
					let priceplus=isNaN(parseInt($(".priceplus").html()))?0:parseInt($(".priceplus").html());
					

					let gminus=parseInt($(this).parents("tr").children(".g").html());
					let kcalminus=parseFloat($(this).parents("tr").children(".kcal").html());
					let tanminus=parseFloat($(this).parents("tr").children(".tan").html());
					let danminus=parseFloat($(this).parents("tr").children(".dan").html());
					let jiminus=parseFloat($(this).parents("tr").children(".ji").html());
					let priceminus=parseFloat($(this).parents("tr").children(".price").html());
					
					$(".gplus").html(gplus-gminus+"g");
					$(".kcalplus").html((kcalplus-kcalminus).toFixed(1)+"kcal");
					$(".tanplus").html((tanplus-tanminus).toFixed(1)+"g");
					$(".danplus").html((danplus-danminus).toFixed(1)+"g");
					$(".jiplus").html((jiplus-jiminus).toFixed(1)+"g");
					$(".priceplus").html(priceplus-priceminus+"원");
					
					$(this).parents("tr").remove();
					i--;
					
					if($("#tabl>tbody>tr").length<6){
						$("#totalprice").html("");
						return;
					}
					
				});
				
				/*장바구니 버튼을 눌렀을 때 */
				$(document).on("click","#bagBtn",function(){
					
					if($("#client_no").val()==""){
						alert("로그인해주셔야합니다.");
						//로그인화면으로 이동 location.href="로그인가기위한url"
					}else{
						if($("#tabl>tbody>tr").length<6){
							alert("도시락은 5가지의 메뉴를 골라주셔야 완성됩니다.");
							return;
						}
						let food_name1=$('#addMenu>tr:nth-child(2)>.name').html();
						let food_name2=$('#addMenu>tr:nth-child(3)>.name').html();
						let food_name3=$('#addMenu>tr:nth-child(4)>.name').html();
						let food_name4=$('#addMenu>tr:nth-child(5)>.name').html();
						let food_name5=$('#addMenu>tr:nth-child(6)>.name').html();
						let order_quantity=parseInt($("#amount").val());
						let price=parseInt($(".priceplus").html());
						let order_price=order_quantity*price;
						$("#dosirak_name").val(food_name1+"/"+food_name2+"/"+food_name3+"/"+food_name4+"/"+food_name5);
						
						$("#food_name1").val(food_name1);
						$("#food_name2").val(food_name2);
						$("#food_name3").val(food_name3);
						$("#food_name4").val(food_name4);
						$("#food_name5").val(food_name5);
						
						$("#order_quantity").val(order_quantity);
						$("#order_price").val(order_price);
						
						$("#bagForm").attr({
							"method":"post",
							"action":"/food/bagInsert"
						})
						$("#bagForm").submit();
						
						
					}
					
				})
							
				/*주문버튼 눌렀을때*/
				$("#orderBtn").click(function(){
					if($("#client_no").val()==""){
						alert("로그인해주셔야합니다.");
						//로그인화면으로 이동 location.href="로그인가기위한url"
					}else{
						if($("#tabl>tbody>tr").length<6){
							alert("도시락은 5가지의 메뉴를 골라주셔야 완성됩니다.");
							return;
						}
					
						let food_name1=$('#addMenu>tr:nth-child(2)>.name').html();
						let food_name2=$('#addMenu>tr:nth-child(3)>.name').html();
						let food_name3=$('#addMenu>tr:nth-child(4)>.name').html();
						let food_name4=$('#addMenu>tr:nth-child(5)>.name').html();
						let food_name5=$('#addMenu>tr:nth-child(6)>.name').html();
						let order_quantity=parseInt($("#amount").val());
						let price=parseInt($(".priceplus").html());
						let order_price=order_quantity*price;
						$("#dosirak_name").val(food_name1+"/"+food_name2+"/"+food_name3+"/"+food_name4+"/"+food_name5);
						
						$("#food_name1").val(food_name1);
						$("#food_name2").val(food_name2);
						$("#food_name3").val(food_name3);
						$("#food_name4").val(food_name4);
						$("#food_name5").val(food_name5);
						
						$("#order_quantity").val(order_quantity);
						$("#order_price").val(order_price);
						
						$("#bagForm").attr({
							"method":"post",
							"action":"/food/orderList"
						})
						$("#bagForm").submit();
						
					
					
					}
					
					
				})
				
				/*총 가격 계산*/
				$("#priceBtn").click(function(){
					console.log()
					if($("#tabl>tbody>tr").length<6){
						alert("도시락은 5가지의 메뉴를 골라주셔야 완성됩니다.");
						return;
					}else{
						let price=parseInt($(".priceplus").html());
						let amount=parseInt($("#amount").val());
						$("#totalprice").html(amount+"개의 도시락 총 금액: "+price*amount+"원");
					}
				})
				
				
		});//최상위함수
		
		
		
	</script>

</head>
<div class="wrapper row2 bgded"
	style="background-image: url('/resources/images/demo/backgrounds/01.png');">
	<div class="overlay">
		<div id="breadcrumb" class="clear">
			
			<ul>
				<li><a href="/client/successlogin">Home</a></li>
				 <li><a class="drop" href="/food/foodClientBasicList">FOOD</a>
				<li><a href="/food/foodClientBasicList">MY LUNCHBOX</a></li>
			</ul>
			
		</div>
	</div>
</div>
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- 장바구니 insert해주기 위한 값들 -->
	<form id="bagForm" >
	<!-- session값 있는지 확인   나중에 sessionScope.client_info.client_no-->
	<input type="hidden" name="client_no" id="client_no" value="${sessionScope.client_info.client_no }"/>
	<input type="hidden" name="dosirak_name" id="dosirak_name" />
	<input type="hidden" name="food_name1" id="food_name1" />
	<input type="hidden" name="food_name2" id="food_name2" />
	<input type="hidden" name="food_name3" id="food_name3" />
	<input type="hidden" name="food_name4" id="food_name4" />
	<input type="hidden" name="food_name5" id="food_name5" />
	<input type="hidden" name="order_quantity" id="order_quantity"/>
	<input type="hidden" name="order_price" id="order_price"/>
	</form>
	<!-- 장바구니 insert해주기 위한 값들 끝-->
	
	<!--===================기초대사량 계산 시작=========================== -->
   <div id="comments">   
         <label for="comment">기초대사량 계산</label>
       		<div class="form-inline">
		  <div class="form-group">
		    <label class="sr-only" for="height">Enter Height</label>
		    <input type="text" class="form-control" id="height" name="height" placeholder="키를 입력해주세요" onlyNumber>
		  </div>
		  <div class="form-group">
		    <label class="sr-only" for="weight">Weight</label>
		    <input type="text" class="form-control" id="weight" name="weight" placeholder="몸무게를 입력해주세요" onlyNumber>
		  </div>
		  <div class="form-group">
		    <label class="sr-only" for="age">Age</label>
		    <input type="text" class="form-control" id="age" name="age" placeholder="나이를 입력해주세요" onlyNumber>
		  </div>
		<div class="form-group">
		      <input type="radio" name="gender" value="man"/>남자
		     </div>
		   <div class="form-group">
		    	 <input type="radio" name="gender" value="woman"/>여자
		  </div>
		   <div class="form-group">
		  <button type="submit" id="submitBtn" class="btn btn-default">계산</button>
		</div>

          <div class="block clear">
            <label for="comment">기초대사량 계산결과</label>
            <textarea name="comment" id="comment" cols="10" rows="2" readonly="readonly"></textarea>
          </div> 
      </div>
      
      	<!--===================기초대사량 계산 끝=========================== -->
      
      
   	<!--===================도시락 메뉴 리스트=========================== -->
     <article>
     	 <h3><label for="comment">도시락 메뉴 고르기</label></h3>
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1" >메뉴<br/></li>
				<li class="tab-link " data-tab="tab-2" data-value="밥류" id="menu1">밥<br/></li>
				<li class="tab-link" data-tab="tab-3" data-value="볶음류" id="menu2">볶음<br/></li>
				<li class="tab-link" data-tab="tab-4" data-value="무침류" id="menu3">무침<br/></li>
				<li class="tab-link " data-tab="tab-5" data-value="찜류" id="menu4">찜<br/></li>
				<li class="tab-link" data-tab="tab-6" data-value="김치류" id="menu5">김치<br/></li>
			</ul>
			<div id="tab-1" class="tab-content current">
				카테고리 상관없이 원하는 메뉴 5가지를 골라주세요.
			</div>
			<div id="tab-2" class="tab-content" >
					<ul id="foodMenu"class="nospace clear">
		          	  <li class="one_quarter text-center li_control">
		         		<!-- <img src="/dosirak31img/food/이미지이름"/> --> 
				  		<img alt="식품이미지" class="img-thumbnail">
			     			<div class="menuList"></div>
			     			<button type="button" class="addBtn btn btn-default">추가</button>
			     		</li>
			     	</ul>   			
			</div>
			<div id="tab-3" class="tab-content" ></div>
			<div id="tab-4" class="tab-content"></div>
			<div id="tab-5" class="tab-content "></div>
			<div id="tab-6" class="tab-content "></div>
				
			</article>
     	<!--===================도시락 메뉴 끝=========================== -->
     	<!--===================도시락 고르기 테이블 보여주는것 =========================== -->
      <div class="scrollable">
        <table id="tabl">
          <thead>
            <tr>
              <th class="text-center">카테고리</th>
              <th class="text-center">음식이름</th>
			  <th class="text-center">중량(g)</th>
              <th class="text-center">열량(kcal)</th>
              <th class="text-center">탄수화물(g)</th>
              <th class="text-center">단백질(g)</th>
              <th class="text-center">지방(g)</th>
              <th class="text-center">가격(원)</th>
              <th class="text-center">비고</th>
            </tr>
          </thead>
          <tbody id="addMenu">
            <tr id="addFood">
              <td class="category text-center"></td>
              <td class="name text-center"></td>
              <td class="g text-center"></td>
              <td class="kcal text-center"></td>
              <td class="tan text-center"></td>
              <td class="dan text-center"></td>
              <td class="ji text-center"></td>
              <td class="price text-center"></td>
              <td class="delete text-center"></td>
            </tr>
           
          </tbody>
          <tfoot>
          	<tr id="nutritionResult">
          		<td colspan="2" class="text-center">하나의 도시락 total</td>
          		<td class="gplus text-right"></td>
          		<td class="kcalplus text-right"></td>
          		<td class="tanplus text-right"></td>
          		<td class="danplus text-right"></td>
          		<td class="jiplus text-right"></td>
          		<td colspan="2" class="priceplus text-right "></td>    		
          	</tr>
          </tfoot>
        </table>
      </div>
 	<!--===================도시락 고르기 테이블 보여주는것 끝 =========================== -->
 	<!--===================총금액,장바구니,바로구매 버튼 =========================== -->
 		<div class="text-right">
 			도시락 수량<input type="number" value="1" id="amount" min="1"/>
 			<span id="totalprice"></span>
 			<button type="button" class="btn btn-default" id="priceBtn">총금액 확인하기</button>
 			<button type="button" class="btn btn-default text-right" id="bagBtn">장바구니</button>
 			<button type="button" class="btn btn-default text-right" id="orderBtn">바로 구매하기</button>
 		</div>
 	 <!--===================총금액,장바구니,바로구매 버튼 끝=========================== -->
    </div>
  <!-- ################################################################################################ --> 
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>


</body>
</html>
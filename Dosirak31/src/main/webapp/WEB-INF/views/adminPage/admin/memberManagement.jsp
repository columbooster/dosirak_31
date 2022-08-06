<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 	
 	
	<style type="text/css">
	 
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
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }" id="pageNum">
				<input type="hidden" name="amount" value="${pageMaker.cvo.amount }"> <!-- ${pageMaker.cvo.amount } -->
					<div class="form-group">
						<select id="search" name="order_status_no" class="form-control">
							<!--  <option value="2">전체내역</option>-->
							<option value="3">주문내역</option>
							<option value="4">주문취소내역</option>
							<option value="5">배송완료내역</option>
						</select>
					</div>
				</form>
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
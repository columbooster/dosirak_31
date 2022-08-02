<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>



		<script type="text/javascript">
		$(function(){
			 $(".goDetail").click(function() {
				 
		            let page_no = $(this).parents("tr").attr("data-num");
		            $("#page_no").val(page_no);
		            console.log("글번호 : " + page_no);
		          
		            
		            $("#detailForm").attr({
		               "method":"get",
		               "action":"/foodReview/foodReviewList"
		            });
		            $("#detailForm").submit();
		         });  
		});
		</script>
</head>
	<body>

<div class="wrapper row2 bgded" style="background-image:url('/resources/images/demo/backgrounds/01.png');">
  <div class="overlay">
    <div id="breadcrumb" class="clear"> 
      
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Lorem</a></li>
        <li><a href="#">Ipsum</a></li>
        <li><a href="#">Full Width</a></li>
      </ul>
      
    </div>
  </div>
</div>

		<form id="detailForm">
			<input type="hidden" id="page_no" name="page_no" />
		</form>

<div class="wrapper row3">
	 <main class="container clear"> 
    
    <div class="content"> 
    	

		<div id="comments">
	        <h2>Comments</h2>
	        <c:choose>
	        <c:when test="${not empty pageList }">
	        <c:forEach var="page" items="${pageList }" varStatus ="status"> 
			<table>
			 <tr class="text-center" data-num="${page.page_no}">
				<td>${page.page_no }</td>
				<td class="goDetail text-left">${page.page_title}
				</td>
			</tr>
			</table>
			</c:forEach>
			</c:when>
			</c:choose>
		</div>
		
    </div>
    <!-- / main body -->
    <div class="clear"></div>
  </main>

</div>
		
		
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
		
	</body>
</html>
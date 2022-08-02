<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<script type="text/javascript">
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








    <!-- main body @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

<div class="wrapper row3">
	 <main class="container clear"> 
    
    <div class="content"> 
      <form name="f_data" id="f_data" method="post">
      	<input type="hidden" name="page_no" value="${page.page_no }" />
      </form>
      
         
         <jsp:include page="reply.jsp" />
      
      
    </div>
    
    <!-- / main body -->
    <div class="clear"></div>
  </main>

</div>

<!-- 상단으로 올라가는 페이지@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>









		</div>
   </body>
</html>	
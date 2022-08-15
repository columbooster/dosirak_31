<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<!-- Bootstrap core CSS -->
<link href="/resources/include/dist/css/bootstrap.min.css"
   rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/include/dist/css/jumbotron-narrow.css"
   rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
   src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

	<style>
		a{color:#FF8D2C;}
	</style>
</head>
  <div class="wrapper row2 bgded"
		style="background-image: url('/resources/images/demo/backgrounds/01.png');">
		<div class="overlay">
			<div id="breadcrumb" class="clear">
				<ul>
					<li><a href="/client/successlogin">Home</a></li>
					<li><a href="/health/hBoardList">WORKOUT</a></li>
					<li><a href="/health/weightList?health_category_no=1">WEIGHT WORKOUT</a></li>
				</ul>
			</div>
		</div>
	</div>
   <div class="wrapper row3">
      <main class="container clear">
         <div class="content">
            <div id="gallery">
               <figure>
                  <header class="heading">${weightDetail.health_title }(조회수: ${weightDetail.health_hits })</header>
                  <!-------------------------------------------------- 동영상 & 소개 공간 ---------------------------------------------------->
                  <div class="jumbotron">
                     <section>
                     <table>
                        <tr>   
                           <td> <iframe width="560" height="315"
                              src="https://www.youtube.com/embed/${weightDetail.health_url }?mute=1&autoplay=1"></iframe>
                           </td>
                        </tr>               
                        <tr>
                           <td class="col-md-4">
                           ${weightDetail.health_contents }
                        
                           </td>
                        </tr>
                        </table>
                     </section>
                  </div>
                  
                  <div class="row marketing">
                     <div class="col-lg-6">
                        <jsp:include page="hcomment2.jsp" />
                     </div>
                  </div>
            
               </figure>
            </div>
         </div>
         <!-- / main body -->
         <div class="clear"></div>
      </main>

   </div>
   <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
   <!-- JAVASCRIPTS -->
   <script src="/resources/layout/scripts/jquery.min.js"></script>
   <script src="/resources/layout/scripts/jquery.backtotop.js"></script>
   <script src="/resources/layout/scripts/jquery.mobilemenu.js"></script>
   <script
      src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
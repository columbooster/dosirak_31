<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
	<style type="text/css">
		#cardioImg, #weightImg{width:280px; height:220px;}
	</style>
</head>

	<div class="wrapper row3">
		<main class="container clear">
			<!-- main body -->
			<!-- ################################################################################################ -->
			<div class="content">
				<!-- ################################################################################################ -->
				<div id="gallery">
					<figure>
						<header class="heading">Free Workout Vedios</header>
						<ul class="nospace clear">
							<li class="one_quarter first"><a href="/health/weightList?health_category_no=1"><img id="weightImg"
									src="/dosirak31img/health/health_weight_weightMain.JPG" alt="">웨이트 트레이닝</a></li>
							<li class="one_quarter"><a href="/health/cardioList?health_category_no=2"><img id="cardioImg"
									src="/dosirak31img/health/health_cardio_cardioMain.JPG" alt="">유산소 트레이닝</a></li>
						</ul>	
					</figure>
				</div>
				<!-- ################################################################################################ -->
				<!-- ################################################################################################ -->

				<!-- ################################################################################################ -->
			</div>
			<!-- ################################################################################################ -->
			<!-- / main body -->
			<div class="clear"></div>
		</main>
	</div>

	<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
	<!-- JAVASCRIPTS -->
	<script src="/resources/layout/scripts/jquery.min.js"></script>
	<script src="/resources/layout/scripts/jquery.backtotop.js"></script>
	<script src="/resources/layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>
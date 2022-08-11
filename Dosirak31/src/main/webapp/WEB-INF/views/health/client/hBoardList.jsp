<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<style type="text/css">

/* 운동 이미지 */
.img {
	height: 400px;
	width: 450px;
}

/* 맨위 이미지 */
.overlay {
	height: 350px;
	background-color: rgba(0, 0, 0, 0);
}

.head {
	font-weight: bold;
	font-size: x-large;
}

.container {
	padding: 30px;
}

.heading {
	maring-bottom: 30px;
}

.ul {
    list-style:none;
}

.li {
    float: left;
    padding-right: 9px;
}

.row3 a{
	color: black;
}


</style>

</head>
<div class="wrapper row2 bgded"
	style="background-image: url('/resources/images/common/health_header.jpg');">
	<div class="overlay"></div>
</div>
<div class="wrapper row3">

	<main class="container clear">

		<!-- main body -->
		<!-- ################################################################################################ -->
		<div class="content">
			<div>
				<h2 class="head">웨이트. 유산소. 어떻게 해야 할까요?</h2>
			</div>
			<!-- ################################################################################################ -->
			<div id="gallery">
				<ul class="nospace clear ul">
					<li class="li"><a href="/health/weightList?health_category_no=1"><img
							class="img"
							src="/dosirak31img/health/health_weight_weightMain.JPG" alt=""><br />
							<span class="btn_group">
							<button class="ClassName">웨이트 트레이닝 자세히</button>
							</span></a></li>
					<li class="li"><a href="/health/cardioList?health_category_no=2"><img
							class="img"
							src="/dosirak31img/health/health_cardio_cardioMain.JPG" alt=""><br /><span class="btn_group">
							<button class="ClassName">유산소 트레이닝 자세히</button>
							</span></a></li>
				</ul>
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
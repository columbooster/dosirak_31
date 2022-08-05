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

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

	<div class="wrapper row3">
		<main class="container clear">
			<!-- main body -->
			<!-- ################################################################################################ -->
			<div class="content">
				<!-- ################################################################################################ -->
				<div id="gallery">
					<figure>
						<header class="heading">${weightDetail.health_img_name }</header>
						<!-------------------------------------------------- 동영상 & 소개 공간 ---------------------------------------------------->
						<div class="jumbotron">

							<section>
								<iframe width="560" height="315"
									src="https://www.youtube.com/embed/${weightDetail.health_url }?mute=1&autoplay=1"></iframe>
							</section>
						</div>

						<div class="row marketing">
							<div class="col-lg-6">
								<h4>운동영상 댓글</h4>
								<p>댓글</p>
							</div>
						</div>

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
	
</body>
</html>

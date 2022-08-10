<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
	<style type="text/css">
	.overlay{background-color:rgba(0,0,0,0); height:650px; }
	h2{color:black; font-size:40px; }
	h3{color:black; font-size:30px; }
	.heading{font-weight:bold; font-size:40px;}
	.fs{font-size:20px;}
	.kj{font-weight:bold; color:#EE6D00;}
	.wd{width:200px; height:150px;}
	</style>
	<script type="text/javascript" src="/resources/include/js/coin-slider.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/origin.js"></script>
	<link rel="stylesheet" href="/resources/include/css/coin-slider-styles.css" type="text/css" />
		
	<script type="text/javascript">
	
	
	$(function(){
        $("#coin-slider").coinslider({ 
        	navigation: false, delay: 2000, hoverPause: true ,
        	width: 565, // width of slider panel
        	height: 260, // height of slider panel	
        	
        });
        
        $(window).scroll(function(){
    	    $(".top").css("opacity", 1 - $(window).scrollTop() / 250);
    	  });
    });
	</script>

<body id="top">
  <!-- ##################  nav바 시작  ################### -->

<!-- ##################  nav바 끝 ################### -->
<!-- ##################  main 시작 ################### -->

<div class="wrapper row2 bgded" style="background-image:url('/resources/images/common/main.jpg');">
  <div class="overlay">
    <section id="pageintro" class="clear"> 
      <!-- ################################################################################################ -->
      <div class="center btmspace-80">
        <h2 class="heading xxl uppercase btmspace-30"></h2>
        <p class="xl nospace capitalise"><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        
        <h2>함께라는 마법,</h2><br/><h3>dosirak31과 함께라면 건강한 삶은 현실이 된다.</h3></p>
      </div>
    </section>
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="container clear">
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="group">
      <div class="one_third first"><img src="/resources/images/common/foodProduct.jpg" alt=""></div>
      <div class="two_third">
        <p class="heading">DOSIRAK31의<br/> 내맘대로 구성하는 건강도시락</p>
        <p class="btmspace-80 fs">저희 DOSIRAK31은 다음과 같은 <span class="kj">3가지 약속</span>을 지키겠습니다. </p>
        <ul class="nospace group">
          <li class="one_third first">
            <h6 class="nospace btmspace-10"><a>1.DOSIRAK31 농장</a></h6>
            <p class="nospace">직접 운영하는 농장에서 키운 재료들로 최상의 맛과 품질을 유지하고 있습니다.</p>
            <img class="wd" src="/resources/images/common/nongJang.jpg"/>
          </li>
          <li class="one_third">
            <h6 class="nospace btmspace-10"><a>2.신선한 재료들</a></h6>
            <p class="nospace">DOSIRAK31에서 판매하는 모든 야채와 과일, 원재료들은 모두 유기농으로 키웁니다.</p>
             <img class="wd" src="/resources/images/common/organic.jpg"/>
          </li>
          <li class="one_third last">
            <h6 class="nospace btmspace-10"><a>3.새벽 배송</a></h6>
            <p class="nospace">신선함을 유지한 도시락을 받아 보실 수 있도록 당일 새벽 배송으로 보내드립니다.</p>
             <img class="wd" src="/resources/images/common/delivery.jpg"/>
          </li>
        </ul>
      </div>
      <div class="top"><div class="title"><span></span></div></div>
		<section>
			<h1>대출 베스트 TOP3</h1>
			   <div id='coin-slider'>
				    <a href="http://store.seoul.go.kr/images/goods/12056_imgl.jpg" target="_blank">
				        <img src="http://store.seoul.go.kr/images/goods/12056_imgl.jpg" >
				        <span>
				           1위. 2019 보건환경백서<br/>
				          
				        </span>
				    </a>
				    <a href="http://store.seoul.go.kr/images/goods/11936_imgl.jpg">
				        <img src="http://store.seoul.go.kr/images/goods/11936_imgl.jpg" >
				        <span>
				           2위.BANPOBON-DONG(반포본동)<br/> 
				           
				        </span>
				    </a>
				    <a href="http://store.seoul.go.kr/images/goods/11916_imgl.jpg">
				        <img src="http://store.seoul.go.kr/images/goods/11916_imgl.jpg" >
				        <span>
				           3위.앵커-서울역 일대 도시재생공간 8 )<br/> 
				           
				        </span>
				    </a>
				</div>
			
			</section>
    </div>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<!-- ##################  main 끝 ################### -->

<!-- 하단 -->

<!-- 하단 끝 -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 

</body>
</html>
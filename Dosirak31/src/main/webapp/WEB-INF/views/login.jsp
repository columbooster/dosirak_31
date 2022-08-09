<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
	<style type="text/css"></style>
	<script type="text/javascript"></script>

<body id="top">
  <!-- ##################  nav바 시작  ################### -->

<!-- ##################  nav바 끝 ################### -->
<!-- ##################  main 시작 ################### -->

<div class="wrapper row2 bgded" style="background-image:url('/resources/images/demo/backgrounds/01.png');">
  <div class="overlay">
    <section id="pageintro" class="clear"> 
      <!-- ################################################################################################ -->
      <div class="center btmspace-80">
        <h2 class="heading xxl uppercase btmspace-30">Dosirak31 HomePage</h2>
        <p class="xl nospace capitalise">Welcome "${sessionScope.client_info.client_id }님"</p>
      </div>
      <ul class="nospace group services">
        <li class="one_third first">
          <article class="overlay"><a href="/health/hBoardList"><i class="fa fa-legal"></i></a>
            <h6 class="heading">WorkOut</h6>
            <p>웨이트/유산소 운동 영상을 보며 따라하고, 운동영상에 대한 회원들의 생각을 댓글로 소통합니다.&hellip;</p>
            <footer><a href="/health/hBoardList">바로가기&raquo;</a></footer>
          </article>
        </li>
        <li class="one_third">
          <article class="overlay"><a href="/food/foodClientBasicList"><i class="fa fa-line-chart"></i></a>
            <h6 class="heading">Food</h6>
            <p>기초대사량을 계산해보고, 영양성분을 고려하여 나만의 도시락을 구성하여 구입할 수 있습니다.&hellip;</p>
            <footer><a href="/food/foodClientBasicList">바로가기&raquo;</a></footer>
          </article>
        </li>
        <li class="one_third">
          <article class="overlay"><a href="/community/client/communityList"><i class="fa fa-archive"></i></a>
            <h6 class="heading">Community</h6>
            <p>커뮤니티 공간에서 회원들간의 소통을하고 관리자에게 묻고싶은 질문을 Q&A로 할 수 있습니다.&hellip;</p>
            <footer><a href="/community/client/communityList">바로가기&raquo;</a></footer>
          </article>
        </li>
      </ul>
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
      <div class="one_third first"><img src="/resources/images/demo/460x700.png" alt=""></div>
      <div class="two_third">
        <h2 class="heading">Etiam finibus tempus felis eget ullamcorper</h2>
        <p>Cras pellentesque neque, consectetur adipiscing elit. Fusce venenatis elit ac ligula euismod varius. Maecenas feugiat purus quam, vel aliquet tellus sodales eu. Integer vitae vestibulum turpis, in sollicitudin quam. Aliquam vulputate non felis non luctus. Vestibulum eget augue nulla. Aliquam dignissim nibh mi, ut bibendum quam dapibus eget. Nam nec nisi vel sapien pulvinar ultrices. Curabitur rutrum nisl sagittis, pretium velit eget, convallis lacus. Nulla fermentum nulla ut lacus maximus, ut porttitor neque varius. Nullam sed vulputate sem. Sed bibendum porttitor metus.</p>
        <p class="btmspace-80">Donec lacinia lacus eros, nec luctus odio bibendum dictum. Vivamus nec egestas libero, non faucibus mauris. In in efficitur felis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc porttitor turpis in ex porttitor, nec sagittis diam ultrices.</p>
        <ul class="nospace group">
          <li class="one_third first">
            <h6 class="nospace btmspace-10"><a href="#"><i class="fa fa-location-arrow"></i> Praesent neque</a></h6>
            <p class="nospace">Mauris consectetur vel tellus quis consectetur&hellip;</p>
          </li>
          <li class="one_third">
            <h6 class="nospace btmspace-10"><a href="#"><i class="fa fa-lock"></i> Integer tinciduntt</a></h6>
            <p class="nospace">Mauris consectetur vel tellus quis consectetur&hellip;</p>
          </li>
          <li class="one_third last">
            <h6 class="nospace btmspace-10"><a href="#"><i class="fa fa-map-marker"></i> Aliquam mauris</a></h6>
            <p class="nospace">Mauris consectetur vel tellus quis consectetur&hellip;</p>
          </li>
        </ul>
      </div>
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
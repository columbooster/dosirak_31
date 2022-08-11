<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css"></style>
<script type="text/javascript">
	$(function() {

	})
</script>

<body id="top">
	<!-- ##################  nav바 시작  ################### -->

	<!-- ##################  nav바 끝 ################### -->
	<!-- ##################  main 시작 ################### -->

	<div class="wrapper hits2 bgded"
		style="background-image: url('/resources/images/demo/backgrounds/01.png');">
		<div class="overlay">
			<section id="pageintro" class="clear">
				<!-- ################################################################################################ -->
				<div class="center btmspace-80">
					<h2 class="heading xxl uppercase btmspace-30">Dosirak31
						HomePage</h2>
					<p class="xl nospace capitalise">Welcome</p>
				</div>
				<ul class="nospace group services">
					<li class="one_third first">
						<article class="overlay">
							<a href="/health/hBoardList"><i class="fa fa-legal"></i></a>
							<h6 class="heading">WorkOut</h6>
							<p>웨이트/유산소 운동 영상을 보며 따라하고, 운동영상에 대한 회원들의 생각을 댓글로
								소통합니다.&hellip;</p>
							<footer>
								<a href="/health/hBoardList">바로가기&raquo;</a>
							</footer>
						</article>
					</li>
					<li class="one_third">
						<article class="overlay">
							<a href="/food/foodNoClientBasicList"><i
								class="fa fa-line-chart"></i></a>
							<h6 class="heading">Food</h6>
							<p>기초대사량을 계산해보고, 영양성분을 고려하여 나만의 도시락을 구성하여 구입할 수 있습니다.&hellip;</p>
							<footer>
								<a href="/food/foodNoClientBasicList">바로가기&raquo;</a>
							</footer>
						</article>
					</li>
					<li class="one_third">
						<article class="overlay">
							<a href="/community/client/communityList"><i
								class="fa fa-archive"></i></a>
							<h6 class="heading">Community</h6>
							<p>커뮤니티 공간에서 회원들간의 소통을하고 관리자에게 묻고싶은 질문을 Q&A로 할 수
								있습니다.&hellip;</p>
							<footer>
								<a href="/community/client/communityList">바로가기&raquo;</a>
							</footer>
						</article>
					</li>
				</ul>
			</section>
		</div>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper hits3">
		<main class="container clear">
			<!-- main body -->
			<!-- ################################################################################################ -->

			<h2>베스트 게시물 게시판</h2>
			<table border="1">
				<tr>
					<th>조회수 순위</th>
					<th>글번호</th>
					<th>글제목</th>
					<th>작성자</th>
					<th>내용</th>
					<th>날짜</th>
					<th>조회수</th>
					
					<!-- forEach var = "개별데이터" items = "집합데이터" -->
					<c:forEach var="htis" items="${map.hitsList}">
						<!-- 컨트롤러에서 map안에 list를 넣었기 때문에 이렇게 받는다. -->
						<tr>
							<td>${hits.health_hitsRank}</td>
							<!-- 게시글 조회수 순위 -->
							<td>${hits.health_no}</td>
							<!-- 글번호 -->
							<!-- 클릭하면 컨트롤러의 view.do로 이동하고, 게시물번호, 페이지 번호, 검색옵션, 키워드를 같이 넘긴다 -->
							<td><a
								href="/health/cardioDetail?health_no=${hits.health_no}">${hits.health_title}</a>
								<c:if test="${hits.health_hits > 0}">
									<span style="color: red;">( ${hits.health_hits} )</span>
								</c:if></td>

							<td>${hits.admin_id}</td>
							<!-- 작성자의 이름 -->
							<td>${hits.health_contents}</td>
							<!-- 글의내용 -->
							<td>${hits.health_date}</td>
							<!-- 날짜의 출력형식을 변경함 -->
							<td>${hits.health_hits}</td>
							<!-- 조회수 -->

						</tr>
					</c:forEach>
			</table>
			
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
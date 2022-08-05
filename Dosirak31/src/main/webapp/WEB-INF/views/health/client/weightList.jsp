<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<script type="text/javascript">
	$(function(){
		
		/* 이미지 클릭 시 운동 동영상 상세 페이지 이동을 위한 처리 이벤트 */
		$(".goImgDetail").click(function() {
			let health_no = $(this).parents("tr").attr("data-num");
			$("#health_no").val(health_no);
			console.log("헬스번호 : " + health_no);
			$("#detailForm").attr({
				"meothd" : "get",
				"action" : "/health/weightDetail"
			});
			$("#detailForm").submit();
		});
		
		/* 검색 후 검색 대상과 검색 단어 출력 */
        let word="<c:out value='${data.keyword}'/>";
        let value="";
        if(word!=""){
           $("#keyword").val("<c:out value='${data.keyword}'/>");
           $("#search").val("<c:out value='${data.search}'/>");
           
           if($("#search").val()!='health_contents'){
              
                 if($("#search").val()=='health_name') value="#list tr td.goImgDetail";
                 console.log($(value+":contains('"+word+"')").html());
                 
                 //검색단어 빨간색으로 바꾸기
                 $(value+":contains('"+word+"')").each(function(){
                    let regex=new RegExp(word,'gi');
                    $(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
                 });
           
           }
        }
      
         /* 입력 양식 enter제거 */
         $("#keyword").bind("keydown",function(event){
            if(event.keyCode==13){
               event.preventDefault();
            }
         });
         
         /* 검색대상이 변경될 때마다 처리 이벤트 */
         $("#search").change(function(){
            if($("#search").val()=="all"){
               $("#keyword").val("전체 데이터 조회합니다.");
            }else if($("#search").val()!="all"){
               $("#keyword").val("");
               $("#keyword").focus();
            }
         });
         
        /* 검색버튼 클릭 시 처리이벤트 */
         $("#searchData").click(function(){
            if($("#search").val()!="all"){
               if(!chkData("#keyword","검색어를")) return;
            }
            goPage();
         })

            /* 페이징 처리 기능 */
        $(".paginate_button a").click(function(e){
           e.preventDefault();
           $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
           goPage();
        });
	}); //최상위함수
     
     //검색을 위한 실질적인 처리 함수
     function goPage(){
        if($("#search").val()=="all"){
           $("#keyword").val("");
        }
        $("#f_search").attr({
           "method":"get",
           "action":"/health/weightList"
        })
        $("#f_search").submit();
	};

</script>	

</head>

	<div class="wrapper row2 bgded"
		style="background-image: url('/resources/images/demo/backgrounds/01.png');">
		<div class="overlay">
			<div id="breadcrumb" class="clear">
				<!-- ################################################################################################ -->
				<ul>
					<li><a href="#">Home</a></li>
					<li><a href="#">Lorem</a></li>
					<li><a href="#">Ipsum</a></li>
					<li><a href="/health/hBoardList">WORKOUTS</a></li>
				</ul>
				<!-- ################################################################################################ -->
			</div>
		</div>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row3">
		<main class="container clear">
			<!-- main body -->
			<!-- ################################################################################################ -->
			<div class="content">
				<!-- ################################################################################################ -->
				<div id="gallery">
					<figure>
						<header class="heading">Weight Exercise</header>
						<!-- 히든 상세 게시판 -->
						<form id="detailForm">
							<input type="hidden" id="health_no" name="health_no" />
						</form>
						
						<!-------------------------------------------------- 웨이트 게시판 운동 리스트(이미지) 시작 ---------------------------------------------------->				
						<div id="weightList" class="table-height">
							<table class="table table-striped">
								<c:choose>
									<c:when test="${not empty weightList }">
										<c:forEach var="imgBoard" items="${weightList }"
											varStatus="status">
											<tr class="text-center" data-num="${imgBoard.health_no }">
												<td><img class="goImgDetail"
													src="/dosirak31img/health/${imgBoard.health_img }" /> 
												</td>
											</tr>
											<tr>
												<td>${imgBoard.health_name }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4" class="tac text-center">웨이트 동영상(이미지) 게시물이 존재하지 않습니다</td>
										</tr>
									</c:otherwise>
								</c:choose>

							</table>
						</div>
					</figure>
				</div>
				<!-------------------------------------------------- 웨이트 게시판 운동 리스트(이미지) 끝 ---------------------------------------------------->
				
				<%--=======검색기능 시작 --%>
		         <div id="boardSearch" class="text-right">
		            <form id="f_search" name="f_search" class="form-inline">
		            <%--페이징 처리를 위한 파라미터 --%>
		            <input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
		            <input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
		               <div class="form-group">
		                  <select id="search" name="search" class="form-control">
		                     <option value="all">전체</option>
		                     <option value="b_title">제목</option>
		                     <option value="b_content">내용</option>
		                  </select>
		                  <input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control"/>
		                  <button type="button" id="searchData" class="btn btn-success">검색</button>
		               </div>
		            </form>
		         </div>

				<!-------------------------------------------------- 게시판 페이지 바 시작 ---------------------------------------------------->
				<tag:pagination pageNum="${pageMaker.cvo.pageNum }" amount="${pageMaker.cvo.amount }"
				startPage="${pageMaker.startPage }" endPage="${pageMaker.endPage }" prev="${pageMaker.prev }" next="${pageMaker.next }"/>
				<!--  
				<nav class="pagination">
					<ul>
						<li><a href="#">&laquo; Previous</a></li>
						<li class="current"><strong>1</strong></li>
						<li><a href="#">2</a></li>
						<li><strong>&hellip;</strong></li>
						<li><a href="#">6</a></li>
						<li><a href="#">7</a></li>
						<li><a href="#">8</a></li>
						<li><a href="#">9</a></li>
						<li><strong>&hellip;</strong></li>
						<li><a href="#">14</a></li>
						<li><a href="#">15</a></li>
						<li><a href="#">Next &raquo;</a></li>
					</ul>
				</nav>-->
				<!-------------------------------------------------- 게시판 페이지 바 끝 ---------------------------------------------------->
			</div>
			<!-- ################################################################################################ -->
			<!-- / main body -->
			<div class="clear"></div>
		</main>
	</div>

</body>
</html>
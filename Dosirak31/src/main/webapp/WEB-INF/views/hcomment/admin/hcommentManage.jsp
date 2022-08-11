<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
	<style type="text/css">
		
			button{
				margin:auto;
				background-color: rgba(0,0,0,0);
				border:0;
				outline:0;
			}
			
			th, td{
  				text-align: center;
			}
			
			
			#reviewList > div{
				 margin: auto; text-align: center;
			}
			
	</style>
	<script type="text/javascript">

	</script>

</head>
	<body>
		
	<div class="wrapper row3">
	
   <h3>운동 게시판 댓글 관리</h3>
   
    <style>
			#item-template{display: none;}
	</style>
  		
    	
    	 
    <table class="table table-condensed">
    	<thead>
    		<tr>
    			<th>글제목</th>
    			<th>댓글번호</th>
    			<th>내용</th>
    			<th>아이디</th>
    			<th>관리자 권한</th>
    		</tr>
    	</thead>
    	
    	
    	<tbody id = "reviewList">
    		<tr id = "item-template">
    			<td class="health_title"></td>
    			<td class="health_comment_no"></td>
    			<td class="health_comment_contents"></td>
    			<td class="client_id"></td>
    			<td><button type="button" data-btn="delBtn" class="btn-write">삭제</button></td>
    		</tr>
 		</tbody>
 		
 		
	</table>
    
 	<script type="text/javascript">
		 
		
		 /*********************************************************************
		 	DOM이 만들어지면 실행됨
		 *******************************************************************/
		 	$(document).ready(function(){ 
		 		
		 /*********************************************************************
		 	댓글 목록 보기
		 *******************************************************************/
		 
					showList();
				
		 
			 	/*********************************************************************
			 			댓글 삭제
			 	*******************************************************************/
	            $(document).on("click", "button[data-btn='delBtn']", function(){
	            	
					let health_comment_no = $(this).parents().parents().attr("data-health_comment_no"); //헬스 댓글번호(primary key)를 가져옴
					
					deleteBtn(health_comment_no);
					
				});
			 	

			 	
	           
	     });	//최상위 함수
		 
		
	     
	     /*********************************************************************
		 	댓글 목록의 값을 받아오는 함수
		 *******************************************************************/
		 function showList() {
	    	 
				$(".reply").detach(); //선택한 요소를 DOM트리에서 삭제
				
				let url = "/adminhreplies/comments" //여기서 컨트롤러로 전송
				
				$.getJSON(url, function(data) {  //댓글 목록들을 받아왔음
					$(data).each(function() {
						   
		                   let health_title = this.health_title; //게시글 제목 
		                   let health_comment_no = this.health_comment_no; //댓글 번호
		                   let health_comment_contents = this.health_comment_contents; //댓글내용
		                   let client_id = this.client_id; // 작성자 아이디
		                   let up_date = this.up_date; // 수정날짜
		                   
		                   
		                   template(health_title,health_comment_no,health_comment_contents,client_id)//댓글 양식에 가져온 값들을 셋팅
		                   
					}); 
				
				}).fail(function() {
						alert("게시물에 달린 댓글이 없습니다.");
				});
			} 
			
		 /*********************************************************************
		 	댓글 틀 및 내용을 집어넣어주는 함수(받아온 값들을 셋팅)
		 *******************************************************************/
		 function template(health_title,health_comment_no,health_comment_contents,client_id){
			 
			 let $ul = $('#reviewList');
			 
			 let $element = $('#item-template').clone().removeAttr('id'); //<li>를 id삭제한채로 그대로 복사
			 
			 $element.addClass("reply");
			 
			 $element.attr("data-health_title",health_title); //<li>에 속성 추가 1
			 $element.attr("data-health_comment_no",health_comment_no); //<li>에 속성 추가 1
			 $element.attr("data-health_comment_contents",health_comment_contents); //<li>에 속성 추가 2
			 $element.attr("data-client_id",client_id); //<li>에 속성 추가 3
			 
			 $element.find('.health_title').text(health_title);
			 $element.find('.health_comment_no').text(health_comment_no);
			 $element.find('.health_comment_contents').text(health_comment_contents);
			 $element.find('.client_id').text(client_id);
			 
			 $ul.append($element);
			 
		 }
		 
		 /*********************************************************************
		  	글 삭제를 위한 함수
	     *******************************************************************/
		
		function deleteBtn(health_comment_no) {
				
					$.ajax({
	                     type:'DELETE',       // 요청 메서드
	                     url: '/adminhreplies/comments/'+health_comment_no,  // 댓글 번호를 보냄
	                     
	                     success : function(result){
	                    	 
	                        showList();
	                        
	                     },
	                     error : function(){ alert("본인이 쓴 댓글만 삭제 가능합니다.") } // 에러가 발생했을 때, 호출될 함수
	                     
	                 }); // $.ajax()
	          
		 }
		 
	</script>
     		
  <!-- ################################################################################################ --> 
    <!-- / main body -->
    <div class="clear"></div>
  
</div>
		
	</body>
</html>

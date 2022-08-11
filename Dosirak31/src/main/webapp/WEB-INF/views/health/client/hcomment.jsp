<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
	 
		<link rel="shortcut icon" href="/resources/img/common/icon.png"/>
		<link rel="apple-touch-icon" href="/resources/img/common/icon.png"/>
		
		<title>hComment.jsp</title>

		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css"/>
		
		<style type="text/css">
		
			
			ul{list-style:none;}
			
			#reviewList > li {
			
    			background-color: #f9f9fa;
    			list-style-type: none;
    			padding : 18px 18px 9px 18px;
    			
			}
			
			.update{
				font-size:9pt;
    			color : rgb(97,97,97);
    			padding: 8px 0 8px 0;
    			margin : 0 8px 0 0;
			}
			
			
			}
			
			#reviewList > button {
    			font-size:9pt;
    			color : rgb(97,97,97);
    			padding: 8px 0 8px 0;
    			text-decoration: none;
    			margin : 0 6px 0 0;
			}
			
			.health_comment_contents {
    			overflow-wrap: break-word;
			}
			
			
			li > * {
    			padding : 0 0 0 0;
			}
			
			.btn {
    			font-size:10pt;
   				color : black;
    			background-color: #eff0f2;
    			text-decoration: none;
    			padding : 9px 10px 9px 10px;
    			border-radius: 5px;
    			float : right;
			}
			
			
			li > button{
				 border : 0;
    			 padding : 0;
    			 background-color: rgba( 255, 255, 255, 0.5 );
    			 display: inline-block;
			}
			
			#exampleInputName2{
				margin-top: 13px;
			}
			
			#wrtRepBtn{
			
    			font-size:10pt;
   				color : rgb(97,97,97);
    			background-color: #eff0f2;
    			text-decoration: none;
    			padding : 9px 10px 9px 10px;
    			border-radius: 5px;
    			float : right;
    			border : 0;
    			padding : 0;
    			background-color: rgba( 255, 255, 255, 0.5 );
    			display: inline-block;
    			margin-top:6px;
			
			
			}
			
			#modBtn{
				margin-right: 5px;
			
			}
			
		</style>
		
		<style>
   			a{color:#FF8D2C;}
		</style>
	
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>

	
</head>
<body>
	<button id="listBtn" type="button" class="btn btn-default" style="float: left;">댓글 목록 보기</button><br/><br/>
    
    
	<div id="commentList"><br/><br/>
    </div>
    
    <style>
		#item-template{display: none;}
	</style>
    
    
    <ul id = "reviewList">
		<li id = "item-template">	
			<span style="font-weight: bold; font-size: 15px;" class="client_id"></span><br/>
			<span class="health_comment_contents"></span><br/>
			<span class="up_date"></span>
			<button type="button" data-btn ="replyBtn" class="btn-delete">답글쓰기</button>
			<button type="button" data-btn ="modBtn" class="btn-modify">수정</button>
			<button type="button" data-btn="delBtn" class="btn-write">삭제</button>
    	</li>
    </ul>
    <div id="replyForm" style="display:none" class="form-group">
    	<input type="text" name="replyComment" class="form-control" id="exampleInputName2" placeholder="답글을 입력하세요"/>
    	<button type="button" id="wrtRepBtn">답글 등록</button><br/>
    </div>
    
    <div class="form-group">
    	<input type="text" name ="comment" class="form-control" placeholder="댓글을 입력하세요"/><br/>
    	<button id="sendBtn" type="button"  class="btn btn-warning" style = "color: white; border:none; ">댓글 등록</button>
    	<button id="modBtn" type="button"  class="btn btn-warning" style = "color: white; border:none;">수정 완료</button><br/><br/><br/>
    </div>
    
     
 	<script type="text/javascript">
		 
		 let health_no = ${cardioDetail.health_no}
		 
		 /*********************************************************************
		 	DOM이 만들어지면 실행됨
		 *******************************************************************/
		 	$(document).ready(function(){ 
		 		
		 /*********************************************************************
		 	댓글 목록 보기
		 *******************************************************************/
		 
			 $(document).on("click", "#listBtn", function(){
			     	
					showList(health_no);
				
			});
		 
		 
		  /*********************************************************************
			 	댓글 달기
		  *******************************************************************/
			 $(document).on("click", "#sendBtn", function(){	// 보내기 버튼을 눌렀을 때
					
				 	let health_comment_contents = $("input[name=comment]").val(); // comment 텍스트창에 적혀있는 댓글 내용을 가져온다.
					
				 	/**댓글 입력칸이 공백이면 댓글을 입력해달라는 경고창이 뜸 **/
				 	if(health_comment_contents.trim() == ''){
				 		
				 		alert("댓글 내용을 입력해주세요");
				 		$("input[name=comment]").focus();
				 		
				 		return;
				 	}
				 	
				 	/**댓글 입력창 전송**/
				 	$.ajax({
	                     type:'POST',       // 요청 메서드
	                     url: '/hreplies/comments?health_no='+health_no,  //정보를 여기로 보냄
	                     headers : {"Content-Type":"application/json"},
	                     data: JSON.stringify({health_no:health_no,health_comment_contents:health_comment_contents}), //서버로 전송할 데이터
	                     
	                     success : function(result){
	                    	 
	                        showList(health_no); //요청이 성공하면 댓글 목록을 갱신하여 다시 보여준다. 
	                        $("input[name=comment]").val('');
	                        
	                     },
	                     error : function(){ alert("댓글을 입력할 수 없습니다.") } // 댓글 등록을 실패했을 때 , 경고창을 띄운다. 
	                 }); // $.ajax()
			 		
				});
			 
			 /*********************************************************************
			 	댓글 수정
			 *******************************************************************/
			 $(document).on("click", "#modBtn", function(){	// 댓글 수정버튼을 클릭했을 때 
					
				 	let health_comment_contents = $("input[name=comment]").val(); // comment 텍스트창에 적혀있는 댓글 내용을 가져온다.
					let health_comment_no = $(this).attr("data-health_comment_no");
				 	
				 	/**댓글 수정(입력)칸 이 공백이면 댓글을 입력해달라는 경고창이 뜸 **/
				 	if(health_comment_contents.trim() == ''){
				 		
				 		alert("댓글 내용이 없어 수정 불가능합니다.");
				 		
				 		$("input[name=comment]").focus();
				 		
				 		return;
				 	}
				 	
				 	/**댓글 수정(입력)창 전송 -> 댓글옆에 달린 수정버튼으로 해당 댓글의 정보를 최상위 태그로 보내줬었음, 그것을 컨트롤러로 전송 **/
				 	$.ajax({
	                     type:'PATCH',       // 요청 메서드
	                     url: '/hreplies/comments/'+health_comment_no,  //정보를 여기로 보냄
	                     headers : {"Content-Type":"application/json"},
	                     data: JSON.stringify({health_comment_no:health_comment_no,health_comment_contents:health_comment_contents}), //서버로 전송할 데이터
	                     
	                     success : function(result){
	                    	 
	                        showList(health_no); //요청이 성공하면 댓글 목록을 갱신하여 다시 보여준다. 
	                        $("input[name=comment]").val('');
	                        
	                     },
	                     error : function(){ alert("댓글 수정은 본인만 가능합니다.") } // 다른사람이 댓글을 수정하려하면 , 경고창을 띄운다. 
	                 }); // $.ajax()
			 		
				});
			 
			 
			 /*********************************************************************************************************
	 			 댓글 수정을 위해 각 댓글의 정보를 최상위 태그로 보내는 작업 -> 수정버튼을 클릭하면 각 댓글의 정보를 가지고 컨트롤러로 간뒤, 수정작업을 진행
	 		 *********************************************************************************************************/
    		 $(document).on("click", "button[data-btn='modBtn']", function(){ // 여기 있는 수정버튼은 댓글마다 달린 수정 버튼 
     	
				let health_no = $(this).parents().attr("data-health_no");//없어도됨
				let health_comment_no = $(this).parents().attr("data-health_comment_no");
				let health_comment_contents = $("span.health_comment_contents",$(this).parent()).text(); //클릭된 수정버튼의 부모에 있는 span.health_comment_contents만 가져옴
				
				//1. comment의 내용을 상단에 띄워준다. (기존 댓글을 보여줌 -> 추후 기존 댓글을 지우고 댓글을 입력하면 새로운 댓글 내용이 셋팅됨)
				 $("input[name=comment]").val(health_comment_contents);
				
				//2. 맨 위에 있는 수정버튼에 댓글 번호를 전달한다. health_comment_no
				$("#modBtn").attr("data-health_comment_no",health_comment_no);
				
				//즉, 댓글에 달린 수정 버튼을 클릭시 1번과 2번을 최상위태그로 전달(기존 댓글 내용 + 수정할 댓글 번호)
				//추후 댓글에 달린 수정버튼 말고, 댓글 입력 창에있는 수정버튼 클릭시 이 정보를 가지고 컨트롤러로 감
			
			 });
	          	
			 
			 
			 	/*********************************************************************
			 			댓글 삭제
			 	*******************************************************************/
	            $(document).on("click", "button[data-btn='delBtn']", function(){
	            	
					let health_no = $(this).parents().attr("data-health_no");
					let health_comment_no = $(this).parents().attr("data-health_comment_no");
					
					deleteBtn(health_no, health_comment_no);
					
				});
			 	

			 	/*********************************************************************
			 		답글 달기전 사전작업
			 	*******************************************************************/
	            $(document).on("click", "button[data-btn='replyBtn']", function(){
	            	
	            	//1. replyForm을 옮긴다. -> replyBtn의 부모 즉, li태그의 맨 뒤에 붙인다.
	            	$("#replyForm").appendTo($(this).parent());
	            	
	            	//2. 답글을 입력할 폼을 보여준다.
	            	$("#replyForm").css("display","block");
	            	
				});
			 	
	            /*********************************************************************
			 		답글 달기
			 	**********************************************************************/
			 	$(document).on("click", "#wrtRepBtn", function(){	// 보내기 버튼을 눌렀을 때
					
				 	let health_comment_contents = $("input[name=replyComment]").val(); // comment 텍스트창에 적혀있는 댓글 내용을 가져온다.
					let parent_health_comment_no = $("#replyForm").parent().attr("data-parent_health_comment_no");
				 	
				 	/**댓글 입력칸이 공백이면 댓글을 입력해달라는 경고창이 뜸 **/
				 	if(health_comment_contents.trim() == ''){
				 		
				 		alert("답글 내용을 입력해주세요");
				 		$("input[name=replyComment]").focus();
				 		
				 		return;
				 	}
					
				 	/**댓글 입력창 전송**/
				 	$.ajax({
	                     type:'POST',       // 요청 메서드
	                     url: '/hreplies/comments?health_no='+health_no,  //정보를 여기로 보냄
	                     headers : {"Content-Type":"application/json"},
	                     data: JSON.stringify({parent_health_comment_no:parent_health_comment_no,health_no:health_no,health_comment_contents:health_comment_contents}), //서버로 전송할 데이터
	                     
	                     success : function(result){
	                    	 
	                        showList(health_no); //요청이 성공하면 댓글 목록을 갱신하여 다시 보여준다. 
	                       
	                     },
	                     error : function(){ alert("댓글을 입력할 수 없습니다.") } // 댓글 등록을 실패했을 때 , 경고창을 띄운다. 
	                 }); // $.ajax()
	                 
	                 	$("#replyForm").css("display","none"); //완료된 뒤 안보이게함
	                 	$("input[name=replyComment]").val(''); // 값도 비워줌
	                 	$("#replyForm").appendTo("body"); // 특정 댓글 밑이 아닌 원래 위치로 되돌림
	                 
			 		
				});
	           
	     });	//최상위 함수
		 
		 
	     
	     /*********************************************************************
		 	댓글 목록의 값을 받아오는 함수
		 *******************************************************************/
		 function showList(health_no) {
				$(".reply").detach(); //선택한 요소를 DOM트리에서 삭제
				
				let url = "/hreplies/comments?health_no="+health_no; //여기서 컨트롤러로 전송
				
				$.getJSON(url, function(data) {  //댓글 목록들을 받아왔음
					$(data).each(function() {
						   
		                   let health_no = this.health_no; //게시글번호 
		                   let health_comment_no = this.health_comment_no; //댓글번호
		                   let parent_health_comment_no = this.parent_health_comment_no; //모댓글 번호
		                   let up_date = this.up_date; // 업데이트 날짜
		                   let client_id = this.client_id; // 작성자 아이디
		                   let health_comment_contents = this.health_comment_contents;//댓글 내용
		                   
		                   
		                   template(health_no,health_comment_no,parent_health_comment_no,up_date,health_comment_contents,client_id);//댓글 양식에 가져온 값들을 셋팅
		                   
					}); 
				
				}).fail(function() {
						alert("게시물에 달린 댓글이 없습니다.");
				});
			} 
	
	     
		 /*********************************************************************
		 	댓글 틀 및 내용을 집어넣어주는 함수(받아온 값들을 셋팅)
		 *******************************************************************/
		 function template(health_no,health_comment_no,parent_health_comment_no,up_date,health_comment_contents,client_id){
			 
			 let $ul = $('#reviewList');
			 
			 let $element = $('#item-template').clone().removeAttr('id'); //<li>를 id삭제한채로 그대로 복사
			 
			 $element.addClass("reply");
			 $element.attr("data-health_comment_no",health_comment_no); //<li>에 속성 추가 1
			 $element.attr("data-parent_health_comment_no",parent_health_comment_no); //<li>에 속성 추가 2
			 $element.attr("data-health_no",health_no); //<li>에 속성 추가 3
			 
			 
			 
			$element.find('.client_id').text(client_id);
			
			
			 $element.find('.health_comment_contents').text(health_comment_contents);
			 $element.find('.up_date').text(up_date);
			 
			 $ul.append($element);
			 
		 }
		 
		 /*********************************************************************
		  	글 삭제를 위한 함수
	     *******************************************************************/
		
		function deleteBtn(health_no, health_comment_no) {
				
					$.ajax({
	                     type:'DELETE',       // 요청 메서드
	                     url: '/hreplies/comments/'+health_comment_no,  // 댓글 번호를 보냄
	                     
	                     success : function(result){
	                    	 
	                        showList(health_no);
	                        
	                     },
	                     error : function(){ alert("본인이 쓴 댓글만 삭제 가능합니다.") } // 에러가 발생했을 때, 호출될 함수
	                 }); // $.ajax()
	           
		 }
		 
	</script>
			 	
	
	
</body>
</html>
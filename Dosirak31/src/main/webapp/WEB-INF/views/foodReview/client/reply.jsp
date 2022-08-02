<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<script type="text/javascript">
			
		 $(function(){
	         /*기본 덧글 목록 불러오기*/
	         let page_no=${page.page_no};
	         listAll(b_num);
	         
	         /*글 입력을 위한 ajax연동 처리*/
	        // $("#replyInsertBtn").click(function(){
	        	$(document).on("click","#replyInsertBtn",function(){
	        	 let insertUrl="/replies/replyInsert";
	        	 /*JSON.stringfy():JavaScript 값이나 객체를 json문자열로 반환*/
	        	 let value=JSON.stringify({
	        		b_num:b_num,
	        	 	r_name:$("#r_name").val(),
	        	 	r_pwd:$("#r_pwd").val(),
	        	 	r_content:$("#r_content").val()
	        	 });
	        	 
	        	 $.ajax({
	        		 url:insertUrl, //전송url
	        		 type:"post",//전송 시 method방식
	        		 headers:{
	        			 "Content-Type":"application/json"
	        		 },
	        		 dataType:"text",
	        		 data:value,
	        		 error:function(xhr,textStatus,errorThrown){
	        			 alert(textStatus+"/"+xhr.status+"/"+errorThrown+")");
	        		 },
	        		 beforeSend:function(){
	        			 if(!checkForm("#r_name","작성자를")) return false;
	        			 else if(!checkForm("#r_pwd","비밀번호를")) return false;
	        			 else if(!checkForm("#r_content","댓글내용을")) return false;
	        		 },
	        		 success:function(result){
	        			 if(result="SUCCESS"){
	        				alert("댓글 등록이 완료되었습니다.");
	        				dataReset();
	        				listAll(b_num);
	        			 }
	        		 }
	        		 
	        	 })
	        	 
	         })
	         
	         /*비밀번호 확인없이 수정버튼 제어*/
	         $(document).on("click","button[data-btn='upBtn']",function(){
	        	 let panel=$(this).parents("div.panel");
	        	 let r_num=panel.attr("data-num");
	        	 updateForm(r_num,panel);
	         });
	         
	         	 
	        /*수정 폼 화면 구현 함수*/
	        function updateForm(r_num,panel){
	        	$("#r_name").val(panel.find(".panel-title .name").html());
	        	$("#r_name").prop("readonly",true);
	        	
	        	let content=panel.find(".panel-body").html();
	        	content=content.replace(/(<br>|<br\/>|<br \/>)/g,"\r\n");
	        	$("#r_content").val(content);
	        	
	        	$("#replyForm button[type='button']").attr("id","replyUpdateBtn");
	        	$("#replyForm button[type='button']").attr("data-rnum",r_num);
	        
	        }
	   
	        /*수정을 위한 ajax연동 처리*/
	        $(document).on("click","#replyUpdateBtn",function(){
	      
	        	let r_num=$(this).attr("data-rnum");
	        	$.ajax({
	        		url:"/replies/"+r_num,
	        		type:"put",
	        		headers:{
	        			"Content-Type":"application/json",
	        			"X-HTTP-Method-Override":"PUT"
	        			
	        		},
	        		data:JSON.stringify({
	        			r_content:$("#r_content").val(),
	        			r_pwd:$("#r_pwd").val()
	        		
	        		}),
	        		dataType:"text",
	        		error:function(xhr,textStatus,errorThrown){
	        			alert("수정에 문제가 있습니다.");
	        		},
	        		beforeSend:function(){
	        			if(!checkForm("#r_content","댓글내용을")) return false;
	        		},
	        		success:function(result){
	        			if(result=="SUCCESS"){
	        				alert("댓글 수정이 완료되었습니다");
	        				dataReset();
	        				listAll(b_num);
	        			}
	        		}
	        		
	        	
	        	})
	        	
	        		
	        
	        })
	        
	        
	         /*비밀번호 확인없이 삭제버튼 제어*/
	        	 $(document).on("click","button[data-btn='delBtn']",function(){
	        		 let r_num=$(this).parents("div.panel").attr("data-num");
	        		 deleteBtn(b_num,r_num);
	        
	       	
	        	 })
	      })//최상위 $종료.
	      
	      //댓글 목록 보여주는 함수
	      function listAll(b_num){
	         
	         $(".reply").detach();//detach():선택한 요소를 dom트리에서 삭제
	         let url="/replies/all/"+b_num;
	         
	         $.getJSON(url,function(data){
	            $(data).each(function(){
	               let r_num=this.r_num;
	               let r_name=this.r_name;
	               let r_content=this.r_content;
	               let r_date=this.r_date;
	               r_content=r_content.replace(/(\r\n|\r|\n)/g,"<br/>");
	               template(r_num,r_name,r_content,r_date);
	            });
	         }).fail(function(){
	            alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해주세요.");
	         })
	      }
	   
	      
	      //새로운 글을 화면에 추가하기(보여주기)위한 함수
	      function template(r_num,r_name,r_content,r_date){
	         let $div=$("#reviewList");
	         
	         let $element=$("#item-template").clone().removeAttr("id");
	         $element.attr("data-num",r_num);
	         $element.addClass("reply");
	         $element.find(".panel-heading>.panel-title>.name").html(r_name+"님");
	         $element.find(".panel-heading>.panel-title>.date").html("/"+r_date);
	         $element.find(".panel-body").html(r_content);
	         
	         $div.append($element);
	         
	      }
	      
	      /*입력 폼 초기화*/
	      function dataReset(){
	         $("#replyForm").each(function(){
	            this.reset();
	         })
	      }
	      /*글 삭제를 위한 ajax연동 처리*/
	      function deleteBtn(b_num,r_num){
	    	  if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
	    		  $.ajax({
	    			  url:'/replies/'+r_num,
	    			  type:'delete',//method-get(조회)/post(입력)/put(수정)/delete(삭제) 존재
	    			  headers:{
	    				  "X-HTTP-Method-Override":"DELETE"
	    			  },
	    			  dataType:'text',
	    			  error:function(xhr,textStatus,errorThrown){//실행시 오류가 발생하였을 경우
	    				  alert(textStatus+"(HTTP-"+xhr.status+"/"+errorThrown+")");
	    			  
	    			  },
	    			  success:function(result){
	    				  console.log("result: "+result);
	    				  if(result=='SUCCESS'){
	    					  alert("댓글 삭제가 완료되었습니다.");
	    					  listAll(b_num);
	    				  }
	    			  }
	    		  })
	    	  }
	      }
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		</script>
</head>
	<body>
	<div class="content"> 
		<div id="comments">
        <h2>Comments</h2>
        <ul>
          <li>
            <article>
              <header>
                <figure class="avatar"><img src="/resources/images/demo/avatar.png" alt=""></figure>
                <address>
                By <a href="#">A Name</a>
                </address>
                <time datetime="2045-04-06T08:15+00:00">Friday, 6<sup>th</sup> April 2045 @08:15:00</time>
              </header>
              <div class="comcont">
                <p>This is an example of a comment made on a post. You can either edit the comment, delete the comment or reply to the comment. Use this as a place to respond to the post or to share what you are thinking.</p>
              </div>
            </article>
          </li>
          </ul>
          
           <%--리스트 영역 --%>
         <div id="reviewList">
            <div id="item-template" class="panel panel-success">
               <div class="panel-heading">
                  <h3 class="panel-title">
                     <span class="name"></span>
                     <span class="date"></span>
                     <button type="button" data-btn="upBtn" class="btn btn-default gap">수정하기</button>
                     <button type="button" data-btn="delBtn" class="btn btn-default gap">삭제하기</button>
                     
                  </h3>
               </div>
               <div class="panel-body"></div>
            </div>
         </div>
          
          <%--댓글 입력 화면 --%>
   
     
        
      </div>
          
          
          
          
          
          
          
         
          
          
        
        <h2>Write A Comment</h2>
        <form action="#" method="post">
          <div class="one_third first">
            <label for="name">Name <span>*</span></label>
            <input type="text" name="name" id="name" value="" size="22">
          </div>
          <div class="one_third">
            <label for="email">Mail <span>*</span></label>
            <input type="text" name="email" id="email" value="" size="22">
          </div>
          
          <div class="block clear">
            <label for="comment">Your Comment</label>
            <textarea name="comment" id="comment" cols="25" rows="10"></textarea>
          </div>
          <div>
            <input name="submit" type="submit" value="Submit Form">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
        </form>
      </div>
      
      
       <div id="replyContainer">
      
         <form id="replyForm" name="replyForm">
         	<div class="panel panel-default">
         		<table class="table">
         			<tbody>
         				<tr>
         					<td class="com-md-1">작성자</td>
         					<td class="com-md-3 text-left">
         						<input type="text" name="r_name" id="r_name" maxlength="5" class="form-control"/>
         					</td>
         					<td class="com-md-1">비밀번호</td>
         					<td class="com-md-3 text-left">
         						<input type="password" name="r_pwd" id="r_pwd" maxlength="18" class="form-control"/>
         					</td>
         					<td class="com-md-4">
         						<button type="button" id="replyInsertBtn" class="btn btn-success">저장</button>
         						
         					</td>
         				</tr>
         				<tr>
         					<td class="com-md-1">댓글내용</td>
         					<td class="com-md-11 text-left">
         						<textarea name="r_content" id="r_content" class="form-control" rows="3"></textarea>
         					</td>
         				</tr>	
         			</tbody>
         		</table>
         	</div>
         
         
         </form>
         </div>
	</body>
</html>
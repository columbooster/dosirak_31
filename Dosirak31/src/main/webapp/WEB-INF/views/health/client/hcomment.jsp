<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %> 
    
      <link rel="shortcut icon" href="/resources/img/common/icon.png"/>
      <link rel="apple-touch-icon" href="/resources/img/common/icon.png"/>
      
      <title>hComment.jsp</title>

      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css"/>
      
      <style type="text/css">
      
         
         ul{list-style:none; margin: 0; padding: 0; }
         
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
         
         .dosirakBtn {
             
             float : right;
         }
         
          .dosirakBtn2 {
             
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
         <button type="button" data-btn ="replyBtn" class="btn-write">????????????</button>
         <button type="button" data-btn ="modBtn" class="btn-modify">??????</button>
         <button type="button" data-btn="delBtn" class="btn-delete">??????</button>
       
         
       </li>
    </ul>
    <div id="replyForm" style="display:none" class="form-group">
       <input type="text" name="replyComment" class="form-control" id="exampleInputName2" placeholder="????????? ???????????????"/>
       <button type="button" id="wrtRepBtn">?????? ??????</button><br/>
    </div>
    
    
    <div class="form-group">
       <input type="text" name ="comment" class="form-control" placeholder="????????? ???????????????" /><br/>
       <button id="sendBtn" type="button"  class="dosirakBtn" style = "color: white; border:none;">?????? ??????</button>
       <button id="modBtn" type="button"  class="dosirakBtn2" style = "color: white; border:none;">?????? ??????</button><br/><br/><br/>
    </div>
    
     
    <script type="text/javascript">
       
       let health_no = ${cardioDetail.health_no} 
       
       /*********************************************************************
          DOM??? ??????????????? ?????????
       *******************************************************************/
          $(document).ready(function(){ 
             
       /*********************************************************************
          ?????? ?????? ??????
       *******************************************************************/
       
               showList(health_no);
            
       
        /*********************************************************************
             ?????? ??????
        *******************************************************************/
          $(document).on("click", "#sendBtn", function(){   // ????????? ????????? ????????? ???
               
                let health_comment_contents = $("input[name=comment]").val(); // comment ??????????????? ???????????? ?????? ????????? ????????????.
               
                /**?????? ???????????? ???????????? ????????? ?????????????????? ???????????? ??? **/
                if(health_comment_contents.trim() == ''){
                   
                   alert("?????? ????????? ??????????????????");
                   $("input[name=comment]").focus();
                   
                   return;
                }
                
                /**?????? ????????? ??????**/
                $.ajax({
                        type:'POST',       // ?????? ?????????
                        url: '/hreplies/comments?health_no='+health_no,  //????????? ????????? ??????
                        headers : {"Content-Type":"application/json"},
                        data: JSON.stringify({health_no:health_no,health_comment_contents:health_comment_contents}), //????????? ????????? ?????????
                        
                        success : function(result){
                          
                           showList(health_no); //????????? ???????????? ?????? ????????? ???????????? ?????? ????????????. 
                           
                           $("input[name=comment]").val('');
                           
                        },
                        error : function(){ alert("????????? ????????? ??? ????????????.") } // ?????? ????????? ???????????? ??? , ???????????? ?????????. 
                    }); // $.ajax()
                
            });
          
          /*********************************************************************
             ?????? ??????
          *******************************************************************/
          $(document).on("click", "#modBtn", function(){   // ?????? ??????????????? ???????????? ??? 
               
                let health_comment_contents = $("input[name=comment]").val(); // comment ??????????????? ???????????? ?????? ????????? ????????????.
               let health_comment_no = $(this).attr("data-health_comment_no");
                
                /**?????? ??????(??????)??? ??? ???????????? ????????? ?????????????????? ???????????? ??? **/
                if(health_comment_contents.trim() == ''){
                   
                   alert("?????? ????????? ?????? ?????? ??????????????????.");
                   
                   $("input[name=comment]").focus();
                   
                   return;
                }
                
                /**?????? ??????(??????)??? ?????? -> ???????????? ?????? ?????????????????? ?????? ????????? ????????? ????????? ????????? ???????????????, ????????? ??????????????? ?????? **/
                $.ajax({
                        type:'PATCH',       // ?????? ?????????
                        url: '/hreplies/comments/'+health_comment_no,  //????????? ????????? ??????
                        headers : {"Content-Type":"application/json"},
                        data: JSON.stringify({health_comment_no:health_comment_no,health_comment_contents:health_comment_contents}), //????????? ????????? ?????????
                        
                        success : function(result){
                           
                           showList(health_no); //????????? ???????????? ?????? ????????? ???????????? ?????? ????????????. 
                           $("input[name=comment]").val('');
                           
                        },
                        error : function(){ alert("?????? ????????? ????????? ???????????????.") } // ??????????????? ????????? ?????????????????? , ???????????? ?????????. 
                    }); // $.ajax()
                
            });
          
          
          /*********************************************************************************************************
              ?????? ????????? ?????? ??? ????????? ????????? ????????? ????????? ????????? ?????? -> ??????????????? ???????????? ??? ????????? ????????? ????????? ??????????????? ??????, ??????????????? ??????
           *********************************************************************************************************/
           $(document).on("click", "button[data-btn='modBtn']", function(){ // ?????? ?????? ??????????????? ???????????? ?????? ?????? ?????? 
        
            let health_no = $(this).parents().attr("data-health_no");//????????????
            let health_comment_no = $(this).parents().attr("data-health_comment_no");
            let health_comment_contents = $("span.health_comment_contents",$(this).parent()).text(); //????????? ??????????????? ????????? ?????? span.health_comment_contents??? ?????????
            
            //1. comment??? ????????? ????????? ????????????. (?????? ????????? ????????? -> ?????? ?????? ????????? ????????? ????????? ???????????? ????????? ?????? ????????? ?????????)
             $("input[name=comment]").val(health_comment_contents);
            
            //2. ??? ?????? ?????? ??????????????? ?????? ????????? ????????????. health_comment_no
            $("#modBtn").attr("data-health_comment_no",health_comment_no);
            
            //???, ????????? ?????? ?????? ????????? ????????? 1?????? 2?????? ?????????????????? ??????(?????? ?????? ?????? + ????????? ?????? ??????)
            //?????? ????????? ?????? ???????????? ??????, ?????? ?????? ???????????? ???????????? ????????? ??? ????????? ????????? ??????????????? ???
         
          });
                
          
             /*********************************************************************
                   ?????? ??????
             *******************************************************************/
               $(document).on("click", "button[data-btn='delBtn']", function(){
                  
               let health_no = $(this).parents().attr("data-health_no");
               let health_comment_no = $(this).parents().attr("data-health_comment_no");
               
               deleteBtn(health_no, health_comment_no);
               
            });
             

             /*********************************************************************
                ?????? ????????? ????????????
             *******************************************************************/
               $(document).on("click", "button[data-btn='replyBtn']", function(){
                  
                  //1. replyForm??? ?????????. -> replyBtn??? ?????? ???, li????????? ??? ?????? ?????????.
                  $("#replyForm").appendTo($(this).parent());
                  
                  //2. ????????? ????????? ?????? ????????????.
                  $("#replyForm").css("display","block");
                  
            });
             
             /*********************************************************************
                ?????? ??????
             **********************************************************************/
             $(document).on("click", "#wrtRepBtn", function(){   // ????????? ????????? ????????? ???
               
                let health_comment_contents = $("input[name=replyComment]").val(); // comment ??????????????? ???????????? ?????? ????????? ????????????.
               let parent_health_comment_no = $("#replyForm").parent().attr("data-parent_health_comment_no");
                
                /**?????? ???????????? ???????????? ????????? ?????????????????? ???????????? ??? **/
                if(health_comment_contents.trim() == ''){
                   
                   alert("?????? ????????? ??????????????????");
                   $("input[name=replyComment]").focus();
                   
                   return;
                }
               
                /**?????? ????????? ??????**/
                $.ajax({
                        type:'POST',       // ?????? ?????????
                        url: '/hreplies/comments?health_no='+health_no,  //????????? ????????? ??????
                        headers : {"Content-Type":"application/json"},
                        data: JSON.stringify({parent_health_comment_no:parent_health_comment_no,health_no:health_no,health_comment_contents:health_comment_contents}), //????????? ????????? ?????????
                        
                        success : function(result){
                           
                           showList(health_no); //????????? ???????????? ?????? ????????? ???????????? ?????? ????????????. 
                          
                        },
                        error : function(){ alert("????????? ????????? ??? ????????????.") } // ?????? ????????? ???????????? ??? , ???????????? ?????????. 
                    }); // $.ajax()
                    
                       $("#replyForm").css("display","none"); //????????? ??? ???????????????
                       $("input[name=replyComment]").val(''); // ?????? ?????????
                       $("#replyForm").appendTo("body"); // ?????? ?????? ?????? ?????? ?????? ????????? ?????????
                    
                
            }); 
              
        });   //????????? ??????
       
       
        
        /*********************************************************************
          ?????? ????????? ?????? ???????????? ??????
       *******************************************************************/
       function showList(health_no) {
            $(".reply").detach(); //????????? ????????? DOM???????????? ??????
            
            let url = "/hreplies/comments?health_no="+health_no; //????????? ??????????????? ??????
            
            $.getJSON(url, function(data) {  //?????? ???????????? ????????????
               $(data).each(function() {
                     
                         let health_no = this.health_no; //??????????????? 
                         let health_comment_no = this.health_comment_no; //????????????
                         let parent_health_comment_no = this.parent_health_comment_no; //????????? ??????
                         let up_date = this.up_date; // ???????????? ??????
                         let client_id = this.client_id; // ????????? ?????????
                         let health_comment_contents = this.health_comment_contents;//?????? ??????
                         
                         
                         template(health_no,health_comment_no,parent_health_comment_no,up_date,health_comment_contents,client_id);//?????? ????????? ????????? ????????? ??????
                         
               }); 
            
            }).fail(function() {
                  alert("???????????? ?????? ????????? ????????????.");
            });
         } 
      
        
       /*********************************************************************
          ?????? ??? ??? ????????? ?????????????????? ??????(????????? ????????? ??????)
       *******************************************************************/
       function template(health_no,health_comment_no,parent_health_comment_no,up_date,health_comment_contents,client_id){
          
          let $ul = $('#reviewList');
          
          let $element = $('#item-template').clone().removeAttr('id'); //<li>??? id??????????????? ????????? ??????
          
          let loginName = "${sessionScope.client_info.client_id}";
          
          $element.addClass("reply");
          $element.attr("data-health_comment_no",health_comment_no); //<li>??? ?????? ?????? 1
          $element.attr("data-parent_health_comment_no",parent_health_comment_no); //<li>??? ?????? ?????? 2
          $element.attr("data-health_no",health_no); //<li>??? ?????? ?????? 3
          
          
             if(health_comment_no == parent_health_comment_no){
                
                $element.find('.client_id').text(client_id);
                
             }else{
                
                $element.find('.client_id').text("???"+client_id);
                $element.find('.btn-write').detach();
                
             }
          
          $element.find('.health_comment_contents').text(health_comment_contents);
          $element.find('.up_date').text(up_date);
          
          if(loginName != client_id){
             
              $element.find('.btn-modify').detach();
              $element.find('.btn-delete').detach();
              
           }
          
          $ul.append($element);
          
       }
       
       /*********************************************************************
           ??? ????????? ?????? ??????
        *******************************************************************/
      
      function deleteBtn(health_no, health_comment_no) {
            
               $.ajax({
                        type:'DELETE',       // ?????? ?????????
                        url: '/hreplies/comments/'+health_comment_no,  // ?????? ????????? ??????
                        
                        success : function(result){
                           
                           showList(health_no);
                           
                        },
                        error : function(){ alert("????????? ??? ????????? ?????? ???????????????.") } // ????????? ???????????? ???, ????????? ??????
                    }); // $.ajax()
              
       }
       
   </script>
             
   
</body>
</html>
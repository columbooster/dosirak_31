<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
      <style>         
       .bt{margin-right:7px;}
           .disflex{display:flex;}
          .btn{
            text-align-last: right;
         }
      </style>


      <script type="text/javascript">
         $(function() {
            // 수정 버튼 클릭시 처리 이벤트
            $("#mypageReviewUpdateBtn").click(function() {
               // 점수 제한 정규식
               let scoreval = $('#review_score').val()
               let scorecheck = /^[0-5]$/
               if (!scorecheck.test(scoreval)){
                  alert('점수는 0~5점 사이의 정수를 입력해주세요.')
                  $('review_score').focus();
                  return false
               }
               //입력값 체크
               if(!chkData("#review_score", "점수를")) return;
               else if(!chkData("#review_contents", "작성할 내용을")) return;
               else {
                  $("#f_updateForm").attr({
                     "method" : "post",
                     "action" : "/mypage/client/mypageReviewUpdate"
                  });
                  $("#f_updateForm").submit();
               }
            });
            
            // 취소 버튼 클릭시 처리 이벤트
            $("#mypageReviewCancelBtn").click(function() {
               $("#f_updateForm").each(function() {
                  this.reset();
               });
            });
            
            // 목록 버튼 클릭 시 처리 이벤트
            $("#mypageReviewListBtn").click(function() {
               location.href="/mypage/client/mypageReviewList";
            });
            
            let review_score=$("#review_score").val();
            $(".review_score").each(function(){
                    if($(this).val()==review_score){
                       $(this).attr("checked",true);
                    }
                 })
            
         });
         
     	function orderList(client_no){
	         location.href="/mypage/client/mypageOrderList?client_no="+client_no;
	      }
      </script>
</head>


   <body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2 bgded" style="background-image:url('/resources/images/common/modify.jpeg'); height: 320px;">
  
    <div id="breadcrumb" class="clear"> 
      <!-- ################################################################################################ -->
      
      <!-- ################################################################################################ -->
    </div>
  
</div>
   <div class="wrapper row3">
   <main class="container clear" style="
    padding-top: 30px; "> 
         
         <div class="sidebar one_quarter first"> 
      <!-- ################################################################################################ -->
      <h6>Category</h6>
      <nav class="sdb_holder">
        <ul>
          <li><a href="/mypage/client/mypageMain">회원정보</a></li>
          <li><a href="javascript:orderList(${sessionScope.client_info.client_no })">주문 내역</a>
          <li><a href="/mypage/client/mypageReviewList">나의 리뷰</a>
          <ul>
             <li><a>리뷰 수정</a></li>
          </ul></li>
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </div>
   
   
         <div class="content three_quarter"> 
      <!-- ################################################################################################ -->
      <div>
       <section id="content">
       <div class="header-title" style="
    margin-bottom: 10px;">
              My page
           <span class="right-arrow">&gt;</span>
           <strong>Review</strong>
           </div>
             <h3 class="title">리뷰 수정</h3>
            
               <form id="f_updateForm" name="f_updateForm">
                  <input type="hidden" id="review_no" name="review_no" value="${updateData.review_no}" />
                  <input type="hidden" id="order_no" name="order_no" value="${data.order_no}" />
                  <table class="table table-bordered">
                     <tbody>

                        <tr>
                           <td>작성자</td>
                           <td colspan="3" class="text-left">${updateData.review_name}</td>
                        </tr>
                        <tr>
                           <td>별점</td>
                           <td colspan="3" class="text-left disflex ">
                           <input type="radio" name="review_score" style="margin:0px 7px;" class="review_score bt" value="1"/>1
                           <input type="radio" name="review_score" style="margin:0px 7px;" class="review_score bt" value="2"/>2
                           <input type="radio" name="review_score" style="margin:0px 7px;" class="review_score bt" value="3"/>3
                           <input type="radio" name="review_score" style="margin:0px 7px;" class="review_score bt" value="4"/>4
                           <input type="radio" name="review_score" style="margin:0px 7px;" class="review_score bt" value="5"/>5   
                           <input type="hidden" id="review_score" value="${updateData.review_score}"/>                        
                           </td>
                        </tr>
                        <tr class="table-tr-height">
                           <td>내용</td>
                           <td colspan="3" class="text-left">
                              <textarea name="review_contents" id="review_contents" class="form-control" rows="8" placeholder="자유로운 의견을 남겨주세요.">${updateData.review_contents}</textarea>
                           </td>
                        </tr>
                        
                        
                     </tbody>
                  </table>
               </form> 
               
               </section>     
            
            <div class="btn">
               <input type="button" value="목록" id="mypageReviewListBtn" class="dosirakBtn2" style=" width: 70px;">
               <input type="button" value="취소" id="mypageReviewCancelBtn" class="dosirakBtn2" style=" width: 70px;">
               <input type="button" value="수정" id="mypageReviewUpdateBtn" class="dosirakBtn" style=" width: 70px;">
            </div>
   
     </div>
    <div class="clear"></div>
     </main>
   </div>
      <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
   </body>
</html>
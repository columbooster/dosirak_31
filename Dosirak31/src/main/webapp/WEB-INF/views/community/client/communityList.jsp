<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
      <style type="text/css">
           
          
     
        
         table,table-striped{
            border-left: none;
             border-right: none;
         }
       
          .table>tbody>tr>td, 
          .table>tbody>tr>th {
             text-align: center;
             vertical-align: middle;
             border-left: none;
             border-right: none;
         }
    
    
          th{
             color: #000000;
             background: ghostwhite;
             border-left: none;
             border-right: none;
             
             }
             
          td{
             background-color: #FFFFFF;
             font-size: 15px;
          }
             
          .container {
             color: #000000;
             padding-top: 0px;
             padding-right: 0px;
             padding-bottom: 40px;
             padding-left: 0px;
         }
         
         .pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
             z-index: 2;
             color: #fff;
             cursor: default;
             background-color: #a5d610;
             border-color: #a5d610;
         }
         
         .pagination>li>a, .pagination>li>span {
             position: relative;
             float: left;
             padding: 6px 12px;
             margin-left: -1px;
             line-height: 1.42857143;
             color: #337ab7;
             text-decoration: none;
             background-color: #fff;
             border: 1px solid #ddd;
         }
          
          
          
         .dosirakBtn1{
   text-decoration:none;
   font-family:Arial;
   box-shadow:inset #a4d610 0px 5px 8px -1px;
   o-box-shadow:inset #a4d610 0px 5px 8px -1px;
   -moz-box-shadow:inset #a4d610 0px 5px 8px -1px;
   -webkit-box-shadow:inset #a4d610 0px 5px 8px -1px;
   background:#99c40e;
   background:-o-linear-gradient(90deg, #99c40e, #88ad10);
   background:-moz-linear-gradient( center top, #99c40e 5%, #88ad10 100% );
   background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #99c40e), color-stop(1, #88ad10) );
   filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#99c40e', endColorstr='#88ad10');
   background:-webkit-linear-gradient(#99c40e, #88ad10);
   background:-ms-linear-gradient(#99c40e, #88ad10);
   background:linear-gradient(#99c40e, #88ad10);
   text-indent:0px;
   line-height:23px;
   -moz-border-radius:6px;
   -webkit-border-radius:6px;
   border-radius:6px;
   text-align:center;
   vertical-align:middle;
   display:inline-block;
   font-size:12px;
   color:#ffffff;
   width:auto;
   height:auto;
   padding:5.2px;
   text-shadow:#7d7d7d 0px 1px 0px;
   border-color:#ffffff;
   border-width:0px;
   border-style:solid;
}

.dosirakBtn1:active {
   box-shadow:inset #a4d610 0px 5px 8px -1px,#658205 0px 0 0px;
   o-box-shadow:inset #a4d610 0px 5px 8px -1px,#658205 0px 0 0px;
   -moz-box-shadow:inset #a4d610 0px 5px 8px -1px,#658205 0px 0 0px;
   -webkit-box-shadow:inset #a4d610 0px 5px 8px -1px,#658205 0px 0 0px;
   position:relative;
   top:5px
}

.dosirakBtn1:hover {
   background:#88ad10;
   background:-o-linear-gradient(90deg, #88ad10, #99c40e);
   background:-moz-linear-gradient( center top, #88ad10 5%, #99c40e 100% );
   background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #88ad10), color-stop(1, #99c40e) );
   filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#88ad10', endColorstr='#99c40e');
   background:-webkit-linear-gradient(#88ad10, #99c40e);
   background:-ms-linear-gradient(#88ad10, #99c40e);
   background:linear-gradient(#88ad10, #99c40e);
} 
          
         
      </style>
      <script type="text/javascript">
            $(function() {
            
               // ?????? ??? ?????? ????????? ?????? ?????? ??????
               let word ="<c:out value='${communityVO.keyword}' />";
               let value="";
               if(word!=""){
                  $("#keyword").val("<c:out value='${communityVO.keyword}' />");
                  $("#search").val("<c:out value='${communityVO.search}' />");
                  
                  if($("#search").val()!='community_contents'){
                     //:contains()??? ?????? ???????????? ????????? ????????????
                     if($("#search").val()=='community_title') value = "#list tr td.goDetail";
                     else if($("#search").val()=='client_id') value="#list tr td.name";
                     console.log($(value+":contains('"+word+"')").html());
                     
                     $(value+":contains('"+word+"')").each(function() {
                        let regex = new RegExp(word,'gi');
                        $(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
                     });
                  }
                  
               }
               
               // ?????? ?????? enter ??????
               $("#keyword").bind("keydown", function(evnet){
                  if(event.keyCode == 13){
                     event.preventDefault();
                  }
               });
               
               // ?????? ????????? ????????? ????????? ?????? ?????????
               $("#search").change(function() {
                  if($("#search").val()=="all"){
                     $("#keyword").val("?????? ????????? ???????????????.");
                  }else if($("#search").val()!="all"){
                     $("#keyword").val("");
                     $("#keyword").focus();
                  }
               });
               
               // ?????? ?????? ?????? ??? ?????? ?????????
               $("#searchData").click(function() {
                  if($("#search").val()!="all"){ // ?????? /??????/????????? ????????? ????????? ????????? ??????.
                     if(!chkData("#keyword","????????????")) return;
                  }
                  $("#pageNum").val(1);
                  goPage();
                  
               });
               
               
               // ????????? ?????? ????????? ?????? ?????????.
               $("#insertFormBtn").click(function() {
                  
                  location.href = "/community/client/writeForm";
                  
               });
               
               
               // ?????? ????????? ?????? ????????? ????????? ?????? ?????? ?????????
               $(".goDetail").click(function() {
                  let community_no = $(this).parents("tr").attr("data-num");
                  $("#community_no").val(community_no);
                  console.log("????????? : " + community_no);
                  
                  let community_category_no = $(this).parents("tr").attr("data-numc");
                  $("#community_category_no").val(community_category_no);
                  console.log("?????????????????? : " + community_category_no);
                  
                  // ?????? ???????????? ???????????? ?????? form ?????? (id : detailForm)
                  $("#detailForm").attr({
                     "method":"get",
                     "action":"/community/client/communityDetail"
                  });
                  $("#detailForm").submit();
               });
               
               $(".paginate_button a").click(function(e) {
                  e.preventDefault();
                  $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
                  goPage();
               });
               
            });
            
            // ????????? ?????? ???????????? ?????? ??????
            function goPage(){
               if($("#search").val()=="all"){
                  $("#community_category_no").val($("#community_category_no"));
                  $("#keyword").val("");
               }
               $("#f_search").attr({
                  "method":"get",
                  "action":"/community/client/communityList"
               });   
               $("#f_search").submit();
            }
            
         
            
            
         </script>
      
</head>
<body>
<!-- ???????????? ??????-->      
<!-- <div class="wrapper row2 bgded"
      style="background-image: url('/resources/images/common/community3.jpg');">
      <div class="overlay">
         
      </div>
   </div>  -->
   <div id="hBoardList_board_img" class="wrapper row2 bgded"
   style="background-image: url('/resources/images/common/community3.jpg');">
   <div class=" hBoardList_name_location">
      <div id="breadcrumb" class="hBoard_Name">????????????</div>
   </div>
</div>
<!-- ???????????? ?????? ???-->      
<div class="wrapper row3" style="padding-bottom:45px; padding-top:50px;">
   <main class="container clear">
   
      <div class="contentContainer container">
         <c:if test="${pageMaker.cvo.community_category_no == 0}">
         
         
         <div class="main_contents">
            
            <hr class="main_contents_hr">
            <div class="head"><span class="bold">?????? ?????????</span></div>
            <hr class="main_contents_hr">
            
            <div class="hBoardListContents">Dosirak31??? ?????? <span class="bold">????????? ???</span> ??? ???????????????.</div>
         </div>
         
         </c:if>
         <c:if test="${pageMaker.cvo.community_category_no == 1}">
            
         <div class="main_contents">
            
            <hr class="main_contents_hr">
            <div class="head"><span class="bold">Q & A ?????????</span></div>
            <hr class="main_contents_hr">
            
            <div class="hBoardListContents">Dosirak31??? <span class="bold"> ????????? ????????? </span> ??? ?????????????????? ??????</div>
            <div class="hBoardListContents">???????????? <span class="bold"> ?????? ??????????????? ??? ?????????????????????.</span></div>
         </div>
         
         </c:if>      
            <form id="detailForm">
               <input type="hidden" id="community_no" name="community_no" />
               <input type="hidden" id="community_category_no" name="community_category_no" />
            </form>
            
            <form id="writeForm">
               <input type="hidden" id="community_category_no" name="community_category_no" />
            </form>
            
               
            
            <%-- ==================== ????????? ?????? ========================= --%>
            <div id="communityList" class="table-height">
               <table summary="????????? ?????????" class="table table-striped">
                  <thead>
                     <tr>
                        <th data-value="community_no" class="order text-center col-md-1" >?????????</th>
                        <th class="text-center col-md-4">?????????</th>
                        <th class="text-center col-md-2">?????????</th>
                        <th data-value="community_date" class="order col-md-2 text-center">?????????</th>
                        <th class="text-center col-md-1">?????????</th>
                        <th class="text-center col-md-4">?????????</th>
                     </tr>
                  </thead>
                  <tbody id="list" class="table-striped">
                     <!-- ????????? ?????? -->
                     <c:choose>
                        <c:when test="${not empty communityList}">
                           <c:forEach var="community" items="${communityList}" varStatus="status">
                              <tr class="text-center" data-num="${community.community_no}" data-numc="${community.community_category_no}">
                                 <td>${community.community_no}</td>
                                 <c:if test="${community.community_closed == 1}">
                                 
                                    <c:choose>
                                       <c:when test="${community.client_id eq sessionScope.client_info.client_id || sessionScope.admin_info.admin_id != null}">
                                          <td class="goDetail text-left" style="text-align: left;">
                                          <c:out value="${community.community_title}" />   
                                          <c:if test="${community.reply_cnt > 0}"><span class="reply_count">[${community.reply_cnt}]</span></c:if>
                                          </td>
                                       </c:when>
                                       <c:otherwise>
                                       <td class="text-left" style="text-align: left;">
                                       <span><img alt="???????????????" src="/resources/images/common/secret.png" style="width:20px; height:20px;">&nbsp;&nbsp;&nbsp;</span>?????? ???????????? ??????????????????.
                                       </td>
                                       </c:otherwise>
                                    </c:choose>
                                 
                                 </c:if>
                                 <c:if test="${community.community_closed == 0}">
                                 <td class="goDetail text-left" style="text-align: left;">
                                    <c:if test="${community.community_category_no == 1}"><span><img alt="qna??????" src="/resources/images/common/qna3.png" style="width:35px; height:15px;">&nbsp;&nbsp;</span></c:if>
                                    <c:if test="${community.community_notify == 1}"><span style="color: blue; font-weight: bold;">[????????????]
                                    ${community.community_title} </span></c:if> 
                                    <c:if test="${community.community_notify == 0}">${community.community_title}</c:if> 
                                    <c:if test="${community.reply_cnt > 0}"><span class="reply_count">[${community.reply_cnt}]</span></c:if>
                                    <c:if test="${community.reply_cnt > 0 && community.community_category_no == 1}"><span> [????????????]</span></c:if>
                                 </td>
                                 </c:if>
                                 <c:if test="${community.client_id != null && community.admin_id == null}">
                                 <td class="name">${community.client_id}</td>
                                 </c:if>
                                 <c:if test="${community.admin_id != null && community.client_id == null}">
                                 <td class="name">${community.admin_id}</td>
                                 </c:if>
                                 <td class="text-center">${community.community_date}</td>
                                 <td class="text-center">${community.community_hits}</td>
                                 <td>
                                    <c:if test="${not empty community.file_thumb}">
                                       <img src="/dosirak31img/community/thumbnail/${community.file_thumb}" style="height: 100px;"/>
                                    </c:if>
                                    <c:if test="${empty community.file_thumb}">
                                       <img src="/resources/images/common/noimage.png" style="height: 100px;" />
                                    </c:if>
                                 </td>
                              </tr>
                           </c:forEach>
                        </c:when>
                        <c:otherwise>
                           <tr>
                              <td colspan="5" class="tac text-center">????????? ???????????? ???????????? ????????????.</td>
                           </tr>
                        </c:otherwise>
                     </c:choose>
                  </tbody>
               </table>
            </div>
               <%-- ==================== ????????? ?????? ========================= --%>
               
               <%-- ==================== ????????? ?????? ?????? ?????? ========================= --%>
            <div class="contentBtn text-right">
               <c:if test="${sessionScope.client_info.client_id != null || sessionScope.admin_info.admin_id != null}">
                  <input type="button" value="?????????" id="insertFormBtn" class="dosirakBtn">
               </c:if>
            </div>
               <%-- ==================== ????????? ?????? ?????? ?????? ========================= --%>
               
            <%-- ======== ????????? ????????? ???????????????(pagination)??? ??????============ --%>
            <tag:pagination endPage="${pageMaker.endPage}" startPage="${pageMaker.startPage}" amount="${pageMaker.cvo.amount}" 
            prev="${pageMaker.prev}" pageNum="${pageMaker.cvo.pageNum}" next="${pageMaker.next}" />      
               
               
            <%-- ==================== ?????? ?????? ?????? ========================= --%>
            <div id="communitySearch" class="contentBtn text-center">
               <form id="f_search" name="f_search" class="form-inline">
                  <%-- ????????? ????????? ?????? ???????????? --%>
                  <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">
                  <input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
                  <input type="hidden" id="community_category_no" name="community_category_no" value="${pageMaker.cvo.community_category_no}" />
                  <div class="form-group">
                     <select id="search" name="search" class="form-control">
                        <option value="all">??????</option>
                        <option value="community_title">??????</option>
                        <option value="community_contents">??????</option>
                        <option value="client_id">?????????</option>
                     </select>
                     <input type="text" name="keyword" id="keyword" value="???????????? ???????????????" class="form-control">
                     <button type="button" id="searchData" class="dosirakBtn1">&nbsp;&nbsp;??????&nbsp;&nbsp;</button>
                  </div>
               </form>
            </div>   
               <%-- ==================== ?????? ?????? ?????? ========================= --%>   
               
         </div>
   </main>      
</div>
   </body>
</html>
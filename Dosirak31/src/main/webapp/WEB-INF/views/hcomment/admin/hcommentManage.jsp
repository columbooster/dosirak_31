<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
button {
   margin: auto;
   background-color: rgba(0, 0, 0, 0);
   border: 0;
   outline: 0;
}

th, td {
   text-align: center;
}

#reviewList>div {
   margin: auto;
   text-align: center;
}
</style>


</head>
<body>

   <div class="wrapper row3" style="width:800px;">

      <h3>운동 게시판 댓글 관리</h3>

      <!-- 페이징 처리를 위한 파라미터 -->
      <form id="f_search" name="f_search" class="form-inline">
         <input type="hidden" id="pageNum" name="pageNum"
            value="${pageMaker.cvo.pageNum}"> <input type="hidden"
            id="amount" name="amount" value="${pageMaker.cvo.amount}">
      </form>
      <!-- 페이징 처리를 위한 파라미터 -->

      <form name="comment_no_date" id="comment_no_date" method="get">
         <input type="hidden" id="health_comment_no" name="health_comment_no" />
      </form>

      <table class="table table-condensed">
         <thead>
            <tr>   
               <th class="text-center col-md-1">댓글번호</th>
               <th class="text-center col-md-3" >글제목</th>
               <th class="text-center col-md-4">글내용</th>
               <th class="text-center col-md-1">아이디</th>
               <th class="text-center col-md-1">삭제</th>
            </tr>
         </thead>

         <tbody id="hcommentList">
            <c:choose>
               <c:when test="${not empty list}">
                  <c:forEach var="hcomment" items="${list}" varStatus="status">
                     <tr id="item-template">
                     <td class="health_comment_no"
                           data-health_comment_no="${hcomment.health_comment_no}">${hcomment.health_comment_no}</td>
                        <td class="health_title" style="white-space:nowarp;">${hcomment.health_title}</td>
                        <td class="health_comment_contents">${hcomment.health_comment_contents}</td>
                        <td class="client_id">${hcomment.client_id}</td>
                        <td><button type="button" data-btn="delBtn"
                              class="dosirakBtn3">삭제</button></td>
                     </tr>
                  </c:forEach>
               </c:when>

               <c:otherwise>
                  <tr>
                     <td colspan="5">등록된 게시글이 존재하지 않습니다.</td>
                  </tr>
               </c:otherwise>
            </c:choose>


         </tbody>

      </table>


      <%-- ======== 리스트 종료 ============ --%>


      <%-- ======== 페이징 처리를 커스텀태그(pagination)를 정의============ --%>
      <tag:pagination endPage="${pageMaker.endPage}"
         startPage="${pageMaker.startPage}" amount="${pageMaker.cvo.amount}"
         prev="${pageMaker.prev}" pageNum="${pageMaker.cvo.pageNum}"
         next="${pageMaker.next}" />


      <script type="text/javascript">
         $(function() {
            $(".paginate_button a").click(
                  function(e) {
                     e.preventDefault();
                     $("#f_search").find("input[name='pageNum']").val(
                           $(this).attr("href"));
                     goPage();
                  });
         });

         function goPage() {
            $("#f_search").attr({
               "method" : "get",
               "action" : "/adminhreplies/hcommentManage"
            });
            $("#f_search").submit();
         }

         $(document).on("click","button[data-btn='delBtn']",function() {

                  if (confirm("댓글을 삭제하시겠습니까?")) {

                     let health_comment_no = $(this).parents().prev().prev().prev().prev().attr("data-health_comment_no"); //헬스 댓글번호(primary key)를 가져옴

                     $("#health_comment_no").attr("value",
                           health_comment_no);

                     $("#comment_no_date").attr("action",
                           "/adminhreplies/remove");
                     $("#comment_no_date").submit();
                  }

               });
      </script>

      <!-- ################################################################################################ -->
      <!-- / main body -->
      <div class="clear"></div>

   </div>

</body>
</html>
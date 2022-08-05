<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page trimDirectiveWhitespaces="true" %> 
    

     
      <h6>관리자 페이지 목록</h6>

      <nav class="sdb_holder">
        <ul>
          <li><a href="#">게시판 관리</a>
            <ul>
              <li><a href="/food/foodAdminBasicList">식품 목록 관리</a></li>
              <li><a href="#">운동 영상 관리</a></li>
               <li><a href="#">커뮤니티 관리</a></li>
               <li><a href="#">식품 리뷰 관리</a></li>
               <li><a href="#">운동 댓글 관리</a></li>
            </ul>
          </li>
          <li><a href="#">회원 관리</a>
            <ul>
              <li><a href="/food/admin/orderhistory?order_status_no=3">회원 주문 내역</a></li>
              <li><a href="#">회원 목록</a></li>
            </ul>
          </li>
          <li><a href="/client/logout">로그아웃</a></li>
        </ul>
      </nav>
      
      
      
      <!-- ################################################################################################ -->
 
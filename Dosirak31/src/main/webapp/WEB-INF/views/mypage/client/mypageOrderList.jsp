<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

</head>
	<body>
		
		<form id="f_search" name="f_search" class="form-inline">
	      		<input type="hidden" name="client_no" value="${sessionScope.client_no }">
	    </form>
		
		<c:choose>
		      	<c:when test="${not empty mypageOrderList}" >
			      	<c:forEach var="review" items="${mypageOrderList}" varStatus="status">
				        <ul data-num="${mypageOrder.order_no}">
				          <li>
				            <article>
				              <header>
				                <figure class="avatar"><img src="/resources/images/demo/avatar.png" alt=""></figure>
				                <address>
				                By <a href="#">${mypageOrder.order_date}</a>
				                </address>
				                <span>별점 : ${mypageOrder.order_status_no}</span>
				                <div>${mypageOrder.order_address}</div>
				              </header>
				              <div class="comcont">
				                <p>${mypageOrder.order_client_no}</p>
				              </div>
				            </article>
				          </li>
				        </ul> 
			        </c:forEach>
		        </c:when>
		        <c:otherwise>
		        	<div>주문내역이 존재하지 않습니다.</div>
		        </c:otherwise>
	        </c:choose>
		
		
	</body>
</html>
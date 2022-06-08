<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table" style="text-align: center; vertical-align: middle;">
	<tr>
		<th>번호</th>
		<th>예약자</th>
		<th>아이디</th>
		<th>방문일시</th>
		<th>신고 처리 상태</th>
	</tr>
	<c:forEach items="${reportList}" var="vo" varStatus="status">
		<tr>
			<td>${fn:length(reportList) - status.index}</td>
			<td>${vo.memberVO.name}</td>
			<td>${vo.id}</td>
			<td>
				<fmt:formatDate value="${vo.reservationTime}" pattern="M월 d일 HH시 mm분"/>
			</td>
			<td>
				<c:choose>
					<c:when test="${vo.memberVO.blackList eq 0}">
						처리 중
					</c:when>
					<c:otherwise>
						활동 정지 처리
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</c:forEach>
</table>

<div class="row mt-5 justify-content-center">
	<div class="col-3">
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link pager" href="#" data-pn="${pager2.pre?pager2.startNum-1:1}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <c:forEach begin="${pager2.startNum}" end="${pager2.lastNum}" var="i">
		    	<c:choose>
		    		<c:when test="${pager2.pn eq i}">
		    			<li class="page-item active" aria-current="page">
					      <a class="page-link" href="#">${i}</a>
					    </li>
		    		</c:when>
		    		<c:otherwise>
		    			<li class="page-item"><a class="page-link pager" data-pn="${i}" href="#">${i}</a></li>
		    		</c:otherwise>
		    	</c:choose>
		    </c:forEach>
		    <li class="page-item">
		      <a class="page-link pager" href="#" data-pn="${pager2.next?pager2.lastNum+1:pager2.lastNum}" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div>
</div>
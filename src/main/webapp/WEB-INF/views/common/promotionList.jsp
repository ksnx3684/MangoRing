<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table>
	<thead>
		<tr>
			<th>promotionName</th>
			<th>promotionDetail</th>
			<th>discount</th>
			<th>StartDate</th>
			<th>EndDate</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="vo">
			<tr>

				<td>${vo.promotionName }</td>
				<td>${vo.promotionDetail }</td>
				<td>${vo.discount }</td>
				<td>${vo.startDate }</td>
				<td>${vo.endDate }</td>
			</tr>

		</c:forEach>
	</tbody>



</table>
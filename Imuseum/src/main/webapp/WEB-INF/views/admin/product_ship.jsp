<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I MUSEUM</title>
<%@ include file="/common/style.jspf"%>
<style>
.col-2 li a i {
	text-decoration: none;
	color: gray;
	font-size: 30px;
	margin-left: 10px;
}

.col-2 li a span {
	text-decoration: none;
	color: black;
	font-size: 18px;
	margin-left: 10px;
}

.bi-people-fill{
	color: black;
}

.amName {
	font-size: 1.2em;
	font-weight: bold;
}

.col-2 ul li a {
	font-size: 17px;
	color: gray;
	text-align: left;
	font-weight: normal;
}

.col-2 ul li a:hover {
	color: black;
	font-weight: bold;
}

.btn {
	border-radius: 0;
}

input[type=date] {
	border-radius: 0;
	border: 1px solid silver;
	width: 210px;
	height: 50px;
	margin: 0;
	vertical-align: middle;
}

input[type=checkbox] {
	accent-color: black;
	width: 20px;
	height: 20px;
}
.rvtable td {
	border-bottom: 1px solid #EAEAEA;
	height: 50px;
}

#am_ship {
	color: black;
	font-weight: bold;
}

.line_limit {
	width: 200px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	display: inline-block;
	vertical-align: middle;
}
</style>
<script>
	function insertShip() {
		var checkval = $("input:checkbox[name='orderNum']:checked").val();
		console.log(checkval);
		location.href = "insertShipgo.do?orderNum=" + checkval;
	};
</script>
</head>

<body>
	<c:choose>
		<c:when test="${empty member }">
			<%@include file="/common/guestMenu.jspf"%>
		</c:when>
		<c:when test="${not empty member }">
			<c:if test="${member.admin eq 'ADMIN' }">
				<%@include file="/common/adminMenu.jspf"%>
			</c:if>
			<c:if test="${member.admin eq 'NORMAL' }">
				<%@include file="/common/MemberMenu.jspf"%>
			</c:if>
		</c:when>
	</c:choose>
	<%@ include file="/common/main.jspf"%>
	<div class="container-fulid notosanskr" style="margin-bottom: 50px;">
		<div class="row" style="padding: 0; margin: 0;">
			<div class="col-8 offset-2">
				<div class="row" style="padding-top: 50px;">
					<%@ include file="/common/adminNav.jspf"%>
					<div class="col-10">
						<span style="font-size: 1.3em; font-weight: bold;">????????????</span>

						<div style="float: right;">
							<button type="button" class="btn btn-sm btn-dark"
								onclick="insertShip()">????????????</button>
						</div>


						<div>
							<table class="head" style="width: 100%; margin-top: 50px;">
								<tbody>
								</tbody>
							</table>
						</div>
						<hr style="border: 0; height: 2px; background: black;">
						<table class="rvtable" style="width: 100%; font-size: 0.8em;"
							id="ship">
							<tr
								style="text-align: center; height: 50px; background: black; color: white;">
								<th>??????</th>
								<th>????????????</th>
								<th>?????????</th>
								<th>?????????</th>
								<th>????????????</th>
								<th>??????</th>
								<th>?????????</th>
								<th>??????</th>
								<th>??????</th>
							</tr>
							<c:forEach var="order" items="${list }">
								<form action="updateOrder.do" method="get">
									<tr style="text-align: center;">
										<td><input type="checkbox" value="${order.orderNum }"
											name="orderNum"></td>
										<td>${order.orderNum }</td>
										<td>${order.orderDate }</td>
										<td><fmt:formatNumber type="number"
												pattern="###,###,###,###,###,###"
												value="${order.totalPrice }" /><span>???</span></td>
										<td>${order.orderName }</td>
										<td><span class="line_limit">${order.orderAddr }</span></td>
										<td>${order.orderPhone }</td>
										<td><select name="status">
												<option value="${order.status }" hidden>${order.status }</option>
												<option value="???????????????">???????????????</option>
												<option value="????????????">????????????</option>
												<option value="???????????????">???????????????</option>
												<option value="?????????">?????????</option>
												<option value="????????????">????????????</option>
												<option value="????????????">????????????</option>
										</select></td>
										<td>
											<button type="submit" class="btn btn-sm btn-outline-dark">??????</button>
										</td>
									</tr>
								</form>
							</c:forEach>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<%@ include file="/common/footer.jspf"%>
</html>
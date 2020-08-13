<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="<c:url value="/resources/css/custom.css"/>?v=${version}" rel="stylesheet" />
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<style>
.textUser:HOVER {
	color: #d6994a;
}

.swicthIcon {
	margin: -2px -2px 4px 0;
	width: 20px;
	height: 20px;
}

.dropdown {
	position: relative;
	display: block;
	padding: 19px 17px 12px;
	position: relative;
	display: inline-block;
	color: #ffffff;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #ccffff;
	min-width: 300px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 12px 16px;
	z-index: 1;
	border-radius: 5px;
	color: black;
}

.dropdown:hover .dropdown-content {
	display: block;
	color: black;
}

.userContent:hover {
	width: 100%;
	height: 100%;
	background-color: #0063a2;
	color: white;
}

body{
	font-family: Meiryo !important; 
}
</style>

<script src="<c:url value="/resources/js/common.js"/>?v=${version}"></script>

<script> 
	var rootURL = "${pageContext.request.contextPath}";
	function switchUserBean(userId, deptId, groupId) {
		$('body').showLoading();
		$.post(rootURL + "/switch", {
			"userId" : userId,
			"deptId" : deptId,
			"groupId" : groupId
		}, function(status) { 
			$('body').closeLoading();
			window.location.replace(rootURL);
		});
	}
	setpage($(location).attr('href'));
</script>

<div class="nav_menu">
	<ul class="nav navbar-nav navbar-right">
		<c:if test="${not empty requestScope.listGroupUser && requestScope.numberUser > 1}"> 
			<li><div class="dropdown">
					<span class="textUser" id="textUsers"><c:out
							value="${deptUserLogin.deptName}　${groupUserLogin.groupName}" />
						<a><img src="./resources/images/switch.png" class="swicthIcon"></a></span>
					<div class="dropdown-content" id="textUsersContent">
						<c:forEach items="${requestScope.listGroupUser}" var="item" varStatus="status">
							<p class="userContent"
								onclick="switchUserBean(${item.userId},${item.deptId},${item.groupId})">
								<c:set var="display" scope="session"
									value="${item.deptName}　 ${item.groupName}" />
								<c:out value="${display}" />
							</p>
						</c:forEach>
					</div>
				</div></li>
		</c:if>
		<c:if test="${empty requestScope.listGroupUser || requestScope.numberUser == 1}">
			<li><a class="textUser" id="textUsers"><c:out value="${deptUserLogin.deptName}" />　<c:out value="${groupUserLogin.groupName}" /></a></li>
		</c:if>
		<li><a tabindex="3" href="#" target="" class="header_logout"
			style="text-align: right;"><c:out value="${userLogin.lastName}"/><c:out value="${userLogin.firstName}"/> 様 <i class="fa fa-user"></i>
		</a></li>
		<li><a tabindex="4"
			href="${pageContext.request.contextPath}/logout" target=""
			class="header_logout" style="text-align: right;"> ログアウト<i
				class="fa fa-sign-out"></i>
		</a></li>
	</ul>
	<ul class="nav navbar-nav navbar-left">
		<li><a tabindex="1" href="javascript:void(0)" class="site_title"
			onclick="backToPortalWithoutSave()"><i
				class="fa fa-credit-card"></i> <span>フレッドシステム</span></a></li>
	</ul>
</div>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>${param.title}</title>
<!-- Bootstrap core CSS -->
<link rel="shortcut icon"
	href="<c:url value="/resources/images/favicon.ico"/>?v=${version}" />
<link href="<c:url value="/resources/css/bootstrap.min.css"/>?v=${version}"
	rel="stylesheet" />
<link href="<c:url value="/resources/css/custom.css"/>?v=${version}" rel="stylesheet" />
<link href="<c:url value="/resources/css/icheck/green.css"/>?v=${version}"
	rel="stylesheet" />
<link href="<c:url value="/resources/css/menu.css"/>?v=${version}" rel="stylesheet" />
<link
	href="<c:url value="/resources/css/fonts/css/font-awesome.min.css"/>?v=${version}"
	rel="stylesheet">
<link href="<c:url value="/resources/css/dialogbox.css"/>?v=${version}"
	rel="stylesheet">

<link
	href="<c:url value="/resources/vendor/DataTables/datatables.min.css"/>?v=${version}"
	rel="stylesheet">

<link href="<c:url value="/resources/css/bootstrap-select.min.css"/>?v=${version}"
	rel="stylesheet" />
<link href="<c:url value="/resources/css/jquery-ui.css"/>?v=${version}"
	rel="stylesheet" />
<link href="<c:url value="/resources/css/schule.css"/>?v=${version}" rel="stylesheet">

<script src="<c:url value="/resources/js/jquery.min.js"/>?v=${version}"></script>
<script src="<c:url value="/resources/js/jquery-ui.js" />?v=${version}"></script>
<script src="<c:url value="/resources/js/jquery.freezeheader.js"/>?v=${version}"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>?v=${version}"></script>
<script src="<c:url value="/resources/js/bootstrap-select.min.js"/>?v=${version}"></script>
<script src="<c:url value="/resources/js/dialogbox.js"/>?v=${version}"></script>
<script src="<c:url value="/resources/vendor/DataTables/datatables.min.js"/>?v=${version}"></script>
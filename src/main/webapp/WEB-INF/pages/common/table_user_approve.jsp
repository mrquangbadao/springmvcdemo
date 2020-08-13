<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table class="table table-origin">
	<thead class="">
		<tr>
			<th class="text-left count" colspan="2" style="width: 15%">承認ステップ</th>
			<th class="text-left" style="width: 15%">部署名</th>
			<th class="text-left" style="width: 10%">承認予定者</th>
			<th class="text-left" style="width: 10%">承認者</th>
			<th class="text-left" style="width: 30%">コメント</th>
			<th class="text-left" style="width: 15%">承認日時</th>
		</tr>
	</thead>
	<tbody id='' class="">
		<!--  -->
		<tr>
			<td rowspan="3">申請部門</td>
			<td>申請</td>
			<td><c:out value="${userApproveInfo.userCreate.departName}" /></td>
			<td><c:out value="${userApproveInfo.userCreate.lastName.concat(userApproveInfo.userCreate.firstName)}" /></td>
			<td><c:out value="${userApproveInfo.userCreate.lastName.concat(userApproveInfo.userCreate.firstName)}" /></td>
			<td><c:out value="${requestScope.registerComment }" /></td>
			<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${requestScope.dateApplicationActual}" /></td>
		</tr>
		<tr>
			<td>一次承認</td>
			<td>${userApproveInfo.cLeaderPlan.departName}</td>
			<td>${userApproveInfo.cLeaderPlan.lastName}${userApproveInfo.cLeaderPlan.firstName}</td>
			<td>${userApproveInfo.cLeader.lastName}${userApproveInfo.cLeader.firstName}</td>
			<td><c:out value="${requestScope.cLeaderComment }" /></td>
			<td><fmt:formatDate pattern = "yyyy/MM/dd HH:mm" value="${sessionScope.basicInfo.test.CLeaderCreateDate}"/></td>
		</tr>	
		<tr>
			<td>二次承認</td>
			<td>${userApproveInfo.cMangagerPlan.departName}</td>
			<td>${userApproveInfo.cMangagerPlan.lastName}${userApproveInfo.cMangagerPlan.firstName} </td>
			<td>${userApproveInfo.cMangager.lastName}${userApproveInfo.cMangager.firstName} </td>
			<td><c:out value="${requestScope.cManagerComment }" /></td>
			<td><fmt:formatDate pattern = "yyyy/MM/dd HH:mm" value="${sessionScope.basicInfo.test.CManagerCreateDate}"/></td>
		</tr>
		<!--  -->
		<tr>
			<td rowspan="4">富津試験G</td>
			<td>受付</td>
			<td>${userApproveInfo.fReceiverPlan.departName}</td>
			<td>${userApproveInfo.fReceiverPlan.lastName}${userApproveInfo.fReceiverPlan.firstName} </td>
			<td>${userApproveInfo.fReceiver.lastName}${userApproveInfo.fReceiver.firstName} </td>
			<td><c:out value="${requestScope.fReceiverComment }" /></td>
			<td><fmt:formatDate pattern = "yyyy/MM/dd HH:mm" value="${sessionScope.basicInfo.test.FReceiverCreateDate}"/></td>
		</tr>
		<tr>
			<td>確認</td>
			<td>${userApproveInfo.fConfirmPlan.departName}</td>
			<td>${userApproveInfo.fConfirmPlan.lastName}${userApproveInfo.fConfirmPlan.firstName} </td>
			<td>${userApproveInfo.fConfirm.lastName}${userApproveInfo.fConfirm.firstName} </td>
			<td><c:out value="${requestScope.fConfirmComment }" /></td>
			<td><fmt:formatDate pattern = "yyyy/MM/dd HH:mm" value="${sessionScope.basicInfo.test.FConfirmCreateDate}"/></td>
		</tr>
		<tr>
			<td>承認</td>
			<td>${userApproveInfo.fLeaderPlan.departName}</td>
			<td>${userApproveInfo.fLeaderPlan.lastName}${userApproveInfo.fLeaderPlan.firstName} </td>
			<td>${userApproveInfo.fLeader.lastName}${userApproveInfo.fLeader.firstName} </td>
			<td><c:out value="${requestScope.fLeaderComment }" /></td>
			<td><fmt:formatDate pattern = "yyyy/MM/dd HH:mm" value="${sessionScope.basicInfo.test.FLeaderCreateDate}"/></td>
		</tr>
		<tr>
			<td>最終承認</td>
			<td>${userApproveInfo.fManagerPlan.departName}</td>
			<td>${userApproveInfo.fManagerPlan.lastName}${userApproveInfo.fManagerPlan.firstName} </td>
			<td>${userApproveInfo.fManager.lastName}${userApproveInfo.fManager.firstName} </td>
			<td><c:out value="${requestScope.fManagerComment }" /></td>
			<td><fmt:formatDate pattern = "yyyy/MM/dd HH:mm" value="${sessionScope.basicInfo.test.FManagerCreateDate}"/></td>	
		</tr>
	</tbody>
</table>
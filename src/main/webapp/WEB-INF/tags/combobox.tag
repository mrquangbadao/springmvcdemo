<%@ attribute name="items" type="java.util.List" required="true"%>
<%@ attribute name="selectedValue" type="java.lang.String" required="false"%>
<%@ attribute name="comboJquery" type="java.lang.Boolean" required="false"%>
<%@ attribute name="disabled" type="java.lang.Boolean" required="false"%>
<%@ attribute name="tagId" type="java.lang.String" required="true"%>
<%@ attribute name="firstEmpty" type="java.lang.Boolean" required="false"%>
<%@ attribute name="emptyLabel" type="java.lang.String" required="false"%>
<%@ attribute name="tagName" type="java.lang.String" required="true"%>
<%@ attribute name="tagClass" type="java.lang.String" required="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="comboblock">
	<select id="${tagId}" name="${tagName}" class="${tagClass}">
		<c:if test="${not empty firstEmpty}">
			<c:if test="${firstEmpty}">
				<c:if test="${not empty emptyLabel}">
					<option value=" ">${emptyLabel}</option>
				</c:if>
				<c:if test="${empty emptyLabel}">
					<option value=" "></option>
				</c:if>
			</c:if>
		</c:if>
		<c:if test="${not empty items}">
			<c:forEach var="item" items="${items}">
				<c:if test="${not empty selectedValue}">
					<c:if test="${item.value eq selectedValue}">
						<option value="${item.value}" selected>${item.name}</option>
					</c:if>
					<c:if test="${item.value ne selectedValue}">
						<option value="${item.value}">${item.name}</option>
					</c:if>
				</c:if>
				<c:if test="${empty selectedValue}">
					<option value="${item.value}">${item.name}</option>
				</c:if>
			</c:forEach>
		</c:if>
	</select>
</div>
<c:if test="${not empty comboJquery}">
	<c:if test="${comboJquery}">
		<script type="text/javascript">
			$(document).ready(function() {
				var disabled = false;
				<c:if test="${not empty disabled}">
				<c:if test="${disabled}">
				disabled = true;
				</c:if>
				</c:if>
				$('#${tagId}').scombobox({
					disabled : disabled
				});
			});
		</script>
	</c:if>
</c:if>
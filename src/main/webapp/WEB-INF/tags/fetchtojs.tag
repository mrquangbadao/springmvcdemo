<%@ attribute name="items" type="java.util.List" required="true"%>
<%@ attribute name="jsVar" type="java.lang.String" required="true"%>
<%@ attribute name="isNumber" type="java.lang.Boolean" required="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	if (!${jsVar}) {
		${jsVar} = [];
	}
	<c:if test="${not empty items}">
		<c:forEach var="item" items="${items}">
			<c:if test="${not empty isNumber}">
				<c:if test="${isNumber}">
					${jsVar}.push(${item});
				</c:if>
				<c:if test="${isNumber ne true}">
					${jsVar}.push('${item}');
				</c:if>
			</c:if>
			<c:if test="${empty isNumber}">
				${jsVar}.push('${item}');
			</c:if>
		</c:forEach>
	</c:if>
</script>
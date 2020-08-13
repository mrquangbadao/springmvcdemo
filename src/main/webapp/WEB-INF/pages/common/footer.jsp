<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="cTags"%>
<%@taglib uri="/WEB-INF/coretags/coreTags.tld" prefix="mTags"%>
<%@taglib uri="/WEB-INF/coretags/utilTags.tld" prefix="util"%>

<c:set var="footerFileName" value="common/footer_${fileName}.jsp" />

<util:fileCheck check="exist" file="${footerFileName}">
	<jsp:include page="../${footerFileName}" flush="true" />
</util:fileCheck>

</div>
</div>
</body>
</html>
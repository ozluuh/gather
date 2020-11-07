<%@ attribute name="icon" required="true" %>
<%@ attribute name="name" required="true" %>
<%@ attribute name="url" required="true" %>
<%@ attribute name="active" required="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/utils" prefix="util" %>

<c:choose>
	<c:when test="${active eq 'true'}">
		<a
			href="<c:url value='${url}' />"
			class="nav-link d-flex align-items-center justify-content-center justify-content-md-between active"
			tabindex="-1"
			role="button"
			aria-disabled="true"
		>
			<span class="collapse mr-4 text--md show--md">${name}</span>
			<util:icon name="${icon}" />
		</a>
	</c:when>
	<c:otherwise>
		<a
			href="<c:url value='${url}' />"
			class="nav-link d-flex align-items-center justify-content-center justify-content-md-between bg-secondary text-white"
			role="button"
		>
			<span class="collapse mr-4 text--md show--md">${name}</span>
			<util:icon name="${icon}" />
		</a>
	</c:otherwise>
</c:choose>
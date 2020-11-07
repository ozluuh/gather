<%@attribute name="name" required="true" %>
<%@attribute name="size" required="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<svg
	class="bi text--md"
	width="1em" 
	height="1em" 
	fill="currentColor"
>
	<use xlink:href="<c:url value='/assets/icon/bootstrap-icons.svg#${name}' />" />
</svg>
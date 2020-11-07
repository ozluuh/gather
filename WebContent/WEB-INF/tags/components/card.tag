<%@attribute name="title" required="true" %>
<%@attribute name="status" required="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form action="<c:url value='/meet/update' />" autocomplete="off">
	<div class="card w--auto shadow">
		<div class="card-header py-3 d-flex justify-content-between">
			<h6 class="m-0 font-weight-bold text-primary">${title}</h6>
			<c:if test="${not empty status}">
				<span class="text-primary">
					<c:choose>
						<c:when test="${status eq 'P'}">Pendente</c:when>
						<c:otherwise>Concluída</c:otherwise>
					</c:choose>	
				</span>
			</c:if>
		</div>
		
		<div class="card-body">
			<jsp:doBody />
		</div>
		<div class="card-footer text-right py-3">
			<button class="btn btn-primary">
				<c:choose>
					<c:when test="${usuario.acesso.codigo eq 3}">Enviar</c:when>
					<c:otherwise>Encerrar Reunião</c:otherwise>
				</c:choose>
			</button>
		</div>
	</div>
</form>
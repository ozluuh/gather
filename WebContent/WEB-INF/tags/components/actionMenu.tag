<%@ tag body-content="empty" import="br.com.gather.bean.Funcionario" %>
<%@ attribute name="usuario" required="true" type="br.com.gather.bean.Funcionario" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="appController" value="/app" />

<a class="dropdown-item collapse show--sm" href="${appController}">Dashboard</a>
<c:if test="${usuario.acesso.codigo eq 1}">
	<a class="dropdown-item" href="${appController}/department">Departamentos</a>
</c:if>
<c:if test="${usuario.acesso.codigo eq 2}">
	<a class="dropdown-item" href="${appController}/meet">Nova Reunião</a>
</c:if>
<c:if test="${usuario.acesso.codigo ne 3}">
	<a class="dropdown-item" href="${appController}/employee">Funcionários</a>
	<div class="dropdown-divider"></div>
</c:if>

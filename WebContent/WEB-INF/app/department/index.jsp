<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/template" prefix="template"%>
<%@ taglib tagdir="/WEB-INF/tags/components" prefix="component"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/utils" %>

<template:user title="Departamentos">
	
	<jsp:body>
		<c:if test="${not empty mensagem}">
			<h1>${mensagem}</h1>
		</c:if>
		<div class="d-block text-right mb-1">
			<a href="<c:url value='/department/form' />" class="btn btn-primary">Cadastrar</a>
		</div>
		<div class="overflow-auto">
			<table class="table table-striped">
				<thead class="thead-dark">
					<tr>
						<th scope="col">#</th>
						<th scope="col">Nome</th>
						<th scope="col">Ação</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="departamento" items="${departamentos}" varStatus="id">
						<tr>
							<th scope="row">${id.count}</th>
							<td>${departamento.nome}</td>
							<td>
								<a href="<c:url value='/department/edit?id=${departamento.codigo}' />" class="text-primary">
									<util:icon name="pencil-square" />
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</jsp:body>
</template:user>
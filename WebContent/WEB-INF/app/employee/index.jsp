<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/template" prefix="template"%>
<%@ taglib tagdir="/WEB-INF/tags/components" prefix="component"%>
<%@ taglib tagdir="/WEB-INF/tags/utils" prefix="util"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<template:user title="Funcionários">

	<jsp:body>
		<c:if test="${not empty mensagem}">
			<h1>${mensagem}</h1>
		</c:if>
		<div class="d-block text-right mb-1">
			<a href="<c:url value='/employee/form' />" class="btn btn-primary" role="button">Cadastrar</a>
		</div>
		<div class="overflow-auto">
			<table class="table table-striped">
				<thead class="thead-dark">
					<tr>
						<th scope="col">#</th>
						<th scope="col">CPF/CNPJ</th>
						<th scope="col">Nome</th>
						<th scope="col">Acesso</th>
						<th scope="col">Departamento</th>
						<th scope="col">Email</th>
						<th scope="col">Ativo?</th>
						<th scope="col" colspan="2">Ação</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="funcionario" items="${funcionarios}" varStatus="id">
						<tr>
							<th scope="row">${id.count}</th>
							<td>${funcionario.cpfCnpj}</td>
							<td>${funcionario.nome}</td>
							<td>${funcionario.acesso.descricao}</td>
							<td>${funcionario.departamento.nome}</td>
							<td>${funcionario.email}</td>
							<td>
								<c:choose>
									<c:when test="${funcionario.ativo eq 'true'}">Sim</c:when>
									<c:otherwise>Não</c:otherwise>
								</c:choose>
							</td>
							<td>
								<a href="<c:url value='/profile?id=${funcionario.codigo}' />" class="text-primary" role="button">
									<util:icon name="pencil-square" />
								</a>
							</td>
							<c:if test="${logado.acesso.codigo eq 1}">
								<td>
									<c:set var="classAction" value="${logado.codigo ne funcionario.codigo ? 'show' : ''}" />
									<a href="<c:url value='/employee/delete?id=${funcionario.codigo}' />" class="text-danger collapse ${classAction}" role="button">
										<util:icon name="x-square" />
									</a>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</jsp:body>
</template:user>
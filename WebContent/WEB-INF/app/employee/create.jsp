<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/template" prefix="template"%>
<%@ taglib tagdir="/WEB-INF/tags/components" prefix="component"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<template:user title="Cadastro de Funcionário">

	<jsp:attribute name="extraScripts">
		<script>
			$(document).ready(
				$(document).on("click", "button", function() {
					const action = $(this).data("action");
					
					if(action === "showPass") {
						const target = $($(this).data("target"));
						
						if(target.attr("type") === "password") {
							target.attr("type", "text");
						} else {
							target.attr("type", "password");
						}
					}
				})
			);
		</script>
	</jsp:attribute>
	
	<jsp:body>
		<form class="w--50 mt-4 ml-auto mr-auto" method="POST" action="<c:url value='/employee/create' />" autocomplete="off">
	      
	      <div class="form-group">
	        <div class="input-group">
	          <div class="input-group-prepend">
	            <label class="input-group-text" id="txtEmployeeName">Nome</label>
	          </div>
	          <input 
	          	type="text" 
	          	id="txtEmployeeName" 
	          	name="txtName" 
	          	class="form-control"
	          	required="required" 
	          />
	        </div>
	      </div>
	      
	      <div class="form-group">
	        <div class="input-group">
	          <div class="input-group-prepend">
	            <label class="input-group-text" id="txtEmployeeUser">CPF/CNPJ</label>
	          </div>
	          <input 
	          	type="text" 
	          	id="txtEmployeeUser" 
	          	name="txtUser" 
	          	class="form-control"
	          	required="required" 
	          />
	        </div>
	      </div>
	      
	      <div class="form-group text-right">
	        <div class="input-group">
	          <div class="input-group-prepend">
	            <label for="txtEmployeeMail" class="input-group-text">Email</label>
	          </div>
	          <input 
	          	type="email" 
	          	id="txtEmployeeMail" 
	          	name="txtMail" 
	          	class="form-control"
	          	required="required" 
	          />
	        </div>
	      </div>
	     
	      <div class="form-group text-right">
	        <div class="input-group">
	          <div class="input-group-prepend">
	            <label for="txtEmployeePass" class="input-group-text">Senha</label>
	          </div>
	          <input 
	          	type="password" 
	          	id="txtEmployeePass" 
	          	name="txtPass" 
	          	class="form-control"
	          	required="required" 
	          />
	          <div class="input-group-append">
	          	<button type="button" class="btn btn-outline-secondary" data-target="#txtEmployeePass" data-action="showPass">Show</button>
	          </div>
	        </div>
	      </div>
	      
	      <div class="form-group text-right">
	        <div class="input-group">
	          <div class="input-group-prepend">
	            <label for="optEmployeeDepartment" class="input-group-text">Departamento</label>
	          </div>

	          <select name="optDepartment" id="optEmployeeDepartment" class="custom-select" required="required">
	            <option value="0" selected="selected" hidden="hidden">Selecione a opção</option>
	            <c:if test="${not empty departamentos}">
	            	<c:forEach var="departamento" items="${departamentos}">
	            		<c:choose>
	            			<c:when test="${usuario.acesso.codigo eq 1}">
				            	<option value="${departamento.codigo}">${departamento.nome}</option>
	            			</c:when>
	            			<c:otherwise>
	            				<c:if test="${departamento.codigo eq usuario.departamento.codigo}">
					            	<option value="${departamento.codigo}">${departamento.nome}</option>
	            				</c:if>	            			
	            			</c:otherwise>
	            		</c:choose>
	            	</c:forEach>
	            </c:if>
	          </select>
	        </div>
	      </div>
	      
	      <div class="form-group text-right">
	        <div class="input-group">
	          <div class="input-group-prepend">
	            <label for="optEmployeeAccess" class="input-group-text">Acesso</label>
	          </div>
	          
	          <select name="optAccess" id="optEmployeeAccess" class="custom-select" required="required">
	            <option value="" selected="selected" hidden="hidden">Selecione a opção</option>
	            <c:if test="${not empty acessos}">
	            	<c:forEach var="acesso" items="${acessos}">
	            		<c:choose>
	            			<c:when test="${usuario.acesso.codigo eq 1}">
		           				<option value="${acesso.toString()}">${acesso.descricao}</option>
	            			</c:when>
	            			<c:otherwise>
	            				<c:if test="${acesso.codigo ne 1 and usuario.acesso.codigo ne acesso.codigo}">
			           				<option value="${acesso.toString()}">${acesso.descricao}</option>
	            				</c:if>
	            			</c:otherwise>
	            		</c:choose>
	            	</c:forEach>
	            </c:if>
	          </select>
	        </div>
	      </div>
	      
	      <input type="submit" class="btn btn-primary d-block ml-auto" value="Cadastrar" />
	    </form>
	</jsp:body>
</template:user>
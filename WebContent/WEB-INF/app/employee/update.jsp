<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/template" prefix="template"%>
<%@ taglib tagdir="/WEB-INF/tags/components" prefix="component"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<template:user title="Perfil">

	<jsp:attribute name="extraScripts">
		<script>
			$(document).ready(
				usrActiveEl = $("select#optEmployeeActive"),
				usrAccessEl = $("select#optEmployeeAccess"),
				usrDepartmentEl = $("select#optEmployeeDepartment"),
				
				usrActive = "${usuario.ativo}" === "true" ? 1 : 0,
				usrAccess = "${usuario.acesso.toString()}",
				usrDepartment = "${usuario.departamento.codigo}",
						
				$(usrActiveEl).val(usrActive),
				$(usrActiveEl).find("option[value=" + usrActive + "]").attr("selected", true),
				
				$(usrAccessEl).val(usrAccess),
				$(usrAccessEl).find("option[value=" + usrAccess + "]").attr("selected", true),
				
				$(usrDepartmentEl).val(usrDepartment),
				$(usrDepartmentEl).find("option[value=" + usrDepartment + "]").attr("selected", true),
				
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
		<form class="w--50 mt-4 ml-auto mr-auto" method="POST" action="<c:url value='/employee/update' />" autocomplete="off">
		<input type="hidden" name="codUser" readonly="readonly" value="${usuario.codigo}" />
	      <div class="form-group">
	        <div class="input-group">
	          <div class="input-group-prepend">
	            <label class="input-group-text" id="txtEmployeeUser">CPF/CNPJ</label>
	          </div>
	          <span class="form-control-plaintext border rounded-right">${usuario.cpfCnpj}</span>
	          <input 
	          	type="hidden" 
	          	id="txtEmployeeUser" 
	          	name="txtUser" 
	          	class="form-control collapse"
	          	required="required"
	          	readonly="readonly"
	          	value="${usuario.cpfCnpj}"
	          />
	        </div>
	      </div>
	      
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
	          	value="${usuario.nome}"
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
	          	value="${usuario.email}"
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
	          	value="${usuario.senha}"
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
	            <c:if test="${not empty departamentos}">
	            	<c:forEach var="departamento" items="${departamentos}">
	            		<c:choose>
	            			<c:when test="${logado.acesso.codigo eq 1}">
				            	<option value="${departamento.codigo}">${departamento.nome}</option>
	            			</c:when>
	            			<c:otherwise>
	            				<c:if test="${departamento.codigo eq usuario.departamento.codigo}">
					            	<option value="${departamento.codigo}" selected="selected">${departamento.nome}</option>
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
	            <c:if test="${not empty acessos}">
	            	<c:forEach var="acesso" items="${acessos}">
	            		<c:choose>
	            			<c:when test="${logado.acesso.codigo eq 1}">
		           				<option value="${acesso.toString()}">${acesso.descricao}</option>
	            			</c:when>
	            			<c:otherwise>
	            				<c:if test="${acesso.codigo ne 1 and usuario.acesso.codigo eq acesso.codigo}">
			           				<option value="${acesso.toString()}">${acesso.descricao}</option>
	            				</c:if>
	            			</c:otherwise>
	            		</c:choose>
	            	</c:forEach>
	            </c:if>
	          </select>
	        </div>
	      </div>
	      
	      <c:set var="className" value="${logado.codigo ne usuario.codigo ? 'show' : ''}"/>
	      <div class="form-group text-right collapse ${className}">
	        <div class="input-group">
	          <div class="input-group-prepend">
	            <label for="optEmployeeActive" class="input-group-text">Ativo?</label>
	          </div>
	          
	          <select name="optActive" id="optEmployeeActive" class="custom-select" required="required">
	        	<option value="0">Não</option>
	   		  	<option value="1">Sim</option>
	          </select>
	        </div>
	      </div>
	      
	      <div class="d-block text-right">
		      <div class="btn-group">
			      <a type="button" class="btn btn-outline-secondary" href="<c:url value='/app' />">Cancelar</a>
			      <input type="submit" class="btn btn-primary" value="Atualizar" />
		      </div>
	      </div>
	    </form>
	</jsp:body>
</template:user>
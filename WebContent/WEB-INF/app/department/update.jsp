<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/template" prefix="template"%>
<%@ taglib tagdir="/WEB-INF/tags/components" prefix="component"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<template:user title="Atualizar Departamento">
	
	<jsp:body>
		<form class="w--50 mt-4 ml-auto mr-auto" method="POST" action="<c:url value='/department/update' />" autocomplete="off">
	      	<input 
		      	type="hidden" 
		      	name="nbrDepartmentCode" 
		      	class="collapse" 
		      	readonly="readonly" 
		      	value="${departamento.codigo}"
		    />
			<div class="form-group">
			  <div class="input-group">
			    <div class="input-group-prepend">
			      <label class="input-group-text" id="txtDepartmentName">Nome</label>
			    </div>
			    <input
			    	type="text" 
			    	id="txtDepartmentName" 
			    	name="txtDepartmentName" 
			    	class="form-control"
			    	placeholder="Nome do departamento" 
			    	required="required"
			    	value="${departamento.nome}"
			    />
			  </div>
			</div>
			
			<input type="submit" class="btn btn-primary d-block ml-auto" value="Atualizar" />
	    </form>
	</jsp:body>
</template:user>
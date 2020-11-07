<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/template" prefix="template"%>
<%@ taglib tagdir="/WEB-INF/tags/components" prefix="component"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<template:user title="Nova Reunião">
	<jsp:attribute name="extraScripts">
		<script src="<c:url value="/assets/script/meet/gather-meet-form.js" />"></script>
		<script src="<c:url value="/assets/script/meet/gather-meet-js-events.js" />"></script>
	</jsp:attribute>

	<jsp:body>
		<form action="<c:url value='/meet/create' />" class="w--50 mt-4 ml-auto mr-auto" autocomplete="off">
	      <div class="form-group">
	        <div class="input-group">
	          <div class="input-group-prepend">
	            <label class="input-group-text" for="meetTitle">Título</label>
	          </div>
	          <input
	            type="text"
	            id="meetTitle"
	            name="txtMeetTitle"
	            class="form-control"
	            aria-label="Título da reunião"
	            aria-describedby="meetTitle"
	            placeholder="Título da Reunião"
	            required="required"
	          />
	        </div>
	      </div>
	      <div class="form-group collapse">
	        <div class="input-group">
	          <div class="input-group-prepend">
	            <label class="input-group-text" for="expirate">Expiração</label>
	          </div>
	          <input
	            type="date"
	            id="expirate"
	            name="dteExpirate"
	            class="form-control"
	            aria-label="Data de Expiração da Reunião"
	            aria-describedby="expirate"
	          />
	        </div>
	      </div>
	      <div class="form-group text-right">
	        <span class="input-group-text w-100 text-center d-block rounded mb-1">Funcionários</span>
	        <div class="employees"></div>
	      </div>
	      <div class="btn-group btn-block">
	        <button type="button"
	          class="btn btn-outline-secondary"
	          data-action="employee"
	          data-target=".employees"
	        >
	          Designar Funcionário
	        </button>
	        <label for="btnSubmit" class="sr-only">Criar Reunião</label>
	        <input type="submit" id="btnSubmit" class="btn btn-primary" value="Criar Reunião" />
	      </div>
	      
	      <!-- DYNAMIC -->
	      <datalist id="relacao-funcionarios" class="collapse">
	      	<c:if test="${not empty funcionarios}">
	      		<c:forEach var="funcionario" items="${funcionarios}">
	      			<c:if test="${funcionario.acesso.codigo eq 3}">
				        <option value="${funcionario.codigo}" label="${funcionario.nome}" />
	      			</c:if>
	      		</c:forEach>
	      	</c:if>
	      </datalist>
	    </form>
	</jsp:body>
</template:user>
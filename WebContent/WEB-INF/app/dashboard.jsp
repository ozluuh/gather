<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="component" tagdir="/WEB-INF/tags/components" %>

<layout:user title="Dashboard">

	<jsp:attribute name="extraScripts">
		<script>
			$(document).ready(
				$(document).on("change", "input[type='checkbox']", function(e){
					const target = $($(this).data("target"));
					
					if(e.target.checked) {
						$(target).attr("value", "C");
					} else {
						$(target).attr("value", "P");
					}
				})
			);
		</script>
	</jsp:attribute>

	<jsp:body>
		<section class="principal">
			<c:if test="${not empty mensagem}">
				<h1>${mensagem}</h1>
			</c:if>
			<div class="row--fluid">
				<c:if test="${not empty logado}">
					
					<c:choose>
						<c:when test="${empty reunioes}">
							<h2 class="text-muted">Sem tarefas no momento ;)</h2>
						</c:when>
						<c:otherwise>
						<c:forEach var="reuniao" items="${reunioes}">
								
								<component:card title="${reuniao.titulo}" status="${reuniao.status}">
									<jsp:body>
										<div class="collapse">
											<input type="hidden" name="nbrMeetCode" readonly="readonly" value="${reuniao.codigo}" />
											<input type="hidden" name="txtMeetTitle" readonly="readonly" value="${reuniao.titulo}" />
											<input type="hidden" name="txtMeetStatus" readonly="readonly" value="${reuniao.status}" />
										</div>
										<ul class="list-group">
											<c:forEach var="tarefa" items="${tarefas}">
												<c:if test="${tarefa.reuniao.codigo eq reuniao.codigo}">
													<li class="list-group-item">
														<div class="collapse">
															<input type="hidden" name="nbrTaskCode" value="${tarefa.codigo}" readonly="readonly" />
															<input type="hidden" id="txtTaskStatus-${reuniao.codigo}-${tarefa.codigo}" name="txtTaskStatus" value="${tarefa.status}" readonly="readonly" />
															<input type="hidden" name="txtTaskTitle" value="${tarefa.titulo}" readonly="readonly" />
															<input type="hidden" name="txtTaskDescription" value="${tarefa.observacao}" readonly="readonly" />
														</div>
														<div class="accordion" id="accordion-${reuniao.codigo}-${tarefa.codigo}">
															<div class="input-group">
																<div class="input-group-prepend">
																	<c:choose>
																		<c:when test="${logado.acesso.codigo eq 3}">
																			<div class="input-group-text">
																				<input type="checkbox" id="chkTaskComplete" data-target="#txtTaskStatus-${reuniao.codigo}-${tarefa.codigo}" />
																			</div>
																		</c:when>
																		<c:otherwise>
																			<span class="input-group-text">${tarefa.status}</span>
																		</c:otherwise>
																	</c:choose>
																</div>
																<span class="form-control text-truncate" title="${tarefa.titulo}">${tarefa.titulo}</span>
																<div class="input-group-append">
																	<button 
																		type="button" class="btn btn-outline-secondary"
																		data-toggle="collapse" 
																		data-target="#accordion-body-${reuniao.codigo}-${tarefa.codigo}" 
																		aria-expanded="false" 
																		aria-controls="accordion-body-${reuniao.codigo}-${tarefa.codigo}"
																	>
																		+Detalhes
																	</button>
																</div>
															</div>
															
															<div class="card-body collapse" 
																data-parent="#accordion-${reuniao.codigo}-${tarefa.codigo}" 
																id="accordion-body-${reuniao.codigo}-${tarefa.codigo}"
															>
																${tarefa.observacao}
															</div>
														</div>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</jsp:body>
								</component:card>
								
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</c:if>
				
				<c:if test="${empty logado}">
					<jsp:forward page="/logout" />
				</c:if>
			</div>
		</section>
		
	</jsp:body>
</layout:user>
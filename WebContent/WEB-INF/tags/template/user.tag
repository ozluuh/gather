<%@attribute name="title" required="title" %>
<%@attribute name="navMenu" fragment="true" %>
<%@attribute name="actMenu" fragment="true" %>
<%@attribute name="extraScripts" fragment="true" %>
<%@attribute name="toast" fragment="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib tagdir="/WEB-INF/tags/components" prefix="component" %>
<%@taglib tagdir="/WEB-INF/tags/utils" prefix="util" %>
<c:set var="siteName" value="Gather"/>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8" />
		<meta
			name="viewport"
			content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
		/>
		<title>${title} | ${siteName}</title>
		<!-- StyleSheet -->
		<link
			rel="stylesheet"
			href="<c:url value='/assets/style/bootstrap-4.5.2.min.css' />"
		/>
		<link rel="stylesheet" href="<c:url value='/assets/style/main.css' />" />
		<!-- Favicon -->
		<c:url var="favicon" value='/assets/image/favicon' />
		<link
			rel="apple-touch-icon"
			sizes="180x180"
			href="${favicon}/apple-touch-icon.png"
		/>
		<link
			rel="icon"
			type="image/png"
			sizes="32x32"
			href="${favicon}/favicon-32x32.png"
		/>
		<link
			rel="icon"
			type="image/png"
			sizes="16x16"
			href="${favicon}/favicon-16x16.png"
		/>
		<link
			rel="manifest"
			href="${favicon}/site.webmanifest"
		/>
		<link rel="icon" href="${favicons}/favicon.ico" />
		<meta
			name="msapplication-config"
			content="${favicon}/browserconfig.xml"
		/>
		<meta name="msapplication-TileColor" content="#f5f5f5" />
		<meta name="theme-color" content="#f5f5f5" />
	</head>
	<body>
		<div class="vh-100 overflow-hidden" id="root">
			<div class="d-flex flex-md-row h-100">
				<!-- Navigation -->
				<div
					class="fixed-bottom position-md-static bg-dark text-light h--100 collapse show--md"
					role="navigation"
				>
					<ul class="nav nav-pills nav-fill flex-md-column">
						<li class="nav-item title h2 collapse show--md">
							${siteName}
						</li>
						<li class="nav-item m-1">
							<component:menuItem url="/app" name="Dashboard" icon="columns-gap" active="true" />
						</li>
						<c:if test="${navMenu ne null}">
							<jsp:invoke fragment="navMenu" />
						</c:if>
					</ul>
				</div>

				<main class="w-100 h-100">
					<!-- Topbar -->
					<div class="topbar navbar bg-dark text-light h--topbar">
						<h2>${title}</h2>

						<div class="d-flex align-items-center">
							<small class="text-muted mr-2">${logado.nome}</small>
							<div class="dropdown">
								<button
									type="button"
									class="btn btn-secondary"
									id="dropdownMenuOffset"
									data-toggle="dropdown"
									aria-haspopup="true"
									aria-expanded="false"
								>
									<util:icon name="justify" />
								</button>
								<div
									class="dropdown-menu dropdown-menu-right"
									aria-labelledby="dropdownMenuOffset"
								>
									<c:if test="${not empty actMenu}">
										<jsp:invoke fragment="actMenu" />
									</c:if>
									<component:actionMenu usuario="${logado}" />
									<a class="dropdown-item" href="<c:url value='/profile' />">Editar Perfil</a>
									<a class="dropdown-item" href="<c:url value='/logout' />">Sair</a>
								</div>
							</div>
						</div>
					</div>

					<div class="children container-fluid d-flex flex-column justify-content-md-between overflow-auto pt-3 h--content">
						<div class="children--content mb-5">
							<jsp:doBody />
						</div>

						<footer class="pb-5 pb-md-4">
							<div class="copyright text-center text-muted">
								<span>
									2020 &copy; Todos os direitos reservados.
									<br />
									Software feito e distribu&iacute;do por	Go Code
								</span>
							</div>
						</footer>
					</div>
					
					<div class="toast--area ml-auto">
						<c:if test="${not empty toast}">
			            	<jsp:invoke fragment="toast" />
						</c:if>
					</div>
				</main>
			</div>
		</div>

		<script src="<c:url value='/assets/script/jquery-3.5.1.slim.min.js' />"></script>
		<script src="<c:url value='/assets/script/bootstrap-4.5.2.bundle.min.js' />"></script>
		<c:if test="${not empty extraScripts}">
			<jsp:invoke fragment="extraScripts" />
		</c:if>
	</body>
</html>

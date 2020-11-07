<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="style" value="/assets/style" />
<c:url var="favicons" value="/assets/image/favicon" />
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8" />
		<meta
			name="viewport"
			content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
		/>
		<title>Login | Gather</title>
		<link
			rel="stylesheet"
			href="${style}/bootstrap-4.5.2.min.css"
		/>
		<link rel="stylesheet" href="${style}/main.css" />
		<!-- Favicons -->
		<link
			rel="apple-touch-icon"
			sizes="180x180"
			href="${favicons}/apple-touch-icon.png"
		/>
		<link
			rel="icon"
			type="image/png"
			sizes="32x32"
			href="${favicons}/favicon-32x32.png"
		/>
		<link
			rel="icon"
			type="image/png"
			sizes="16x16"
			href="${favicons}/favicon-16x16.png"
		/>
		<link
			rel="manifest"
			href="${favicons}/site.webmanifest"
		/>
		<link rel="icon" href="${favicons}/favicon.ico" />
		<meta
			name="msapplication-config"
			content="${favicons}/browserconfig.xml"
		/>
		<meta name="msapplication-TileColor" content="#f5f5f5" />
		<meta name="theme-color" content="#f5f5f5" />
	</head>
	
	<body>
		<div id="root">
			<div class="d-flex wrapper login--wrapper">
				<div
					class="page-content--wrapper d-flex flex-column justify-content-between text-center">
					<div class="page-content mt-auto mb-auto">
						<form action="<c:url value='login' />" method="POST" class="form--signin ml-auto mr-auto" autocomplete="off">
							<h1 class="h3 mb-3 font-weight-normal">Realize o acesso</h1>
							<div class="input-group">
								<div class="input-group-prepend collapse">
									<label for="inpLogin" class="input-group-text text-uppercase sr-only">CPF/CNPJ</label>
								</div>
								<input type="text" id="inpLogin" name="txtUserLogin" pattern="[0-9]{11,14}" placeholder="CPF/CNPJ" class="form-control rounded" required="required" />
							</div>
							<div class="input-group mb-4">
								<div class="input-group-prepend collapse">
									<label for="inpPass" class="input-group-text sr-only" id="labelPass">Senha</label>
								</div>
								<input type="password" id="inpPass" name="txtUserPass" placeholder="Senha" class="form-control rounded" required="required" />
							</div>
							<input type="submit" value="Acessar" class="btn btn-lg btn-primary btn-block" />
						</form>
					</div>
	
					<footer class="sticky-bottom pb-5 mb-4">
						<div class="container my-auto">
							<div class="copyright text-center my-auto">
								<span class="text-muted">
									2020 &copy; Todos os direitos reservados.<br />Software feito e
									distribu&iacute;do por Go Code
								</span>
							</div>
						</div>
					</footer>
				</div>
			</div>
		</div>
	</body>
</html>

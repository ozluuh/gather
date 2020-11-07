<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8" />
		<meta
			name="viewport"
			content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
		/>
		<title>Login | Gather</title>
		<c:url var="style" value="/assets/style" />
		<link
			rel="stylesheet"
			href="${style}/bootstrap-4.5.2.min.css"
		/>
		<link rel="stylesheet" href="${style}/main.css" />
		<!-- Favicons -->
		<c:url var="favicons" value="/assets/image/favicon" />
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
				<div class="page-content--wrapper d-flex flex-column justify-content-between text-center">
					<div class="page-content mt-auto mb-auto">
						<form action="firstaccess" method="POST" class="form--signin ml-auto mr-auto" autocomplete="off">
			              <h3 class="h3 font-weight-normal">Quase lá</h3>
			              <small class="text-muted d-block mb-3">
			                Parece que você não acessou o sistema anteriormente. Por
			                questões de segurança, pedimos que faça a troca da sua senha
			                temporária.
			              </small>
			
			              <div class="input-group">
			                <div class="input-group-prepend collapse">
			                  <label for="inpPass" class="input-group-text sr-only">Nova Senha</label>
			                </div>
			                <input
			                  type="password"
			                  id="inpPass"
			                  name="txtUserPass"
			                  placeholder="Nova senha"
			                  class="form-control rounded"
			                  required="required"
			                />
			              </div>
			              <div class="form-group mb-4">
			                <div class="input-group-prepend collapse">
			                  <label for="inpPassRepeat" class="input-group-text sr-only">Repita Senha</label>
			                </div>
			                <input
			                  type="password"
			                  id="inpPassRepeat"
			                  name="txtUserPassRepeat"
			                  placeholder="Repetir senha"
			                  class="form-control rounded"
			                  required="required"
			                />
			                <small class="text-danger collapse">Senhas divergem</small>
			              </div>
			              <input type="submit" class="btn btn-lg btn-primary btn-block" value="Acessar" disabled="disabled" />
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
		
		<script src="<c:url value='/assets/script/jquery-3.5.1.slim.min.js' />"></script>
		<script src="<c:url value='/assets/script/bootstrap-4.5.2.bundle.min.js' />"></script>
	    <script>
	    	$(document).ready(
	   			btnAccess = $("input[type=submit]"),
	    			
				$(document).on("keyup", "input#inpPassRepeat", function () {
				  if ($(this).val() !== $("#inpPass").val()) {
				    $(this).next().addClass("show");
				    $(btnAccess).attr("disabled", true);
				  } else {
				    $(this).next().removeClass("show");
				    $(btnAccess).attr("disabled", false);
				  }
				})
	    	);
	    </script>
	</body>
</html>

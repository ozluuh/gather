<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags/landing" prefix="landing" %>
<%@taglib tagdir="/WEB-INF/tags/components" prefix="component" %>
<c:url var="style" value="/assets/style" />
<c:url var="favicons" value="/assets/image/favicon" />
<c:url var="icons" value="/assets/icon" />
<c:url var="images" value="/assets/image/landing" />

<!DOCTYPE html>
<html lang="pt-BR">
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
		<link rel="stylesheet" href="${style}/landing/main.css" />
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
			<div class="landing--wrapper">
				<header>
					<h1>Gather</h1>
					<a href="<c:url value='/app.jsp' />" class="btn btn-primary btn-lg">Login</a>
				</header>

				<!-- MENU -->
				<nav>
					<ul>
						<li>
							<a href="#partner">
								<svg
									class="bi text--xs"
									width="2em"
									height="2em"
									fill="currentColor"
								>
									<use
										xlink:href="${icons}/bootstrap-icons.svg#building"
									/>
								</svg>
							</a>
						</li>
						<li>
							<a href="#problem">
								<svg
									class="bi text--xs"
									width="2em"
									height="2em"
									fill="currentColor"
								>
									<use
										xlink:href="${icons}/bootstrap-icons.svg#puzzle"
									/>
								</svg>
							</a>
						</li>
						<li>
							<a href="#solution">
								<svg
									class="bi text--xs"
									width="2em"
									height="2em"
									fill="currentColor"
								>
									<use
										xlink:href="${icons}/bootstrap-icons.svg#lightning"
									/>
								</svg>
							</a>
						</li>
						<li>
							<a href="#team">
								<svg
									class="bi text--xs"
									width="2em"
									height="2em"
									fill="currentColor"
								>
									<use
										xlink:href="${icons}/bootstrap-icons.svg#people"
									/>
								</svg>
							</a>
						</li>
						<li style="display: none;">
							<a href="#contact">
								<svg
									class="bi text--xs"
									width="2em"
									height="2em"
									fill="currentColor"
								>
									<use
										xlink:href="${icons}/bootstrap-icons.svg#envelope"
									/>
								</svg>
							</a>
						</li>
					</ul>
				</nav>

				<main>
					<!-- PARTNER: B2W -->
					<section id="partner">
						<div class="box">
							<h3>B2W</h3>
							<div class="box--content">
								<div class="box--left-side">
									<p>
										L&iacute;der na Am&eacute;rica Latina, a
										B2W Digital tem um modelo de
										neg&oacute;cio &uacute;nico, multicanal,
										multimarca e multineg&oacute;cio. A
										Companhia atua nas seguintes frentes:
										e-commerce nas marcas Americanas.com,
										Submarino, Shoptime e Sou Barato;
										plataformas de servi&ccedil;os de
										cr&eacute;dito ao consumidor, com o
										Submarino Finance e o Digital Finance;
										plataforma de tecnologia; plataforma de
										log&iacute;stica,
										distribui&ccedil;&atilde;o e atendimento
										ao cliente; e Marketplace.
									</p>
									<div class="cite">
										<p>
											Nosso prop&oacute;sito &eacute;
											conectar pessoas, neg&oacute;cios,
											produtos e servi&ccedil;os [...] por
											isso, queremos estar cada vez mais
											pr&oacute;ximos dos clientes,
											oferencendo a melhor
											experi&ecirc;ncia de compra e
											desenvolvendo os melhores talentos.
										</p>
										<p class="author">B2W Digital</p>
									</div>
								</div>
								<div class="box--right-side image">
									<img
										src="${images}/b2w-logo.png"
										alt="B2W Logo"
									/>
								</div>
							</div>
						</div>
					</section>

					<!-- PROBLEM -->
					<section id="problem">
						<div class="box">
							<h3>Problema</h3>
							<div class="box--content">
								<div class="box--left-side">
									<p class="emphazis">
										Segundo estudo da
										<a
											href="http://www.gallup.com/services/176735/state-global-workplace.aspx"
											target="_blank"
											rel="noopener noreferrer"
											>Gallup</a
										>, apenas 13% dos colaboradores no mundo
										afirmam estar engajados no trabalho.
									</p>
									<p>
										Colaboradores com baixos n&iacute;veis
										de engajamento est&atilde;o mais
										propensos a sa&iacute;rem de seus
										empregos. J&aacute; aqueles com altos
										n&iacute;veis de engajamento possuem uma
										taxa de produtividade muito maior. Como
										forma de alavancar o n&iacute;vel do
										engajamento e produtividade de talentos,
										a B2W Digital entendeu que &eacute;
										necess&aacute;rio olhar para a
										experi&ecirc;ncia do colaborador
										(exployee experience) sob a mesma
										&oacute;tica da experi&ecirc;ncia do
										cliente. Afinal, os seus colaboradores
										tamb&eacute;m s&atilde;o clientes da sua
										empresa.
									</p>
								</div>
								<div class="box--right-side image">
									<img
										src="${images}/ee.jpg"
										alt="Employee Experience"
									/>
								</div>
							</div>
						</div>
					</section>

					<!-- SOLUTION -->
					<section id="solution">
						<div class="box">
							<h3>Solu&ccedil;&atilde;o</h3>
							<div class="box--content">
								<div class="box--left-side">
									<p class="emphazis">
										Gather, uma aplica&ccedil;&atilde;o para
										aumentar a efic&aacute;cia das
										reuni&otilde;es.
									</p>
									<p>
										Uma aplica&ccedil;&atilde;o para o meio
										empresarial, criando uma lista de
										tarefas gerada por um gestor ap&oacute;s
										uma reuni&atilde;o com foco em
										desenvolvimento, a
										aplica&ccedil;&atilde;o tem a
										inten&ccedil;&atilde;o de fortalecer as
										respostas e diminuir o tempo para o
										aprimoramento do colaborador.
										Al&eacute;m do senso de
										responsabilidade, independ&ecirc;ncia e
										meritocracia gerada pela lista de
										tarefas, o colaborador &eacute;
										recompensado fazendo as miss&otilde;es
										de cada reuni&atilde;o, gerando pontos e
										os pontos sendo trocados por itens.
									</p>
								</div>
								<div class="box--right-side image">
									<img
										src="${images}/logo.jpg"
										alt="Gather Logo"
									/>
								</div>
							</div>
						</div>
					</section>

					<!-- TEAM -->
					<section id="team">
						<div class="box">
							<h3>Equipe</h3>
							<div class="box--content">
								<ul>
									<li class="card">
										<landing:TeamMate name="Lu&iacute;s Paulino" occupation="Database Admin" github="ozluuh" />
									</li>

									<li class="card">
										<landing:TeamMate name="Lu&iacute;s Paulino" occupation="Backend Developer" github="ozluuh" />
									</li>
									<li class="card">
										<landing:TeamMate name="Lu&iacute;s Paulino" occupation="Product Owner" github="ozluuh" />
									</li>
									<li class="card">
										<landing:TeamMate name="Lu&iacute;s Paulino" occupation="Intelligence Artificial" github="ozluuh" />
									</li>
									<li class="card">
										<landing:TeamMate name="Lu&iacute;s Paulino" occupation="Backend Developer" github="ozluuh" />
									</li>
									<li class="card">
										<landing:TeamMate name="Lu&iacute;s Paulino" occupation="Frontend Developer" github="ozluuh" />
									</li>
								</ul>
							</div>
						</div>
					</section>

					<!-- CONTACT -->
					<section id="contact" style="display: none;">
						<div class="box">
							<h3>Contato</h3>
							<div class="box--content">
								<div class="box--left-side">
									<form action="contato" method="POST">
										<input type="submit" value="Enviar" />
									</form>
								</div>

								<div class="box--right-side image">
									<img
										src="${images}/contact.jpg"
										alt="Contact"
									/>
								</div>
							</div>
						</div>
					</section>
				</main>

				<!-- CONTAINER -->
			</div>

			<!-- ROOT -->
		</div>
	</body>
</html>

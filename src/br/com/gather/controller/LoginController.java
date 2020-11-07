package br.com.gather.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.gather.bean.Funcionario;
import br.com.gather.bo.FuncionarioBo;
import br.com.gather.connection.ConnectionManager;
import br.com.gather.exception.DadoInvalidoException;
import br.com.gather.exception.EntidadeNaoEncontradaException;

/**
 * Servlet implementation class AccessController
 */
@WebServlet(description = "Controller responsável pelos métodos relacionados ao Login/Logout da aplicação", urlPatterns = {
		"/login", "/logout", "/firstaccess" })
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static Connection conexao;
	private static FuncionarioBo funcionarioBo;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		try {
			conexao = ConnectionManager.getInstance().getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		try {
			funcionarioBo = new FuncionarioBo(conexao);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURI().replaceAll("/Gather", "");

		switch (url) {
		case "/login":
			validate(request, response);
			break;
		case "/logout":
			request.getSession(false).invalidate();
			response.sendRedirect("app.jsp");
			break;
		case "/firstaccess":
			firstAccess(request, response);
			break;
		}
	}

	private void firstAccess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Funcionario funcionario = (Funcionario) request.getSession(false).getAttribute("logado");
		funcionario.setSenha(request.getParameter("txtUserPass"));
		funcionario.setPrimeiroAcesso(false);
		String mensagem = "";

		try {
			funcionarioBo.atualizar(funcionario);
			mensagem = "Usuário ativado com sucesso";
			request.setAttribute("mensagem", mensagem);
			request.getRequestDispatcher("/app").forward(request, response);
		} catch (SQLException | DadoInvalidoException | EntidadeNaoEncontradaException e) {
			mensagem = e.getMessage();
			response.sendRedirect("app.jsp");
			e.printStackTrace();
		}
	}

	private void validate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Funcionario usuario = new Funcionario();
		HttpSession sessao = request.getSession();
		String mensagem = "";

		usuario.setCpfCnpj(request.getParameter("txtUserLogin"));
		usuario.setSenha(request.getParameter("txtUserPass"));

		try {
			usuario = funcionarioBo.pesquisar(usuario);
		} catch (SQLException | DadoInvalidoException e) {
			usuario = null;
			mensagem = e.getMessage();
			e.printStackTrace();
		}

		if (usuario != null) {
			sessao.setAttribute("logado", usuario);

			switch (usuario.isPrimeiroAcesso() ? 1 : 0) {
			case 1:
				request.getRequestDispatcher("/WEB-INF/change-pass.jsp").forward(request, response);
				break;
			default:
				request.getRequestDispatcher("/app").forward(request, response);
				break;
			}
		} else {
			request.setAttribute("mensagem", mensagem);
			response.sendRedirect("app.jsp");
		}
	}

}

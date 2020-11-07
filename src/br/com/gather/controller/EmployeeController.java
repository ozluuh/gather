package br.com.gather.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.gather.bean.Acesso;
import br.com.gather.bean.Departamento;
import br.com.gather.bean.Funcionario;
import br.com.gather.bo.DepartamentoBo;
import br.com.gather.bo.FuncionarioBo;
import br.com.gather.connection.ConnectionManager;
import br.com.gather.exception.DadoInvalidoException;
import br.com.gather.exception.EntidadeNaoEncontradaException;
import br.com.gather.util.StringUtils;

/**
 * Servlet implementation class EmployeeController
 */
@WebServlet(description = "Controller responsável pelos métodos relacionados ao Funcionário", urlPatterns = {
		"/employee", "/employee/create", "/profile", "/employee/update", "/employee/delete", "/employee/form" })
public class EmployeeController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static Connection conexao;
	private static FuncionarioBo funcionarioBo;
	private static DepartamentoBo departamentoBo;
	private static Funcionario usuario;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmployeeController() {
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
		try {
			departamentoBo = new DepartamentoBo(conexao);
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
		usuario = (Funcionario) request.getSession(false).getAttribute("logado");

		switch (url) {
		case "/employee":
			listarFuncionarios(request, response);
			break;
		case "/employee/form":
			formularioCadastroFuncionario(request, response);
			break;
		case "/employee/create":
			cadastrarFuncionario(request, response);
			break;
		case "/profile":
			editarFuncionario(request, response);
			break;
		case "/employee/update":
			atualizarFuncionario(request, response);
			break;
		case "/employee/delete":
			removerFuncionario(request, response);
			break;
		}

	}

	private void formularioCadastroFuncionario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Departamento> departamentos;

		try {
			departamentos = departamentoBo.listar();
		} catch (SQLException e) {
			departamentos = null;
			e.printStackTrace();
		}

		request.setAttribute("usuario", usuario);
		request.setAttribute("departamentos", departamentos);
		request.setAttribute("acessos", Acesso.values());
		request.getRequestDispatcher("/WEB-INF/app/employee/create.jsp").forward(request, response);
	}

	private void listarFuncionarios(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Funcionario> funcionarios = null;

		try {
			switch (usuario.getAcesso().getCodigo()) {
			case 1:
				funcionarios = funcionarioBo.listar();
				break;
			case 2:
				funcionarios = funcionarioBo.listar(usuario);
				break;
			}

		} catch (SQLException e) {
			request.setAttribute("mensagem", e.getMessage());
			e.printStackTrace();
		}

		request.setAttribute("funcionarios", funcionarios);
		request.getRequestDispatcher("/WEB-INF/app/employee/index.jsp").forward(request, response);
	}

	private void removerFuncionario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Funcionario funcionario = null;

		try {
			funcionario = funcionarioBo.pesquisar(id);
			funcionarioBo.deletar(funcionario);
		} catch (NumberFormatException | SQLException | EntidadeNaoEncontradaException | DadoInvalidoException e) {
			request.setAttribute("mensagem", e.getMessage());
			e.printStackTrace();
		}

		request.getRequestDispatcher("/employee").forward(request, response);
	}

	private void editarFuncionario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Departamento> departamentos;
		Funcionario usuario = (Funcionario) request.getSession(false).getAttribute("logado");

		try {
			departamentos = departamentoBo.listar();
		} catch (SQLException e) {
			departamentos = null;
			e.printStackTrace();
		}

		if (request.getParameter("id") != null) {
			try {
				usuario = funcionarioBo.pesquisar(Integer.parseInt(request.getParameter("id")));
			} catch (NumberFormatException | SQLException e) {
				e.printStackTrace();
			}
		}

		request.setAttribute("usuario", usuario);
		request.setAttribute("departamentos", departamentos);
		request.setAttribute("acessos", Acesso.values());

		request.getRequestDispatcher("/WEB-INF/app/employee/update.jsp").forward(request, response);
	}

	private void atualizarFuncionario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sessao = request.getSession(false);
		Funcionario usuarioAtualiza = parseFuncionario(request);
		String mensagem = "";

		try {
			funcionarioBo.atualizar(usuarioAtualiza);
			sessao.setAttribute("logado",
					usuario.getCodigo() != usuarioAtualiza.getCodigo() ? usuario : usuarioAtualiza);
			mensagem = "Dados atualizados com sucesso";
		} catch (SQLException | DadoInvalidoException | EntidadeNaoEncontradaException e) {
			mensagem = e.getMessage();
		}

		request.setAttribute("mensagem", mensagem);
		request.getRequestDispatcher("/app").forward(request, response);
	}

	private void cadastrarFuncionario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Funcionario funcionario = parseFuncionario(request);
		String mensagem = "";

		try {
			funcionarioBo.cadastrar(funcionario);
		} catch (SQLException | DadoInvalidoException e) {
			mensagem = e.getMessage();
		}

		if (funcionario.getCodigo() != 0) {
			mensagem = "Usuário cadastrado com sucesso!";
		}

		request.setAttribute("mensagem", mensagem);
		request.getRequestDispatcher("/app").forward(request, response);
	}

	private Funcionario parseFuncionario(HttpServletRequest request) {
		Funcionario funcionario = new Funcionario();
		Departamento departamento = null;
		Acesso acesso = null;

		acesso = Acesso.valueOf(request.getParameter("optAccess"));

		try {
			departamento = departamentoBo.pesquisar(Integer.parseInt(request.getParameter("optDepartment")));
		} catch (NumberFormatException | SQLException e) {
			departamento = null;
			e.printStackTrace();
		}

		try {
			funcionario.setCodigo(Integer.parseInt(request.getParameter("codUser")));
		} catch (NumberFormatException e) {
			funcionario.setCodigo(0);
		}

		try {
			funcionario.setAtivo(Integer.parseInt(request.getParameter("optActive")) == 1 ? true : false);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		funcionario.setCpfCnpj(request.getParameter("txtUser"));
		funcionario.setNome(StringUtils.decodeUri(request.getParameter("txtName")));
		funcionario.setEmail(request.getParameter("txtMail"));
		funcionario.setSenha(request.getParameter("txtPass"));
		funcionario.setDepartamento(departamento);
		funcionario.setAcesso(acesso);

		return funcionario;
	}

}

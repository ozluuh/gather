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

import br.com.gather.bean.Departamento;
import br.com.gather.bo.DepartamentoBo;
import br.com.gather.connection.ConnectionManager;
import br.com.gather.exception.DadoInvalidoException;
import br.com.gather.exception.EntidadeNaoEncontradaException;

/**
 * Servlet implementation class DepartmentController
 */
@WebServlet(description = "Controller responsável pelos métodos relacionados ao Departamento", urlPatterns = {
		"/department", "/department/create", "/department/form", "/department/update", "/department/edit" })
public class DepartmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static Connection conexao;
	private static DepartamentoBo departamentoBo;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DepartmentController() {
		super();

		try {
			conexao = ConnectionManager.getInstance().getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			departamentoBo = new DepartamentoBo(conexao);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURI().replaceAll("/[Gg]ather", "");

		switch (url) {
		case "/department":
			listarDepartamentos(request, response);
			break;
		case "/department/create":
			cadastrarDepartamento(request, response);
			break;
		case "/department/form":
			formularioCadastrarDepartamento(request, response);
			break;
		case "/department/update":
			atualizarDepartamento(request, response);
			break;
		case "/department/edit":
			editarDepartamento(request, response);
			break;
		}

	}

	private void editarDepartamento(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Departamento departamento;

		try {
			departamento = departamentoBo.pesquisar(Integer.parseInt(request.getParameter("id")));
		} catch (NumberFormatException | SQLException e) {
			departamento = null;
			request.setAttribute("mensagem", e.getMessage());
			e.printStackTrace();
		}

		request.setAttribute("departamento", departamento);
		request.getRequestDispatcher("/WEB-INF/app/department/update.jsp").forward(request, response);
	}

	private void atualizarDepartamento(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Departamento departamento = parseDepartamento(request);
		String mensagem = "";

		try {
			departamentoBo.atualizar(departamento);
			mensagem = "Departamento atualizado com sucesso!";
		} catch (SQLException | DadoInvalidoException | EntidadeNaoEncontradaException e) {
			mensagem = e.getMessage();
			e.printStackTrace();
		}

		request.setAttribute("mensagem", mensagem);
		request.getRequestDispatcher("/app").forward(request, response);
	}

	private void listarDepartamentos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Departamento> departamentos;

		try {
			departamentos = departamentoBo.listar();
		} catch (SQLException e) {
			departamentos = null;
			request.setAttribute("mensagem", e.getMessage());
			e.printStackTrace();
		}

		request.setAttribute("departamentos", departamentos);
		request.getRequestDispatcher("/WEB-INF/app/department/index.jsp").forward(request, response);
	}

	private void cadastrarDepartamento(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Departamento departamento = parseDepartamento(request);
		String mensagem = "";

		try {
			departamentoBo.cadastrar(departamento);
		} catch (DadoInvalidoException | SQLException e) {
			mensagem = e.getMessage();
		}

		if (departamento.getCodigo() != 0) {
			mensagem = "Departamento cadastrado!";
		}

		request.setAttribute("mensagem", mensagem);
		request.getRequestDispatcher("/app").forward(request, response);
	}

	private Departamento parseDepartamento(HttpServletRequest request) {
		Departamento departamento = new Departamento();

		try {
			departamento.setCodigo(Integer.parseInt(request.getParameter("nbrDepartmentCode")));
		} catch (NumberFormatException e) {
			departamento.setCodigo(0);
		}

		departamento.setNome(request.getParameter("txtDepartmentName"));

		return departamento;
	}

	private void formularioCadastrarDepartamento(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/app/department/create.jsp").forward(request, response);
	}

}

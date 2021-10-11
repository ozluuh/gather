package br.com.gather.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gather.bean.Funcionario;
import br.com.gather.bean.Reuniao;
import br.com.gather.bean.Tarefa;
import br.com.gather.bo.ReuniaoBo;
import br.com.gather.bo.TarefaBo;
import br.com.gather.connection.ConnectionManager;

/**
 * Servlet implementation class AppController
 */
@WebServlet(description = "Controller responsável pelo roteamento interno da aplicação", urlPatterns = { "/app",
		"/app/meet", "/app/employee", "/app/department" })
public class RoutesController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static Connection conexao;

	private static TarefaBo tarefaBo;
	private static Funcionario usuario;
	private static ReuniaoBo reuniaoBo;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RoutesController() {
		super();

		try {
			conexao = ConnectionManager.getInstance().getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		try {
			tarefaBo = new TarefaBo(conexao);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		try {
			reuniaoBo = new ReuniaoBo(conexao);
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
		String url = request.getRequestURI().replaceAll("/[Gg]ather", "");
		Funcionario usuarioLogado = (Funcionario) request.getSession(false).getAttribute("logado");

		if (usuario == null || usuario.getCodigo() != usuarioLogado.getCodigo()) {
			usuario = usuarioLogado;
		}

		switch (url) {
		case "/app":
			dashboard(request, response);
			break;
		case "/app/employee":
			request.getRequestDispatcher("/employee").forward(request, response);
			break;
		case "/app/meet":
			request.getRequestDispatcher("/meet/form").forward(request, response);
			break;
		case "/app/department":
			request.getRequestDispatcher("/department").forward(request, response);
			break;
		}
	}

	private void dashboardFuncionario(HttpServletRequest request, HttpServletResponse response) {
		List<Tarefa> tarefas;
		List<Reuniao> reunioes = new ArrayList<Reuniao>();

		try {
			tarefas = tarefaBo.listarPendentes(usuario.getCodigo());
		} catch (SQLException e) {
			tarefas = null;
			e.printStackTrace();
		}

		int reuniaoCadastrada = 0;
		for (Tarefa tarefa : tarefas) {
			if (tarefa.getReuniao().getCodigo() != reuniaoCadastrada) {
				reuniaoCadastrada = tarefa.getReuniao().getCodigo();
				reunioes.add(tarefa.getReuniao());
			}

		}

		request.setAttribute("tarefas", tarefas);
		request.setAttribute("reunioes", reunioes);
	}

	private void dashboardGestor(HttpServletRequest request, HttpServletResponse response) {
		List<Tarefa> tarefas = new ArrayList<Tarefa>();
		List<Reuniao> reunioes;

		try {
			reunioes = reuniaoBo.listarPendentes(usuario.getCodigo());
		} catch (SQLException e) {
			reunioes = null;
			e.printStackTrace();
		}

		for (Reuniao reuniao : reunioes) {
			try {
				for (Tarefa tarefa : tarefaBo.listarPorReuniao(reuniao.getCodigo())) {
					tarefas.add(tarefa);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		request.setAttribute("tarefas", tarefas);
		request.setAttribute("reunioes", reunioes);
	}

	private void dashboard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		switch (usuario.getAcesso()) {
		case GST:
			dashboardGestor(request, response);
			break;
		case FNC:
			dashboardFuncionario(request, response);
			break;
		default:
			break;
		}

		request.getRequestDispatcher("/WEB-INF/app/dashboard.jsp").forward(request, response);

	}

}

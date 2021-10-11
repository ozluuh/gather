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

import br.com.gather.bean.Acesso;
import br.com.gather.bean.Funcionario;
import br.com.gather.bean.Reuniao;
import br.com.gather.bean.Tarefa;
import br.com.gather.bo.FuncionarioBo;
import br.com.gather.bo.ReuniaoBo;
import br.com.gather.bo.TarefaBo;
import br.com.gather.connection.ConnectionManager;
import br.com.gather.exception.DadoInvalidoException;
import br.com.gather.util.StringUtils;

/**
 * Servlet implementation class MeetController
 */
@WebServlet(description = "Controller responsável pelo formulário de Reunião", urlPatterns = { "/meet", "/meet/update",
		"/meet/create", "/meet/form" })
public class MeetController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static Connection conexao;
	private static TarefaBo tarefaBo;
	private static FuncionarioBo funcionarioBo;
	private static Funcionario usuario;
	private static ReuniaoBo reuniaoBo;
	private static Reuniao reuniao;
	private static List<Tarefa> listagemCadastroTarefas;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MeetController() {
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
			funcionarioBo = new FuncionarioBo(conexao);
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
		usuario = (Funcionario) request.getSession(false).getAttribute("logado");

		switch (url) {
		case "/meet":
		case "/meet/form":
			formularioCadastroReuniao(request, response);
			break;
		case "/meet/create":
			criarReuniao(request, response);
			break;
		case "/meet/update":
			atualizarReuniao(request, response);
			break;
		default:
			request.getRequestDispatcher("/app").forward(request, response);
		}
	}

	private void formularioCadastroReuniao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Funcionario> funcionarios = null;

		try {
			funcionarios = funcionarioBo.listar(usuario);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("funcionarios", funcionarios);
		request.getRequestDispatcher("/WEB-INF/app/meet/create.jsp").forward(request, response);
	}

	private void atualizarReuniao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (reuniao == null) {
			reuniao = new Reuniao();
		}

		reuniao.setCodigo(Integer.parseInt(request.getParameter("nbrMeetCode")));
		reuniao.setTitulo(StringUtils.decodeUri(request.getParameter("txtMeetTitle")));
		reuniao.setStatus(request.getParameter("txtMeetStatus"));

		String query = request.getQueryString();

		int position = 0;

		for (int i = 0; i < 3; i++) {
			position = query.indexOf("&", position) + 1;
		}

		String taskQuery = query.substring(position);

		try {
			List<Tarefa> tarefas = atualizarTarefa(request, response, taskQuery);

			if (usuario.getAcesso().equals(Acesso.GST)) {
				reuniao.setGestor(usuario);
				reuniao.setStatus("C");

				for (Tarefa tarefa : tarefas) {
					if (tarefa.getStatus().equals("P")) {
						throw new DadoInvalidoException("Não pode encerrar reunião com tarefas pendentes");
					}
				}

				reuniaoBo.atualizar(reuniao);
			}

		} catch (SQLException | DadoInvalidoException e) {
			request.setAttribute("mensagem", e.getMessage());
			e.printStackTrace();
		}

		request.getRequestDispatcher("/app").forward(request, response);
	}

	private List<Tarefa> atualizarTarefa(HttpServletRequest request, HttpServletResponse response, String taskQuery)
			throws ServletException, IOException, SQLException, DadoInvalidoException {
		String[] parameters = taskQuery.replaceAll("&nbrTaskCode", ",nbrTaskCode").split(",");
		List<Tarefa> tarefas = new ArrayList<Tarefa>();

		for (String parameter : parameters) {
			String[] items = parameter.split("&");
			Tarefa tarefa = new Tarefa();

			for (String item : items) {
				String[] keys = item.split("=");

				switch (keys[0]) {
				case "nbrTaskCode":
					tarefa.setCodigo(Integer.parseInt(keys[1]));
					break;
				case "txtTaskStatus":
					tarefa.setStatus(keys[1]);
					break;
				case "txtTaskTitle":
					tarefa.setTitulo(StringUtils.decodeUri(keys[1]));
					break;
				case "txtTaskDescription":
					try {
						tarefa.setObservacao(StringUtils.decodeUri(keys[1]));
					} catch (ArrayIndexOutOfBoundsException e) {
						tarefa.setObservacao(null);
					}
					break;
				}
			}
			tarefa.setReuniao(reuniao);
			tarefa.setFuncionario(usuario);

			if (usuario.getAcesso().equals(Acesso.FNC)) {
				tarefaBo.atualizar(tarefa);
			}

			tarefas.add(tarefa);
		}

		return tarefas;
	}

	private void criarReuniao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Reuniao reuniao = new Reuniao();
		Funcionario gestor = usuario;
		String query = request.getQueryString();
		int position = 0;

		reuniao.setGestor(gestor);
		reuniao.setTitulo(StringUtils.decodeUri(request.getParameter("txtMeetTitle")));

		for (int i = 0; i < 2; i++) {
			position = query.indexOf("&", position) + 1;
		}

		String[] funcionarios = query.substring(position).replaceAll("&txtEmployeeName", ",txtEmployeeName").split(",");

		for (String item : funcionarios) {
			criarTarefa(request, response, item, reuniao);
		}

		try {
			tarefaBo.cadastrar(listagemCadastroTarefas);
			request.setAttribute("mensagem", "Reunião criada com sucesso!");
		} catch (DadoInvalidoException e) {
			request.setAttribute("mensagem", e.getMessage());
//			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		listagemCadastroTarefas = null;
		request.getRequestDispatcher("/app").forward(request, response);
	}

	private void criarTarefa(HttpServletRequest request, HttpServletResponse response, String item, Reuniao reuniao)
			throws ServletException, IOException {
		Funcionario funcionario;
		int firstTask = item.indexOf("&");

		if (listagemCadastroTarefas == null) {
			listagemCadastroTarefas = new ArrayList<Tarefa>();
		}

		try {
			funcionario = funcionarioBo.pesquisar(Integer.parseInt(item.substring(0, firstTask).split("=")[1]));
		} catch (NumberFormatException | SQLException e) {
			funcionario = null;
			e.printStackTrace();
		}

		String[] subquery = item.substring(firstTask + 1).replaceAll("&txtTaskName", ",txtTaskName").split(",");

		for (String parametro : subquery) {

			Tarefa tarefa = new Tarefa();

			for (String chave : parametro.split("&")) {
				String[] obj = chave.split("=");

				switch (obj[0]) {
				case "txtTaskName":
					tarefa.setTitulo(StringUtils.decodeUri(obj[1]));
					break;
				case "txtTaskDescription":
					try {
						tarefa.setObservacao(StringUtils.decodeUri(obj[1]));
					} catch (ArrayIndexOutOfBoundsException e) {
						tarefa.setObservacao(null);
					}
					break;
				}
			}

			tarefa.setReuniao(reuniao);
			tarefa.setFuncionario(funcionario);

			listagemCadastroTarefas.add(tarefa);
		}

	}

}

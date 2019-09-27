package controller;

import java.io.PrintWriter;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAOException;
import dao.GrupoDaoImpl;
import model.Grupos;

@WebServlet("/gerarGrupos")
public class GerarGrupos extends HttpServlet{
	List<Grupos> listaGrupos = new ArrayList<Grupos>();
	GrupoDaoImpl gp = new GrupoDaoImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String saida = "";
		try {
			listaGrupos = gp.gerarGrupos();
			HttpSession session = request.getSession();
			session.setAttribute("LISTA2", listaGrupos);
		} catch (DAOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
				
		
		}
		
		try {
			response.sendRedirect("./telagrupo.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

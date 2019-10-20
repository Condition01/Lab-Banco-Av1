package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FinalistaDao;
import dao.FinalistaDaoImpl;
import dao.ResultadoDaoImpl;
import model.Resultado;

@WebServlet("/pegarFinalista")
public class PegarFinalista extends HttpServlet {

List<Resultado> listaResultado = new ArrayList<Resultado>();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub	
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FinalistaDao fDao = new FinalistaDaoImpl();
		try {
			listaResultado = fDao.getFinalistas();
			HttpSession session = request.getSession();
			session.setAttribute("LISTAFINALISTA", listaResultado);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			response.sendRedirect("./telafinalistas.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}

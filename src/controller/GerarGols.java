package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GolsDao;
import dao.GolsDaoImpls;
import model.Jogos;

@WebServlet("/gerarGols")
public class GerarGols extends HttpServlet{

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Jogos> jogos;
		String value = req.getParameter("gols");
		
		GolsDao gDao = new GolsDaoImpls();
		

		jogos = gDao.gerarGols(value);
		
		
		HttpSession session = req.getSession();
		session.setAttribute("LISTA3", jogos);
		
		try {
			resp.sendRedirect("./telagols.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

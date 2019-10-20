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

import dao.GolsDao;
import dao.GolsDaoImpls;
import model.Jogos;

@WebServlet("/gerarGols")
public class GerarGols extends HttpServlet {

	List<Jogos> jogos;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Jogos> listaJogos = new ArrayList<Jogos>();
		
		String value = req.getParameter("gols");
		GolsDao gDao = new GolsDaoImpls();

		if (value.equals("todos")) {
			System.out.println("Caiu aqui!");
			jogos = gDao.gerarGolsCompleto();
			System.out.println(jogos.size());
		} else {
			if(jogos.size() == 150) {
				int position = geraPosicao(Integer.parseInt(value));
				for(int i=position;i<position+5;i++) {
					listaJogos.add(jogos.get(i));
				}
			}else {
				listaJogos = gDao.gerarGols(value);
			}
			
			HttpSession session = req.getSession();
			session.setAttribute("LISTA3", listaJogos);

		}
		try {
			resp.sendRedirect("./telagols.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int geraPosicao(int valor) {
		valor = valor * 5 - 5;
		return valor;
	}
}

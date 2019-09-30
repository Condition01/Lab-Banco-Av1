package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAOException;
import dao.JogosDao;
import dao.JogosDaoImpl;
import model.Jogos;

@WebServlet("/gerarJogos")
public class GerarJogos extends HttpServlet{

	private List<Jogos> jogos;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String strJogos = req.getParameter("jogos");
		JogosDao jDao = new JogosDaoImpl();
		
		if(this.jogos == null) {
			try {
				this.jogos = jDao.gerarJogos();
			} catch (DAOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		List<Jogos> listaFiltrada = geraLista(strJogos);
		HttpSession session = req.getSession();
		session.setAttribute("LISTA", listaFiltrada);
		
		try {
			resp.sendRedirect("./telajogos.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Jogos> geraLista(String jogos) {
		List<Jogos> jogosAux = new ArrayList<Jogos>();
		int index = Integer.parseInt(jogos);
		index = index*10-10;
		int contador = 1;
		
		while(contador <= 10) {
			jogosAux.add(this.jogos.get(index));
			contador += 1;
			index+=1;
		}
		return jogosAux;
	}
}

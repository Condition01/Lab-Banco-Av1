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
import dao.ResultadoDaoImpl;
import model.Resultado;

@WebServlet("/pegarResultadosGrupos")
public class PegarResultadosGrupos extends HttpServlet {
	List<Resultado> listaResultado = new ArrayList<Resultado>();
	List<Resultado> listaResultadoR = new ArrayList<Resultado>();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ResultadoDaoImpl rDao = new ResultadoDaoImpl();
		try {
			listaResultado = rDao.getResultadoGrupo();
			listaResultadoR = rDao.getResultadoRebaixado();
			verificaRebaixado();
			HttpSession session = request.getSession();
			session.setAttribute("LISTARESULTADOG", listaResultado);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			response.sendRedirect("./telargrupos.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void verificaRebaixado() {
		for(Resultado r : this.listaResultado) {
			for(Resultado rAux : this.listaResultadoR) {
				if(r.getNome().equals(rAux.getNome())) {
					r.setRebaixado(true);
				}
			}
		}
	}
}

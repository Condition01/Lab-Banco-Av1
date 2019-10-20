package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Jogos;
import model.Resultado;

public class ResultadoDaoImpl implements ResultadosDao {

	@Override
	public List<Resultado> getResultado() {
		List<Resultado> listaResultado = new ArrayList();
		try {
			Connection con = DBUtil.getInstance().getConnection();
			String sql = "select c.grupo, t.nome, c.vitorias, c.derrotas, c.empates, c.gols, c.golsSofridos, "
					+ "c.saldoGols, c.pontos from fn_resultadoPrimeiraFase() c inner join times t "
					+ " on c.codTime = t.id\r\n order by pontos desc,  vitorias desc, gols desc, saldoGols " + "desc ";

			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Resultado r = new Resultado();
				r.setGrupo(rs.getString("grupo"));
				r.setNome(rs.getString("nome"));
				r.setVitorias(rs.getInt("vitorias"));
				r.setEmpates(rs.getInt("empates"));
				r.setDerrotas(rs.getInt("derrotas"));
				r.setGols(rs.getInt("gols"));
				r.setGolsSofridos(rs.getInt("golsSofridos"));
				r.setSaldoGols(rs.getInt("saldoGols"));
				r.setPontos(rs.getInt("pontos"));
				listaResultado.add(r);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return listaResultado;
	}

	@Override
	public List<Resultado> getResultadoGrupo() {
		List<Resultado> listaResultado = new ArrayList();
		try {
			Connection con = DBUtil.getInstance().getConnection();
			String sql = "select c.grupo, t.nome, c.vitorias, c.derrotas, "
					+ "c.empates, c.gols, c.golsSofridos, c.saldoGols, c.pontos from fn_resultadoPrimeiraFase() c "
					+ "inner join times t  on c.codTime = t.id order by grupo, pontos desc, vitorias desc, "
					+ "gols desc, saldoGols desc ";

			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Resultado r = new Resultado();
				r.setGrupo(rs.getString("grupo"));
				r.setNome(rs.getString("nome"));
				r.setVitorias(rs.getInt("vitorias"));
				r.setEmpates(rs.getInt("empates"));
				r.setDerrotas(rs.getInt("derrotas"));
				r.setGols(rs.getInt("gols"));
				r.setGolsSofridos(rs.getInt("golsSofridos"));
				r.setSaldoGols(rs.getInt("saldoGols"));
				r.setPontos(rs.getInt("pontos"));
				listaResultado.add(r);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return listaResultado;
	}

	@Override
	public List<Resultado> getResultadoRebaixado() {
		List<Resultado> listaResultado = new ArrayList();
		try {
			Connection con = DBUtil.getInstance().getConnection();
			String sql = "select top 4 c.grupo, t.nome, c.vitorias, c.derrotas, c.empates, c.gols, "
					+ "c.golsSofridos, c.saldoGols, c.pontos from fn_resultadoPrimeiraFase() c "
					+ "inner join times t  on c.codTime = t.id order by pontos asc,  vitorias"
					+ " desc, gols desc, saldoGols desc ";

			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Resultado r = new Resultado();
				r.setGrupo(rs.getString("grupo"));
				r.setNome(rs.getString("nome"));
				r.setVitorias(rs.getInt("vitorias"));
				r.setEmpates(rs.getInt("empates"));
				r.setDerrotas(rs.getInt("derrotas"));
				r.setGols(rs.getInt("gols"));
				r.setGolsSofridos(rs.getInt("golsSofridos"));
				r.setSaldoGols(rs.getInt("saldoGols"));
				r.setPontos(rs.getInt("pontos"));
				listaResultado.add(r);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return listaResultado;
	}

}

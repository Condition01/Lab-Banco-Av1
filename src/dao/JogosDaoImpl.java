package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Grupos;
import model.Jogos;

public class JogosDaoImpl implements JogosDao{

	@Override
	public List<Jogos> gerarJogos() throws DAOException, SQLException{
		List<Jogos> listaJogos;
		Connection con = DBUtil.getInstance().getConnection();
		String sql = "{call sp_gera_tabela_jogos}";
		CallableStatement cs = con.prepareCall(sql);
		cs.execute();	
		listaJogos = trazerRodada(con);
		cs.close();
		con.close();
		return listaJogos;
	}


	public List<Jogos> trazerRodada(Connection con) throws DAOException, SQLException {
		List<Jogos> listaJogos = new ArrayList<Jogos>();
		String sql = "select * from jogos";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.execute();
		ResultSet rs = ps.getResultSet();
		while(rs.next()) {
			Jogos j = new Jogos();
			j.setId(rs.getInt("id"));
			j.setCodTimeA(rs.getInt("codTimeA"));
			j.setCodTimeB(rs.getInt("codTimeB"));
			j.setGolsTimeA(rs.getInt("golsTimeA"));
			j.setGolsTimeB(rs.getInt("golsTimeB"));
			j.setDataJogo(rs.getDate("dataJogo"));
			listaJogos.add(j);
		}
		ps.close();
		rs.close();
		return listaJogos;
	}

}

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
		String sql = "select t.nome as nome1, t2.nome as nome2, j.golsTimeA, j.golsTimeB, "
				+ "convert(varchar(10),j.dataJogo,103) as dataJogo from jogos j inner join times t "
				+ "on j.codTimeA = t.id inner join times2 t2 on t2.id = j.codTimeB";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.execute();
		ResultSet rs = ps.getResultSet();
		while(rs.next()) {
			Jogos j = new Jogos();
			j.setNomeTimeA(rs.getString("nome1"));
			j.setNomeTimeB(rs.getString("nome2"));
			j.setGolsTimeA(rs.getInt("golsTimeA"));
			j.setGolsTimeB(rs.getInt("golsTimeB"));
			j.setDataJogo(rs.getString("dataJogo"));
			listaJogos.add(j);
		}
		ps.close();
		rs.close();
		return listaJogos;
	}

}

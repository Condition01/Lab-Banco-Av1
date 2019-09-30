package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Jogos;

public class GolsDaoImpls implements GolsDao{

	@Override
	public List<Jogos> gerarGols(String value) {
		List<Jogos> jogos = new ArrayList<Jogos>();
		try {
			Connection con = DBUtil.getInstance().getConnection();
			int valor = Integer.parseInt(value);
			valor = geraPosicao(valor);
			String sql = "{call sp_gerar_gols ?}";
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, valor);
			cs.execute();
			sql ="select t.nome as nome1, t2.nome as nome2, j.golsTimeA, j.golsTimeB, "
					+ "convert(varchar(10),j.dataJogo,103) as dataJogo from jogos j inner join times t "
					+ "on j.codTimeA = t.id inner join times2 t2 on t2.id = j.codTimeB"
					+ " where j.id between ? and ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, valor);
			ps.setInt(2, valor+4);
			ps.execute();
			ResultSet rs = ps.getResultSet();
			while(rs.next()) {
				Jogos j = new Jogos();
				j.setNomeTimeA(rs.getString("nome1"));
				j.setNomeTimeB(rs.getString("nome2"));
				j.setGolsTimeA(rs.getInt("golsTimeA"));
				j.setGolsTimeB(rs.getInt("golsTimeB"));
				j.setDataJogo(rs.getString("dataJogo"));
				jogos.add(j);
			}
			if(jogos.size() != 0) {
				return jogos;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
	
	public int geraPosicao(int valor) {
		valor = valor * 5 - 4;
		return valor;
	}

	
}

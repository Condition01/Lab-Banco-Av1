package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Grupos;



/*	String sql = "{CALL sp_insereproduto(?,?)}";
		CallableStatement cs = c.prepareCall(sql);
		cs.setString(1, p.getNome());
		cs.registerOutParameter(2, Types.VARCHAR);
		cs.execute();
		String saida = cs.getString(2);
		cs.close();
		return saida;*/


public class GrupoDaoImpl implements GrupoDao{

	@Override
	public List<Grupos> gerarGrupos() throws DAOException, SQLException {
		List<Grupos> listaGrupo;
		Connection con = DBUtil.getInstance().getConnection();
		String sql = "{call sp_preenche_grupo}";
		CallableStatement cs = con.prepareCall(sql);
		cs.execute();
		listaGrupo = pegarGrupos(con);
		cs.close();
		con.close();
		return listaGrupo;
	}
	
	public List<Grupos> pegarGrupos(Connection con) throws SQLException {
		List<Grupos> listaGrupo = new ArrayList<Grupos>();
		String sql = "select * from grupos";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.execute();
		ResultSet rs = ps.getResultSet();
		while(rs.next()) {
			Grupos g = new Grupos();
			g.setGrupo(rs.getString("grupo"));
			g.setCodTime(rs.getInt("codTime"));
			listaGrupo.add(g);
		}
		ps.close();
		rs.close();
		return listaGrupo;
	}
}

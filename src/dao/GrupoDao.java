package dao;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import model.Grupos;

public interface GrupoDao {
	List<Grupos> gerarGrupos() throws DAOException, SQLException;
}

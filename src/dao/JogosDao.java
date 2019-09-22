package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import model.Jogos;

public interface JogosDao {
	
	List<Jogos> gerarJogos() throws DAOException, SQLException;
	
}

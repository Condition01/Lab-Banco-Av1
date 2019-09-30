package dao;

import java.util.List;

import model.Jogos;

public interface GolsDao {
	List<Jogos> gerarGols(String value);
}

package dao;

import java.util.List;

import model.Resultado;

public interface ResultadosDao {
	List<Resultado> getResultado(); 
	List<Resultado> getResultadoGrupo(); 
	List<Resultado> getResultadoRebaixado(); 
}

package model;

import java.util.Date;

public class Jogos {

	private String nomeTimeA;
	private String nomeTimeB;
	private int golsTimeA;
	private int golsTimeB;
	private String dataJogo;

	public int getGolsTimeA() {
		return golsTimeA;
	}
	public void setGolsTimeA(int golsTimeA) {
		this.golsTimeA = golsTimeA;
	}
	public int getGolsTimeB() {
		return golsTimeB;
	}
	public void setGolsTimeB(int golsTimeB) {
		this.golsTimeB = golsTimeB;
	}
	public String getNomeTimeA() {
		return nomeTimeA;
	}
	public void setNomeTimeA(String nomeTimeA) {
		this.nomeTimeA = nomeTimeA;
	}
	public String getNomeTimeB() {
		return nomeTimeB;
	}
	public void setNomeTimeB(String nomeTimeB) {
		this.nomeTimeB = nomeTimeB;
	}
	public String getDataJogo() {
		return dataJogo;
	}
	public void setDataJogo(String dataJogo) {
		this.dataJogo = dataJogo;
	}	
	
}

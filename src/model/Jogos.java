package model;

import java.util.Date;

public class Jogos {
	private int id;
	private int codTimeA;
	private int codTimeB;
	private int golsTimeA;
	private int golsTimeB;
	private Date dataJogo;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCodTimeA() {
		return codTimeA;
	}
	public void setCodTimeA(int codTimeA) {
		this.codTimeA = codTimeA;
	}
	public int getCodTimeB() {
		return codTimeB;
	}
	public void setCodTimeB(int codTimeB) {
		this.codTimeB = codTimeB;
	}
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
	public Date getDataJogo() {
		return dataJogo;
	}
	public void setDataJogo(Date dataJogo) {
		this.dataJogo = dataJogo;
	}
	
	
}

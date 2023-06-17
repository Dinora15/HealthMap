package unedMasterJavaModelo;

public class HealthIndicador {

	



	private String indicador_code;
	private String indicador_name;
	
	
	
	public HealthIndicador() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public HealthIndicador(String indicador_code, String indicador_name) {
		
		this.indicador_code = indicador_code;
		this.indicador_name = indicador_name;
		
		
	}



	public String getIndicador_code() {
		return indicador_code;
	}



	public void setIndicador_code(String indicador_code) {
		this.indicador_code = indicador_code;
	}



	public String getIndicador_name() {
		return indicador_name;
	}



	public void setIndicador_name(String indicador_name) {
		this.indicador_name = indicador_name;
	}



	
	@Override
	public String toString() {
		return "HealthIndicador [indicador_code=" + indicador_code + ", indicador_name=" + indicador_name+ "]";
	}
	
	
	
	
	
}

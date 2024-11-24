package master.dto;


import java.time.LocalDate;

public class TourDto {
	
	    private String tourid;
	    private String tournm;
	    private String tplace1;
	    private String tplace2;
	    private String tplace3;
	    private LocalDate startdt;
	    private double price;
		public String getTourid() {
			return tourid;
		}
		public void setTourid(String tourid) {
			this.tourid = tourid;
		}
		public String getTournm() {
			return tournm;
		}
		public void setTournm(String tournm) {
			this.tournm = tournm;
		}
		public String getTplace1() {
			return tplace1;
		}
		public void setTplace1(String tplace1) {
			this.tplace1 = tplace1;
		}
		public String getTplace2() {
			return tplace2;
		}
		public void setTplace2(String tplace2) {
			this.tplace2 = tplace2;
		}
		public String getTplace3() {
			return tplace3;
		}
		public void setTplace3(String tplace3) {
			this.tplace3 = tplace3;
		}
		public LocalDate getStartdt() {
			return startdt;
		}
		public void setStartdt(LocalDate startdt) {
			this.startdt = startdt;
		}
		public double getPrice() {
			return price;
		}
		public void setPrice(double price) {
			this.price = price;
		}
		
}
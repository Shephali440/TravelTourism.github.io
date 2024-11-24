package master.dto;

public class HotelDto {
	
	 // Private fields for the hotel information
    private String hotelid;
    private String hotelname;
    private String tplace;

    // Default constructor
    public HotelDto() {}

	public String getHotelid() {
		return hotelid;
	}

	public void setHotelid(String hotelid) {
		this.hotelid = hotelid;
	}

	public String getHotelname() {
		return hotelname;
	}

	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}

	public String getTplace() {
		return tplace;
	}

	public void setTplace(String tplace) {
		this.tplace = tplace;
	}
    
}

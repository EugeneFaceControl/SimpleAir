package model;

public class Destination {
//	`destination_id` int(11) NOT NULL AUTO_INCREMENT,
//	  `destination_name` varchar(45) DEFAULT NULL,
	private int destinationId;
	private String destinationName;
	private int cost;
	
	public int getDestinationId() {
		return destinationId;
	}
	public void setDestinationId(int destinationId) {
		this.destinationId = destinationId;
	}
	public String getDestinationName() {
		return destinationName;
	}
	public void setDestinationName(String destinationName) {
		this.destinationName = destinationName;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	
}

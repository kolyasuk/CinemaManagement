package iful.edu.cinema.objects;

import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

public class Hall {

	private int id;

	@Size(min = 3, max = 20, message = "Name must be between {min} and {max}.")
	private String name;

	@Min(value = 0, message = "Select floor, please.")
	private int floor;

	@Size(min = 15, message = "Description should be longer {min}.")
	private String description;

	@Min(value = 1, message = "Select cinema, please.")
	private int cinema_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getCinema_id() {
		return cinema_id;
	}

	public void setCinema_id(int cinema_id) {
		this.cinema_id = cinema_id;
	}

}

package iful.edu.cinema.objects;

import javax.validation.constraints.Size;

public class Cinema {

	private int id;

	@Size(min = 3, max = 20, message = "Name must be between {min} and {max}.")
	private String name;

	@Size(min = 25, max = 65, message = "Please input correct address like: *вул. Назва Вулиці, номер будинку, місто*")
	private String address;

	@Size(min = 15, max = 250, message = "Description must be between {min} and {max}.")
	private String description;

	private byte[] image;

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

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}

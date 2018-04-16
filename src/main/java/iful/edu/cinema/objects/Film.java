package iful.edu.cinema.objects;

public class Film {

	private int id;

	private String name;

	// @Min(value = 1895, message = "Input correct year")
	private int year;

	// @Size(min = 2, message = "Input correct director name")
	private String director;

	/*
	 * @Size(min = 2, message = "Input correct country")
	 * 
	 * @Pattern(regexp = "^[A-Za-zА-Яа-яЇїІі]*$", message =
	 * "Must match only letters")
	 */
	private String country;

	// @Size(min = 15, message = "Minimum size is 15")
	private String description;

	/*
	 * @Size(min = 8, message = "Input correct length")
	 * 
	 * @Pattern(regexp = "^[0-9:0-9:0-9]*$", message = "Input like: 01:45:00")
	 */
	private String movie_length;

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

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getMovie_length() {
		return movie_length;
	}

	public void setMovie_length(String movie_length) {
		this.movie_length = movie_length;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}

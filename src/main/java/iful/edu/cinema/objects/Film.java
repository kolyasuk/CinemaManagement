package iful.edu.cinema.objects;

public class Film {

	private int id;

	private String name;

	private int year;

	private String genre;

	private String director;

	private String country;

	private String description;

	private String movie_length;

	private String trailer_URL;

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

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
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

	public String getTrailer_URL() {
		return trailer_URL;
	}

	public void setTrailer_URL(String trailer_URL) {
		this.trailer_URL = trailer_URL;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		return this.toString().equals(obj.toString());
	}

	@Override
	public String toString() {
		String imageData = image != null ? image.toString() : "null";
		String result = "";
		result += "id=" + id + ", name=" + String.valueOf(name) + ", country=" + String.valueOf(country) + ", description=" + String.valueOf(description) + ", director=" + String.valueOf(director) + ", genre=" + String.valueOf(genre)
				+ ", movie_length=" + String.valueOf(movie_length) + ", trailer_URL=" + String.valueOf(trailer_URL) + ", year=" + String.valueOf(year) + ", image=" + imageData;
		return result;
	}

}

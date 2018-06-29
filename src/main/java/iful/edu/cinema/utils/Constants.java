package iful.edu.cinema.utils;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class Constants {

	public static final SimpleDateFormat DATE_FORMATTER = new SimpleDateFormat("yyyy-MM-dd");
	public static final Date CURRENT_DATE = Date.valueOf(DATE_FORMATTER.format(new java.util.Date()));
	public static final String CURRENT_TIME = "08:00";
	public static final int LUMERE_ID = 1;
	public static final int KOSMOS_ID = 4;

}

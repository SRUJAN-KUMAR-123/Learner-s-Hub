package profile;
import java.sql.*;
import java.util.*;

public class Course {

	private String crs_name, crs_desc;
	private List<List<String>> instructor_names= new ArrayList<List<String>>();
	private int crs_id;

	public String getCrs_name() {
		return crs_name;
	}

	public void setCrs_name(String crs_name) {
		this.crs_name = crs_name;
	}

	public String getCrs_desc() {
		return crs_desc;
	}

	public void setCrs_desc(String crs_desc) {
		this.crs_desc = crs_desc;
	}

	public int getCrs_id() {
		return crs_id;
	}

	public void setCrs_id(int crs_id) {
		this.crs_id = crs_id;
	}

	public Course() {
		super();
	}

	public List<List<String>> getInstructor_names() {
		return instructor_names;
	}

	public void setInstructor_names(List<List<String>> instructor_names) {
		this.instructor_names = instructor_names;
	}

}


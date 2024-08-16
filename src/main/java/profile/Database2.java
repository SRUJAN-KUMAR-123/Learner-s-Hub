package profile;

import java.sql.*;
import java.util.*;

public class Database2 {

	String url, uname, pass, instructor, db;
	Connection con;
	String query;
	Statement st;
	PreparedStatement pt;
	
	public Database2() {
		super();
		this.db = "user_registration";
		this.url = "jdbc:mysql://localhost:1503/" + this.db;
		this.uname = "root";
		this.pass = "Srujan@123098";		
	}
	
	public void connection() throws SQLException {
		con = DriverManager.getConnection(url, uname, pass);
	}
	
	public Course read(String crs_id) throws SQLException, ClassNotFoundException {
		
		//load the drive
		//create connection
		this.connection();
		
		//write query
		query = "select * from courses where crs_id='"+crs_id +"'";
		
		//create statement
		st = con.createStatement();
		
		//execute statement
		ResultSet result = st.executeQuery(query);
		Course course = new Course();
		//process the result(select)
		while(result.next()) {
			course.setCrs_id (result.getInt(1));
			course.setCrs_name(result.getString(2));
			course.setCrs_desc(result.getString(3));
		}
		//close the connection
		con.close();
		return course;
	}
	
	public List<Course> read_all() throws SQLException, ClassNotFoundException {

		List<Course> courses = new ArrayList<Course>();

		this.connection();

		query = "select * from courses";
		st = con.createStatement();

		ResultSet result = st.executeQuery(query);
		while (result.next()) {
			Course course = new Course();
			course.setCrs_id (result.getInt(1));
			course.setCrs_name(result.getString(2));
			course.setCrs_desc(result.getString(3));
			courses.add(course);
		}

		return courses;
	}
	
	public int insert(Course course) throws SQLException {
		//load the drive
		//create connection
		this.connection();
		
		//write query
		this.query = "insert into courses (crs_name,crs_desc) values(?, ?)";
		
		//create prepared statement
		pt = con.prepareStatement(query);
		
		pt.setString(1, course.getCrs_name());
		pt.setString(2, course.getCrs_desc());
		
		//execute pr statement
		int row = pt.executeUpdate();
		//close connection
		
		return row;
	}
	
	public int delete(Integer crs_id) throws SQLException {
		//load the drive
		//create connection
		this.connection();
		
		
		
		//delete enrollments also
		this.query = "delete from enrollments where course_id=?" ;
		pt = con.prepareStatement(query);
		pt.setInt(1, crs_id);
		int row = pt.executeUpdate();
		
		//write query
		this.query = "delete from courses where crs_id=?" ;
		//create statement
		pt = con.prepareStatement(query);
		pt.setInt(1, crs_id);
		
		
		//execute statement
		row = pt.executeUpdate();
		//close connection
		con.close();
		return row;
	}

	public int update(String crs_name, String crs_desc, Integer crs_id) throws SQLException {
		//load the drive
		//create connection
		this.connection();
		
		//write query
		this.query = "update courses set crs_name=?, crs_desc=? where crs_id=?" ;
		
		//create statement
		pt = con.prepareStatement(query);
		pt.setString(1, crs_name);
		pt.setString(2, crs_desc);
		pt.setInt(2, crs_id);
		
		//execute statement
		int row = pt.executeUpdate();
		//close connection
		con.close();
		return row;
	}
}
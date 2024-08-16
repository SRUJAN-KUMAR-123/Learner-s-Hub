package profile;

import java.sql.*;
import java.util.*;

public class DBEnrollment {

	String url, uname, pass, instructor, db;
	Connection con;
	String query;
	Statement st;
	PreparedStatement pt;
	
	public DBEnrollment() {
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
	
	public List<List<Course>> get_student_courses(int student_id) throws SQLException {
		
		List<List<Course>> courses = new ArrayList<List<Course>>();

		List<Course> available_courses = new ArrayList<Course>();
		List<Integer> enrolled_courses_id = new ArrayList<Integer>();
		List<Course> enrolled_courses = new ArrayList<Course>();
		
		this.connection();
		query = "select course_id, instructor_id from enrollments where student_id=?";
		pt = con.prepareStatement(query);
		pt.setInt(1, student_id);
		ResultSet enrollments = pt.executeQuery();
		while (enrollments.next()) {
			enrolled_courses_id.add(enrollments.getInt(1));
			query = "select * from courses where crs_id=?";
			pt = con.prepareStatement(query);
			pt.setInt(1, enrollments.getInt(1));
			ResultSet result = pt.executeQuery();
			while (result.next()) {
				Course course = new Course();
				course.setCrs_id (result.getInt(1));
				course.setCrs_name(result.getString(2));
				course.setCrs_desc(result.getString(3));
				query = "select instructor_id, lName, mName, fName from instructor where instructor_id=?";
				pt = con.prepareStatement(query);
				pt.setInt(1, enrollments.getInt(2));
				ResultSet instructor_details = pt.executeQuery();
				while (instructor_details.next()) {
					String instructor_name =  instructor_details.getString(2) + " " + instructor_details.getString(3) + " " + instructor_details.getString(4);
					List<List<String>> instructor = new ArrayList<List<String>>();
					instructor.add(Arrays.asList(instructor_details.getString(1), instructor_name));
					course.setInstructor_names(instructor);
				}
				enrolled_courses.add(course);
			}
		}
		
		query = "select * from courses where crs_id in ( select  distinct course_id from enrollments);;";
		st = con.createStatement();
		ResultSet result = st.executeQuery(query);
		while (result.next()) {
			Course course = new Course();
			Integer crs_id = result.getInt(1);
			if (enrolled_courses_id.contains(crs_id)) { continue; }
			ArrayList<List<String>> course_instructors = new ArrayList<List<String>>();
			course.setCrs_id (crs_id);
			course.setCrs_name(result.getString(2));
			course.setCrs_desc(result.getString(3));
			query = "select instructor_id, lName, mName, fName from instructor where instructor_id in ( select instructor_id from enrollments where course_id=?)";
			pt = con.prepareStatement(query);
			pt.setInt(1, crs_id);
			ResultSet instructors = pt.executeQuery();
			while (instructors.next()) {
				ArrayList<String> instructor = new ArrayList<String>();
				instructor.add(instructors.getString(1));
				String instructor_name =  instructors.getString(2) + " " + instructors.getString(3) + " " + instructors.getString(4);
				instructor.add(instructor_name);
				course_instructors.add(instructor);
			}
			course.setInstructor_names(course_instructors);
			available_courses.add(course);
		}
		courses.add(available_courses);
		courses.add(enrolled_courses);
		return courses;
	}
	
	public List<List<Course>> get_instructor_courses(Integer instructor_id) throws SQLException {
		
		List<List<Course>> courses = new ArrayList<List<Course>>();
		List<Course> enrolled_courses = new ArrayList<Course>();
		List<Course> available_courses = new ArrayList<Course>();
		List<Integer> enrolled_course_ids = new ArrayList<Integer>();
		
		this.connection();
		
		this.query = "select course_id from enrollments where instructor_id=?";
		pt = con.prepareStatement(query);
		pt.setInt(1, instructor_id);
		ResultSet result = pt.executeQuery();
		
		while (result.next()) {
			enrolled_course_ids.add(result.getInt(1));
		}
		
		this.query = "select * from courses";
		pt = con.prepareStatement(query);
		result = pt.executeQuery(query);
		while (result.next()) {
			Course course = new Course();
			Integer crs_id = result.getInt(1);
			course.setCrs_id (crs_id);
			course.setCrs_name(result.getString(2));
			course.setCrs_desc(result.getString(3));
			if (enrolled_course_ids.contains(crs_id)) {
				enrolled_courses.add(course);
			} else {
				available_courses.add(course);
			}
		}
		courses.add(enrolled_courses);
		courses.add(available_courses);
		return courses;
	}
	
	public int insert_instructor(Enrollment enrollment) throws SQLException {
		//load the drive
		//create connection
		this.connection();
		
		//write query
		this.query = "insert into enrollments (instructor_id, course_id) values(?, ?)";
		
		//create prepared statement
		pt = con.prepareStatement(query);
		
		pt.setInt(1, enrollment.getInstructor_id());
		pt.setInt(2, enrollment.getCourse_id());
		
		//execute pr statement
		int row = pt.executeUpdate();
		//close connection
		
		return row;
	}
	
	public int insert(Enrollment enrollment) throws SQLException {
		//load the drive
		//create connection
		this.connection();
		
		//write query
		this.query = "insert into enrollments (instructor_id, course_id, student_id) values(?, ?, ?)";
		
		//create prepared statement
		pt = con.prepareStatement(query);
		
		pt.setInt(1, enrollment.getInstructor_id());
		pt.setInt(2, enrollment.getCourse_id());
		pt.setInt(3, enrollment.getStudent_id());
		
		//execute pr statement
		int row = pt.executeUpdate();
		//close connection
		
		return row;
	}
	
	public int delete_student_enrollment(Integer crs_id, Integer student_id) throws SQLException {
		//load the drive
		//create connection
		this.connection();
		
		//write query
		this.query = "delete from enrollments where course_id=? and student_id=?" ;
		
		//create statement
		pt = con.prepareStatement(query);
		pt.setInt(1, crs_id);
		pt.setInt(2, student_id);
		
		//execute statement
		int row = pt.executeUpdate();
		//close connection
		con.close();
		return row;
	}
	
	public int delete_instructor_enrollment(Integer crs_id, Integer instructor_id) throws SQLException {
		//load the drive
		//create connection
		this.connection();
		
		//write query
		this.query = "delete from enrollments where course_id=? and instructor_id=?";
		
		//create statement
		pt = con.prepareStatement(query);
		pt.setInt(1, crs_id);
		pt.setInt(2, instructor_id);
		
		//execute statement
		int row = pt.executeUpdate();
		//close connection
		con.close();
		return row;
	}
	
	public int delete(Integer enrollmentId) throws SQLException {
		//load the drive
		//create connection
		this.connection();
		
		//write query
		this.query = "delete from enrollments where enr_id=?";
		
		//create statement
		pt = con.prepareStatement(query);
		pt.setInt(1, enrollmentId);
		
		//execute statement
		int row = pt.executeUpdate();
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
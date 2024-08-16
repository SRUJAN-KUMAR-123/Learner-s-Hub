package profile;

import java.sql.*;

public class Database1 {

	String url, uname, pass, instructor, db;
	Connection con;
	String query;
	Statement st;
	PreparedStatement pt;
	
	public Database1(String instructor) {
		super();
		this.db = "user_registration";
		this.url = "jdbc:mysql://localhost:1503/" + this.db;
		this.uname = "root";
		this.pass = "Srujan@123098";		
	}
	
	public void connection() throws SQLException {
		con = DriverManager.getConnection(url, uname, pass);
	}
	
	public Instructor read(String uname) throws SQLException, ClassNotFoundException {
		
		//load the drive
		//create connection
		this.connection();
		
		//write query
		query = "select * from instructor where iuname='"+uname +"'";
		
		//create statement
		st = con.createStatement();
		
		//execute statement
		ResultSet result = st.executeQuery(query);
		Instructor instructor = new Instructor();
		//process the result(select)
		while(result.next()) {
			instructor.setfName(result.getString(1));
			instructor.setmName(result.getString(2));
			instructor.setlName(result.getString(3));
			instructor.setDob(result.getString(4));
			instructor.setAge(result.getInt(5));
			instructor.setGender(result.getString(6));
			
			instructor.setSubjects(result.getString(7));
			instructor.setDegree(result.getString(8));
			instructor.setAvailability(result.getString(9));
			instructor.setTeachingexp(result.getInt(10));
			instructor.setBiography(result.getString(11));
			instructor.setMobile(result.getLong(12));
			instructor.setEmail(result.getString(13));
			instructor.setAddress(result.getString(14));
			
			instructor.setUname(result.getString(15));
			instructor.setPass(result.getString(16));
			instructor.setLanguage(result.getString(17));
			instructor.setInstructor_id(result.getInt(18));
		}
		//close the connection
		con.close();
		return instructor;
	}
	
	public int insert(Instructor instructor) throws SQLException {
		//load the drive
		//create connection
		this.connection();
		
		//write query
		this.query = "insert into instructor (fName,mName,lName,dob,age,gender,subjects,degree,availability,teachingexp,biography,mobile,email,address,iuname,pass,language) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		//create prepared statement
		pt = con.prepareStatement(query);
		
		pt.setString(1, instructor.getfName());
		pt.setString(2, instructor.getmName());
		pt.setString(3, instructor.getlName());
		pt.setString(4, instructor.getDob());
		pt.setInt(5, instructor.getAge());
		pt.setString(6, instructor.getGender());
		
		pt.setString(7, instructor.getSubjects());
		pt.setString(8, instructor.getDegree());
		pt.setString(9, instructor.getAvailability());
		pt.setInt(10, instructor.getTeachingexp());
		pt.setString(11, instructor.getBiography());
		pt.setLong(12, instructor.getMobile());
		pt.setString(13, instructor.getEmail());
		pt.setString(14, instructor.getAddress());
		
		pt.setString(15, instructor.getUname());
		pt.setString(16, instructor.getPass());	
		pt.setString(17, instructor.getLanguage());	
		
		//execute pr statement
		int row = pt.executeUpdate();
		//close connection
		
		return row;
	}
	
	public int delete(String uName) throws SQLException {
		//load the drive
		//create connection
		this.connection();
		
		//write query
		this.query = "delete from instructor where iuname=?" ;
		
		//create statement
		pt = con.prepareStatement(query);
		pt.setString(1, uName);
		
		//execute statement
		int row = pt.executeUpdate();
		//close connection
		con.close();
		return row;
	}

	public int update(String address, String uName) throws SQLException {
		//load the drive
		//create connection
		this.connection();
		
		//write query
		this.query = "update instructor set address=? where iuname=?" ;
		
		//create statement
		pt = con.prepareStatement(query);
		pt.setString(1, address);
		pt.setString(2, uName);
		
		//execute statement
		int row = pt.executeUpdate();
		//close connection
		con.close();
		return row;
	}	
	
	public int validate(String uname, String password) throws SQLException, ClassNotFoundException {
		
		this.connection();
		
		query = "select pass from instructor where iuname='"+uname+"'";
		
		//create statement
		st = con.createStatement();
		
		//execute statement
		ResultSet result = st.executeQuery(query);		
		
		if(!result.next()) {
			con.close();
			return 1;
		}
		if(result.getString(1).equals(password)) {
			con.close();
			return 2;
		}
		else {
			con.close();
			return 3;
		}
			
			
		//wrong uname
		//wrong password
		//correct uname and password
					
	}
}












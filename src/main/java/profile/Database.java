package profile;

import java.sql.*;

public class Database {

	String url, uname, pass, user, db;
	Connection con;
	String query;
	Statement st;
	PreparedStatement pt;
	
	public Database(String user) {
		super();
		this.db = "user_registration";
		this.url = "jdbc:mysql://localhost:1503/" + this.db;
		this.uname = "root";
		this.pass = "Srujan@123098";		
	}
	
	public void connection() throws SQLException {
		con = DriverManager.getConnection(url, uname, pass);
	}
	
	public User read(String uname) throws SQLException, ClassNotFoundException {
		
		//load the drive
		//create connection
		this.connection();
		
		//write query
		query = "select * from student where suname='"+uname +"'";
		
		//create statement
		st = con.createStatement();
		
		//execute statement
		ResultSet result = st.executeQuery(query);
		User user = new User();
		//process the result(select)
		while(result.next()) {
			user.setfName(result.getString(1));
			user.setmName(result.getString(2));
			user.setlName(result.getString(3));
			user.setDob(result.getString(4));
			user.setAge(result.getInt(5));
			user.setGender(result.getString(6));
			
			user.setQual(result.getString(7));
			user.setInst(result.getString(8));
			user.setMode(result.getString(9));
			user.setYear(result.getInt(10));
			user.setPer(result.getFloat(11));
			user.setMobile(result.getLong(12));
			user.setEmail(result.getString(13));
			user.setAddress(result.getString(14));
			
			user.setUname(result.getString(15));
			user.setPass(result.getString(16));
			user.setLanguage(result.getString(17));
			user.setStudent_id(result.getInt(18));
		}
		//close the connection
		con.close();
		return user;
	}
	
	public int insert(User user) throws SQLException {
		//load the drive
		//create connection
		this.connection();
		
		//write query
		this.query = "insert into student (fName,mName,lName,dob,age,gender,qual,inst,mode,year,per,mobile,email,address,suname,pass,language) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		//create prepared statement
		pt = con.prepareStatement(query);
		
		pt.setString(1, user.getfName());
		pt.setString(2, user.getmName());
		pt.setString(3, user.getlName());
		pt.setString(4, user.getDob());
		pt.setInt(5, user.getAge());
		pt.setString(6, user.getGender());
		
		pt.setString(7, user.getQual());
		pt.setString(8, user.getInst());
		pt.setString(9, user.getMode());
		pt.setInt(10, user.getYear());
		pt.setFloat(11, user.getPer());
		pt.setLong(12, user.getMobile());
		pt.setString(13, user.getEmail());
		pt.setString(14, user.getAddress());
		
		pt.setString(15, user.getUname());
		pt.setString(16, user.getPass());
		pt.setString(17, user.getLanguage());
		
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
		this.query = "delete from student where suname=?" ;
		
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
		this.query = "update student set address=? where suname=?" ;
		
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
		
		query = "select pass from student where suname='"+uname+"'";
		
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
	
public int validateadmin(String uname, String password) throws SQLException, ClassNotFoundException {
		
		this.connection();
		
		query = "select pass from admin where uname='"+uname+"'";
		
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












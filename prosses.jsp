<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>

                <%  
       int command=Integer.parseInt(request.getParameter("command"));
      Connection conn;
ResultSet resultSet;
try {
     
    // Load the Oracle JDBC driver
    Class.forName("com.mysql.jdbc.Driver");
    //out.print("class");
     
}
catch(ClassNotFoundException e) {
     e.printStackTrace();
}
try {
    // Connect to the Database
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wtf", "root", "root");

   //out.print("conn");
    if(command==0){
    int id=Integer.parseInt(request.getParameter("RollNo"));//
   int marathi=Integer.parseInt(request.getParameter("Marathi"));
   int hindi=Integer.parseInt(request.getParameter("Hindi"));
   int english=Integer.parseInt(request.getParameter("English"));
    
 PreparedStatement pst=conn.prepareStatement("insert into StudentDB values(?,?,?,?)");
   
    
   pst.setInt(1,id);
   
   pst.setInt(2, marathi);
   pst.setInt(3, hindi);
   pst.setInt(4, english);
  int s=pst.executeUpdate();
   }
  if(command==1){
  Statement statement=conn.createStatement();
   ResultSet rs=statement.executeQuery("select * from StudentDB");
   JSONArray array=new JSONArray();
   while(rs.next())
             {
       
       String s1=""+rs.getInt(1);
       String s2=""+rs.getInt(2);
       String s3=""+rs.getInt(3);
       String s4=""+rs.getInt(4);
       JSONObject job=new JSONObject();
       job.put("RollNo",s1);
       job.put("Marathi",s2);
       job.put("Hindi",s3);
       job.put("English",s4);
       array.add(job);
    
   }
   JSONObject jSONObject=new JSONObject();
     jSONObject.put("success",true);
   jSONObject.put("rows",array);
 // jSONObject.accumulate("success",true);
  // jSONObject.accumulate("rows",true);
   out.println(jSONObject.toString());
}
    
        if (command == 3) {//for deleting the record in grid 1
            String id = request.getParameter("rollno");
            Statement statement = conn.createStatement();
            statement.executeUpdate("delete from StudentDB where RollNo='" + id + "'");
            out.println("{success:true}");
        }
  
    
        if (command == 5) {///for updating the database
            String t, rollno, marathi, hindi, english;
            t = request.getParameter("t");
            rollno = request.getParameter("t1");
            marathi = request.getParameter("t2");
            hindi = request.getParameter("t3");
            english = request.getParameter("t4");
            Statement statement = conn.createStatement();
           // statement.executeUpdate("delete from StudentDB where RollNo='" + t + "'");

            //statement.executeUpdate("update table StudentDB values('" + rollno + "','" + marathi + "','" + hindi + "','" + english + "')");
             statement.executeUpdate("update StudentDB set  Marathi='"+marathi+"',Hindi='"+hindi+"',English='"+english+"'where RollNo='"+t+"'");

            out.println("{success:true}");
        }
    
    
    
      if (command == 2) {//adding values to grid
            String rollno, marathi, hindi, english;
            rollno = request.getParameter("t1");
            marathi = request.getParameter("t2");
            hindi = request.getParameter("t3");
            english = request.getParameter("t4");



            //*
            String query = "insert into reg(id,name,loc,pro)values(?, ?, ?,?)";
            PreparedStatement pstmt = null;
            pstmt = conn.prepareStatement(query); // create a statement
            pstmt.setString(1, rollno); // set input parameter 1
            pstmt.setString(2, marathi); // set input parameter 2
            pstmt.setString(3, hindi); // set input parameter 3
            pstmt.setString(4, english); // set input parameter 3

            pstmt.executeUpdate(); // exec*/
            //   Statement statement = conn.createStatement();
            //          statement.executeUpdate("insert into reg values('"+id+"','"+name+"','"+loc+"','"+pro+"')");


            out.println("{success:true}");
        }
}

  catch(SQLException e) {
    e.printStackTrace();
} 
%>
 
   

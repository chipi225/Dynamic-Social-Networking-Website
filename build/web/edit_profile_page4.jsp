<%@ page import="java.sql.*;" %>
<html>
<head>
        <style type="text/css">
        a
        {
            color:black;
            text-decoration:none;
            font-size:85%;
        }
    </style>

  <script>
        function save()
        {
            document.form1.action="edit_profile_page5.jsp";
            document.form1.submit();
        }
        
        function home()
        {
            document.form1.action="HomePage.jsp";
            document.form1.submit();
        }
        
        function accept_frnd()
       {
            
            alert("New Friend has been added.");

       }
       
       function search()
	{
         var str=document.getElementById('SearchFriends').value;
         
         var xmlhttp=null;
            try
		  {
                     // Firefox, Opera 8.0+, Safari
                     xmlhttp=new XMLHttpRequest();
		  }
		catch (e)
		  {
                     // Internet Explorer
		  try
		    {
                          xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
		    }
		  catch (e)
		    {
                          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		    }
		  }
	
         if (xmlhttp==null)
	 {
            alert ("Your browser does not support AJAX!");
            return;
	 } 
         
         xmlhttp.onreadystatechange=function()
         {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                document.getElementById("profile").innerHTML=xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET","friends_search.jsp?s="+str,true);
        xmlhttp.send();

        }

    function request()
	{
                  
         var xmlhttp=null;
            try
		  {
                     // Firefox, Opera 8.0+, Safari
                     xmlhttp=new XMLHttpRequest();
		  }
		catch (e)
		  {
                     // Internet Explorer
		  try
		    {
                          xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
		    }
		  catch (e)
		    {
                          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		    }
		  }
	
         if (xmlhttp==null)
	 {
            alert ("Your browser does not support AJAX!");
            return;
	 } 
         
         xmlhttp.onreadystatechange=function()
         {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                document.getElementById("profile").innerHTML=xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET","friend_req.jsp",true);
        xmlhttp.send();

        }

        function notification()
        
	{
        
         var xmlhttp=null;
            try
		  {
                     // Firefox, Opera 8.0+, Safari
                     xmlhttp=new XMLHttpRequest();
		  }
		catch (e)
		  {
                     // Internet Explorer
		  try   
		    {
                          xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
		    }
		  catch (e)
		    {
                          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		    }
		  }
	
         if (xmlhttp==null)
	 {
            alert ("Your browser does not support AJAX!");
            return;
	 } 
         
         xmlhttp.onreadystatechange=function()
         {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                document.getElementById("profile").innerHTML=xmlhttp.responseText;
            }
        }
        
        xmlhttp.open("GET","notifications.jsp",true);
        xmlhttp.send();

        }
    </script>
</head>
<%
        if(session.getAttribute("Username")==null)
            {
response.sendRedirect("firstPage.jsp"); // GO TO LOGIN PAGE
            }
        Connection con=null;
        Statement stmt=null;
        String email_id=(String)session.getAttribute("loginName");
        String religion=request.getParameter("religion");
        String political=request.getParameter("political");
        String inspiration=request.getParameter("inspiration");
        String quotation=request.getParameter("quotations");
        String user_id=(String)session.getAttribute("signup_mail");       
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/praful","root","");
        stmt=con.createStatement();  
        stmt.execute("UPDATE login_table SET religion='"+religion+"',political='"+political+"',inspiration='"+inspiration+"',quotation='"+quotation+"' WHERE email_id='"+user_id+"' OR email_id='"+email_id+"'");
        
        %>        

<body style="color:black">
<table style="width:1340px;" >
<tr>
<td style="background-color:#3B5998; width:220px; height:30px; position:fixed; right:84%;">
  <%  Connection con5=null;
        Class.forName("com.mysql.jdbc.Driver");
        con5=DriverManager.getConnection("jdbc:mysql://localhost:3306/praful","root","");
        
        Statement stmt15=null;
        stmt15=con5.createStatement();    
        ResultSet rs15=null;
        String log_in=(String)session.getAttribute("loginName");
rs15=stmt15.executeQuery("SELECT * FROM friend_req_table WHERE `to`='"+log_in+"'" );
int count=0;
if(rs15!=null)
{
    while(rs15.next())
    {
        count++;
    }
}

out.println("<font color=white>&nbsp;<a href=HomePage.jsp><img src='images/logo.jpeg' height=30 width=80 /></a>");
if(count>0)
{
    out.println("<a href=# onclick=request()><img src='images/friend1.jpg' height=30 width=20 /></a>");    
}
else
{
    out.println("<a href=# onclick=request()><img src='images/friend.jpg' height=30 width=20 /></a>");    
}

out.println(" &nbsp;<a href=MAIL.jsp><img src='images/message.jpg' height=30 width=20 /></a>");
out.println(" &nbsp;<a href=# onclick=notification()><img src='images/notification.jpg' height=30 width=20 /></a></td>");


%>


<td style="background-color:#3B5998; width:800px;height:30px; position:fixed; right:25%;">
    
        <center><input type="text" id="SearchFriends" value="Search friends" onfocus="if(this.value=='Search friends') this.value='';" onblur="if(this.value=='') this.value='Search friends';" > 
                <input type="button" value="Search" onclick="search();"></center>
   
</td>	

    <td style="background-color:#3B5998; width:340px;height:30px;position:fixed; right:0%;">
        <center><b>
            <a style="color:white;text-decoration:none;" href="HomePage.jsp"> Home</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="unique_profile_page.jsp?search=<%=log_in%>" style="color:white;text-decoration:none;"> Profile</a> &nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.jsp" style="color:white;text-decoration:none;">Logout</a></b></center></td>
</tr>


<tr  valign="top">
    <td style="background-color: white;" width="200" height="450">
    <br><br><br>
    <a href="edit_profile_page1.jsp"><img src="images\basic_info.jpg" width="20" height="20" />Basic Information</a>
    <br><br><a href="edit_profile_page2.jsp"><img src="images\education.jpg" width="20" height="20" />Education and Work</a>
    <br><br><a href="edit_profile_page3.jsp"><img src="images\philosophy.jpg" width="20" height="20" />Philiosophy</a>
    <br><br><a href="edit_profile_page4.jsp"><img src="images\arts.jpg" width="20" height="20" />Arts and Entertainment</a>
    <br><br><a href="edit_profile_page5.jsp"><img src="images\sports.jpg" width="20" height="20" />Sports</a>
    <br><br><a href="edit_profile_page6.jsp"><img src="images\activities.jpg" width="20" height="20" />Activities and Interests</a>
    
   </td>

   <td style="background-color: #eceff5; width:800px; ">       
        <div id="profile"><% 
            Connection con1=null;
            Statement stmt1=null;
            ResultSet rs=null;
            Class.forName("com.mysql.jdbc.Driver");
            con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/praful","root","");
            stmt1=con.createStatement();  
            rs=stmt1.executeQuery("SELECT * FROM login_table WHERE email_id='"+email_id+"' OR email_id='"+user_id+"'");
            String games=null;
            String music=null;
            String books=null;
            String movies=null;
            String tv=null;
            
            if(rs!=null)
            {
            while(rs.next())
            {
            out.println("<br><h3><br>&nbsp;&nbsp;&nbsp;&nbsp;"+ rs.getString("first_name") + " " + rs.getString("last_name") + " &raquo; Edit Profile</h3>");
            
            if(rs.getString("games")==null)
            {
            games="";
            }
            else
            {
            games=rs.getString("games");
            }
            
            if(rs.getString("music")==null)
            {
            music="";
            }
            else
            {
            music=rs.getString("music");
            }
            
            if(rs.getString("movies")==null)
            {
            movies="";
            }
            else
            {
            movies=rs.getString("movies");
            }
            
            if(rs.getString("tv")==null)
            {
            tv="";
            }
            else
            {
            tv=rs.getString("tv");
            }
            
            if(rs.getString("books")==null)
            {
            books="";
            }
            else
            {
            books=rs.getString("books");
            }
            
            break;
            }
            }
            
            %>
            <hr>
            <form name="form1">
                <h5>    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Music : 
                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <textarea rows="1" cols="45" name="music"><%=music%></textarea><br><br><hr><br>
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Books : 
                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <textarea rows="1" cols="45" name="books"><%=books%></textarea><br><br><hr><br>
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Movies : 
                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <textarea rows="1" cols="45" name="movies"><%=movies%></textarea><br><br><hr><br>
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Television : 
                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <textarea rows="1" cols="45" name="tv"><%=tv%></textarea><br><br><hr><br>
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Games
                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <textarea rows="1" cols="45" name="games"><%=games%></textarea><br><br><hr><br>
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" value = "Save Changes" onclick="save();">
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" value = "Fill Later" onclick="home();"><br><br><hr><br></h5>
            </form>
        </div>
    </td>
    <td style="background-color: white; width:320px;">
        
    </td>
</tr>

</table>
</body>

</html>
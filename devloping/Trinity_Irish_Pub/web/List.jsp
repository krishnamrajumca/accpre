<%@page import="com.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

 <% 
	try{      
		 String s[]=null;
                 System.out.println("in List");
		PreparedStatement ps=DBConnection.getPrepare("select name from items");
                ResultSet rs=ps.executeQuery();
	    	List li = new ArrayList();
	    
			while(rs.next()) 
 			{ 		//System.out.println(rs.getString(1));	    
 			    li.add(rs.getString(1));
 			}  
			
			String[] str = new String[li.size()];			
			Iterator it = li.iterator();
			
			int i = 0;
			while(it.hasNext())
			{
				String p = (String)it.next();	
				str[i] = p;
				i++;
			}
		
			//jQuery related start		
				String query = (String)request.getParameter("q");
				
				int cnt=1;
				for(int j=0;j<str.length;j++)
				{
					if(str[j].toUpperCase().startsWith(query.toUpperCase()))
					{
						out.print(str[j]+"\n");
						if(cnt>=5)
							break;
						cnt++;
					}
				}
			//jQuery related end	
		
			
 		rs.close(); 
// 		st.close(); 
//		con.close();

		    } 
		catch(Exception e){ 
 			e.printStackTrace(); 
 		}


 %>
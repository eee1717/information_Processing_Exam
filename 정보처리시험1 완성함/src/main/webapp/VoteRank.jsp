<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보조회화면</title>
<style>
table{ border:1px solid gray;}
td{ border :1px solid gray;
    text-align: center;
}


</style>
</head>
<body>
<header>(과정평가형 정보처리 산업기사) 지역구의원투표 프로그램 ver 2020-05</header>

<nav> 
 <ul>
  <li><a href="join.jsp">후보조회</a></li>
  <li><a href="VoteInsert.jsp">투표하기</a></li>
  <li><a href="VoteSelect.jsp">투표검수조회</a></li>
  <li><a href="VoteRank.jsp">후보자등수</a></li>
  <li><a href="index.jsp">홈으로</a></li>
 </ul>

</nav>

<section>

<h1>후보자등수 </h1>

<table >
<tr>
<th>후보번호</th>
<th>성명</th>
<th>총투표건수</th>

</tr>
<% 
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	Statement stmt = con.createStatement();
	
	request.setCharacterEncoding("UTF-8");
	
	String sql =" SELECT M.m_no,M.m_name,count(*) v_total ";
	       sql+=" FROM tbl_member_202005 M, tbl_vote_202005 V";
	       sql+=" WHERE M.m_no = V.m_no   ";
	       sql+=" GROUP BY M.m_no, M.m_name";
	       sql+=" order by m_no asc";
	       
	     System.out.println(sql);  
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
// member,party	를섞어야함
%>

 <tr>
   <td><%=rs.getString("m_no") %></td>  <!-- 후보번호 M_NO -->
   <td><%=rs.getString("m_name") %></td> <!-- 성명 M_NAME -->
   <td><%=rs.getString("v_total") %></td> <!-- 소속정당 P_CODE -->

 </tr>




<% 		
	}
		con.close();
        stmt.close();
	
}catch(Exception e){
	e.printStackTrace();
}
	



%>
  
  


</table>





</section>

<footer>--------------------footer---------</footer>

</body>
</html>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.Format"%>
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
th,td{ border:1px solid gray; 
       text-align:center;    }

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

<h1>후보조회화면 </h1>

<table>
<tr>
<th>후보번호</th>
<th>성명</th>
<th>소속정당</th>
<th>학력</th>
<th>주민번호</th>
<th>지역구</th>
<th>대표전화</th>
</tr>
<% 


try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	Statement stmt = con.createStatement();
	
	request.setCharacterEncoding("UTF-8");
	
	String sql ="select ";
	 sql+= " m_no,m_name,M.p_code,";
     sql+= " decode(p_school,'1','고졸','2','학사','3','석사') p_school,";
     sql+= " substr(m_jumin,1,6)||'-'||substr(m_jumin,7,7) m_jumin,";
     sql+= " m_city,";
     sql+= " p_tel1||'-'||p_tel2||'-'||p_tel3 p_tel  ";
     sql+= " from tbl_member_202005 M  ";
     sql+= " inner join tbl_party_202005 P ";
     sql+= " on M.p_code = P.p_code  ";



	System.out.println(sql);
	ResultSet rs = stmt.executeQuery(sql);	
	while(rs.next()){
// member,party	를섞어야함


%>


 <tr>
   <td><%=rs.getString("m_no")%></td>  <!-- 후보번호 M_NO -->
   <td><%=rs.getString("m_name") %></td> <!-- 성명 M_NAME -->
   <td><%=rs.getString("p_code") %></td> <!-- 소속정당 P_CODE 정당은 잘못나와있어서 그냥둠 바꿀려면 decode로 바꾸기가능 -->
   <td><%=rs.getString("p_school") %></td> <!-- 학력   P_SCHOOL  학력숫자를 단어로바꾸어야함--> 
   <td><%=rs.getString("m_jumin") %></td> <!-- 주민번호 M_JUMIN -->
   <td><%=rs.getString("m_city") %></td> <!-- 지역구  M_CITY -->
   <td><%=rs.getString("p_tel") %></td> <!-- 대표전화  123 합쳐야함 P_TEL 123 -->
 
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
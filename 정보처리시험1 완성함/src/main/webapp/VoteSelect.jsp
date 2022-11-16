<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표검수조회화면</title>
<style>
table{ border:1px solid gray;}
td{ border:1px solid gray; 
    text-align: center; }
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

<h1>투표검수조회 </h1>

<table >
<tr>
<th>성명</th>
<th>생년월일</th>
<th>나이</th>
<th>성별</th>
<th>후보번호</th>
<th>투표시간</th>
<th>유권자확인</th>
</tr>
<% 
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	Statement stmt = con.createStatement();
	
	request.setCharacterEncoding("UTF-8");
	
	String sql =" select v_name,'19'||substr(v_jumin,1,2)||'년'|| ";
	       sql+=" substr(v_jumin,3,2)||'월'||  ";
	       sql+=" substr(v_jumin,5,2)||'일' birth, ";
	       sql+=" to_number(to_char(sysdate,'yyyy'))-to_number('19'||substr(v_jumin,1,2)) age,  ";
	       sql+=" decode(substr(v_jumin,7,1),'1','남','여') 성별,  ";
	       sql+=" m_no,  ";
	       sql+=" substr(v_time,1,2)||':'||substr(v_time,3,2) time ,  ";
	       sql+=" decode(v_confirm,'N','미확인','확인') v_confirm ";
	       sql+=" from tbl_vote_202005  ";
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
// member,party	를섞어야함
%>

 <tr>
   <td><%=rs.getString("v_name") %></td> <!-- 성명 v_name -->
   <td><%=rs.getString("birth") %></td> <!-- 생년월일 v_jumin 주민번호를통해서추출 --><!-- yyymmdd의방식으로해야함 고치기  -->
   <td><%=rs.getString("age") %></td> <!-- 나이   v_jumin v 주민번호를통해서 추출해서 생년월일지정해야함 --> 
   <td><%=rs.getString("성별") %></td> <!-- 성별 v_jumin을통해서 1은남자 2는여자로 해서 추출 -->
   <td><%=rs.getString("m_no") %></td> <!-- 후보번호  m_no --> 
   <td><%=rs.getString("time") %></td><!--  투표시간  v_time--> 
   <td><%=rs.getString("v_confirm") %></td> <!-- 유권자확인 v_confirm --> 
 
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
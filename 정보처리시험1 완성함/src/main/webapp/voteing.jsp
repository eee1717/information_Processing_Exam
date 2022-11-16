<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%

// POST 방식의 한글처리
request.setCharacterEncoding("UTF-8");

// 파라미터 정보 가져오기
String v_jumin = request.getParameter("v_jumin"); //주민번호
String v_name = request.getParameter("v_name");
String m_no = request.getParameter("m_no");
String v_time = request.getParameter("v_time");
String v_area = request.getParameter("v_area");
String v_confirm = request.getParameter("v_confirm");

int result = 0;
// JDBC 참조 변수 준비
try{
Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
    ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");

// 3) SQL문 준비
String sql = "INSERT INTO tbl_vote_202005 VALUES (?, ?, ?, ?, ?, ?)";

PreparedStatement pstmt = con.prepareStatement(sql);


pstmt.setString(1, v_jumin);
pstmt.setString(2, v_name);
pstmt.setString(3, m_no);
pstmt.setString(4, v_time);
pstmt.setString(5, v_area);
pstmt.setString(6, v_confirm);

// 4) 실행
 result = pstmt.executeUpdate();

 con.close();
 pstmt.close();

}catch(Exception e){
	e.printStackTrace();
}

if(result == 1){
%>
	<script>
	alert("수강신청이 정상적으로 완료되었습니다!");
	location = "index.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("수강신청 실패! \n 메인화면으로 이동합니다");
	location = "index.jsp";
	</script>
<%
}
%>


%>

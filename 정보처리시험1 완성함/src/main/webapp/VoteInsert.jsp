<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<style>
table{ border:1px solid gray;}
th{ border:1px solid gray;}
td{ border:1px solid gray;
}
</style>
<script>


</script>


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
<form name="frm" method="post" action="voteing.jsp">
 <table>	
	<tr> <th>주민번호</th><td><input type=text name="v_jumin">예:8906153154726</td></tr>
	<tr> <th>성명</th><td><input type=text name="v_name"></td></tr>
	<tr> 
	<th>투표번호</th>
	<td>
	<select name="m_no">
	 <option></option>
	 <option value="1" >1.김후보</option>
	 <option value="2" >2.이후보</option>
	 <option value="3" >3.박후보</option>
	 <option value="4" >4.조후보</option>
	 <option value="5" >5.최후보</option>
	</select>	
	</td>		
	</tr>
	
	<tr> 
		<th>투표시간</th>
		<td>
		<input type=text name="v_time"> 예:0930
		</td>
		</tr>
		<tr> 
		<th>투표장소</th>
		<td>
		<input type=text name="v_area"> 예:제1투표장
		</td>
	</tr>
	
	
	<tr> 
		<th>유권자확인</th>
		<td>
		<input type=radio name="v_confirm" value="Y">확인
		<input type=radio name="v_confirm" value="N">미확인
		</td>
	</tr>
	
	<tr>
		<td  colspan="2" style="text-align:center" >
		<button type="submit" onclick="fn_submit(); return false;">투표하기</button>
		<button type="button" onclick="fn_reset()">다시하기</button>
		</td>
	</tr>	
	</table>
</form>

</section>

<footer>--------------------footer---------</footer>

</body>
</html>
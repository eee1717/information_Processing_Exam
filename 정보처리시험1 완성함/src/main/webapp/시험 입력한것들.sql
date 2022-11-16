


select v_jumin from tbl_vote_202005;

select substr(v_jumin,1,2)||'년'||substr(v_jumin,3,2)||'월'||substr(v_jumin,5,2)||'일' age from tbl_vote_202005;

select substr(v_jumin,1,6) from tbl_vote_202005;

select substr(v_jumin,1,6) from tbl_vote_202005;

select v_name,'19'||substr(v_jumin,1,2)||'년'||
substr(v_jumin,3,2)||'월'||
substr(v_jumin,5,2)||'일' birth,
to_number(to_char(sysdate,'yyyy'))-to_number('19'||substr(v_jumin,1,2)) age,
substr(v_jumin,7,1) 성별,
m_no,
substr(v_time,1,2)||':'||substr(v_time,3,2) time ,
v_confirm
from tbl_vote_202005;

select decode(substr(v_jumin,7,1),'1','남자','여자') 성별 from tbl_vote_202005;
select substr(v_jumin,7,1) 성별 from tbl_vote_202005;




select v_name,'19'||substr(v_jumin,1,2)||'년'||
substr(v_jumin,3,2)||'월'||
substr(v_jumin,5,2)||'일' birth,
to_number(to_char(sysdate,'yyyy'))-to_number('19'||substr(v_jumin,1,2)) age,
decode(substr(v_jumin,7,1),'1','남자','여자') 성별,
m_no,
substr(v_time,1,2)||':'||substr(v_time,3,2) time ,
decode(v_confirm,'N','미확인','확인') v_confirm
from tbl_vote_202005;

select * from tbl_vote_202005;

select count(*)  
from tbl_vote_202005
where m_no = '1';

select count(*)  
from tbl_vote_202005
where m_no = '2';

select count(*)  
from tbl_vote_202005
where m_no = '3';


select count(m_no)
from tbl_vote_202005
where m_no = '3';

select *  from tbl_member_202005;
select * from tbl_party_202005;

select m_no,m_name,M.p_code,
decode(p_school,'1','고졸','2','학사','3','석사') p_school,
substr(m_jumin,1,6)||'-'||substr(m_jumin,7,7) m_jumin,
m_city,
p_tel1||'-'||p_tel2||'-'||p_tel3 p_tel
from tbl_member_202005 M
inner join tbl_party_202005 P
on M.p_code = P.p_code;


select decode(p_school,'1','고졸','2','학사','3','석사') p_school from tbl_member_202005;

select * from tbl_party_202005;
select * from tbl_member_202005;
select * from tbl_vote_202005; --m_no를 연결해서 count한다--

select count(m_no) from tbl_vote_202005
where m_no = '1';

SELECT M.m_no,M.m_name,count(*) v_total
FROM tbl_member_202005 M, tbl_vote_202005 V
WHERE M.m_no = V.m_no      -- V의 m_no와 M의 m_no를 연결함 
GROUP BY M.m_no, M.m_name   --m_no 와 m_name 을 카운트한다.
order by m_no asc ;           -- m_no를 기준으로 asc(오름차순(낮은숫자가맨위)  desc(내림차순(높은숫자가맨위)

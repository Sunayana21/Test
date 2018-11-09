select user_id,
((0x0000FFFF & User_Id)<<16) + ((0xFFFF0000 & User_Id)>>16)as Unhashed_userid,
count(distinct(date(eventtimestamp)))as Signup_date
from
sbg_source.src_qbse_useraudit u
join
sbg_source.src_qbse_user_1 a
on u.user_id=a.id
where testuser=0
and eventtype in (2,25)
group by 1
having count(distinct(date(eventtimestamp))) > 1

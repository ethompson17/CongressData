--insert into Reasons (Code,Category)
--values
--('X', 'Unwanted sexual contact'),
--('A', 'Consensual sex scandals'),
--('B', 'Other scandals'),
--('C', 'Other office'),
--('D', 'Private sector'),
--('E', 'Health/family'),
--('F', 'Other'),
--('G', 'Left early'),
--('H', 'Military services'),
--('I', 'Election overturned')

--Cleaning up Resignation Date column
alter table congressional_resignations$
alter column resignationdate date


select *
from Reasons r
full outer join congressional_resignations$ c
on r.Code = c.Category


select * from congressional_resignations$


select member, party, reason, source, r.Category,c.ResignationDate
from Reasons r
full outer join congressional_resignations$ c
on r.Code = c.Category
where code in ('b','c')
group by Member,party, reason, source, r.Category,c.ResignationDate


select c.party Party, r.Category,r.code Code, count(code) NumberOfPeopleWhoResigned, TotalMembersOfParty,
cast((cast(count(code)as decimal(10,2))/cast((totalmembersofparty) as decimal(10,2))*100) as decimal (10,2)) as PercentageOfPartyWhoResigned
from Reasons r
full outer join congressional_resignations$ c
on r.Code = c.Category
join (select party, count(member) as totalmembersofparty from congressional_resignations$ group by party) as t
on t.party = c.party
group by c.party, r.Category, r.code, totalmembersofparty
having r.code in ('a','b','c','d','e','f','g','h','i')

select c.party Party, r.Category,r.code Code, count(code) NumberOfPeopleWhoResigned, TotalMembersOfParty,
cast((cast(count(code)as decimal(10,2))/cast((totalmembersofparty) as decimal(10,2))*100) as decimal (10,2)) as PercentageOfPartyWhoResigned
from Reasons r
full outer join congressional_resignations$ c
on r.Code = c.Category
join (select party, count(member) as totalmembersofparty from congressional_resignations$ group by party) as t
on t.party = c.party
group by c.party, r.Category, r.code, totalmembersofparty
having r.code in ('a','b','c','d','e','f','g','h','i','x')
order by c.party, r.code


select c.party, count(code) as NumberOfSexualHarassmentResignations,TotalMembersOfParty,
cast((cast(count(code)as decimal(10,2))/cast((totalmembersofparty) as decimal(10,2))*100) as decimal (10,2)) as SexualHarassmentResignationPercentageOfParty
from Reasons r
full outer join congressional_resignations$ c
on r.Code = c.Category
join (select party, count(member) as totalmembersofparty from congressional_resignations$ group by party) as t
on t.party = c.party
where code = 'x' or code = 'a'
group by c.party, totalmembersofparty

select COUNT(Party), member, reason, source, Category,ResignationDate
from congressional_resignations$ c
where ResignationDate between '1970-01-01' and '2000-01-01'
group by Member, reason, source, Category,ResignationDate
order by ResignationDate desc

select * 
from congressage ca
left join congressional_resignations$ c on c.member = concat(ca.firstname,' ',ca.lastname)
full outer join Reasons r on c.Category = r.code


select *
from congressional_resignations$ c
join Reasons r
on r.code = c.Category
where Member like 'Barack Obama'


select member, party, reason, source, r.Category,ResignationDate,congress
from Reasons r
full outer join congressional_resignations$ c
on r.Code = c.Category
where code = 'x' or code = 'a'
group by party, member, party, reason, source, r.Category,ResignationDate,Congress
order by 2


select source, count(member) as n,ResignationDate as yearofres
from congressional_resignations$
group by source,ResignationDate
order by yearofres desc


select *
from Reasons


select party, count(code) as NumberOfSexualHarassmentResignations
from Reasons r
full outer join congressional_resignations$ c
on r.Code = c.Category
where code = 'x' or code = 'a'
group by party


select party, r.Category, count(code) numberoftimes
from Reasons r
full outer join congressional_resignations$ c
on r.Code = c.Category
where code = 'x' or code = 'a'
group by party, r.Category
order by Party


select r.Category, count(code) TotalResignationsPerCategory
from Reasons r
full outer join congressional_resignations$ c
on r.Code = c.Category
where r.Category is not null
group by r.Category, r.code
order by Category


select *
from Reasons


select party, count(member) as TotalNumberOfResignations
from congressional_resignations$
group by party


select party, category,numberoftimes,totalmembers, cast((numberoftimes/totalmembers) as decimal(10,2)) as percentageofparty
from 
(
select c.party, r.Category, count(code) numberoftimes, totalmembers, cast(((count(code)/totalmembers)*100) as decimal(10,2)) as percentageofparty
from Reasons r
full outer join congressional_resignations$ c
on r.Code = c.Category
join (select party, count(member) as totalmembers from congressional_resignations$ group by party) as t
on t.party = c.party
group by c.party, r.Category, r.code, totalmembers
) x


select c.party, r.Category, count(code) numberoftimes, totalmembers, cast(((count(code)/totalmembers)*100) as decimal(10,2)) as percentageofparty
from Reasons r
full outer join congressional_resignations$ c
on r.Code = c.Category
join (select party, count(member) as totalmembers from congressional_resignations$ group by party) as t
on t.party = c.party
group by c.party, r.Category, r.code, totalmembers


select *
from congressional_resignations$
where Member like 'joe biden'


select * 
from congressage ca
join congressional_resignations$ c on c.member = concat(ca.firstname,' ',ca.lastname)
full outer join Reasons r on c.Category = r.code


select * 
from congressage ca
full outer join congressional_resignations$ c on c.member = concat(ca.firstname,' ',ca.lastname)
full outer join Reasons r on c.Category = r.code
where c.Member like 'barack obama'

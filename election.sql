use  new_election;

-- Q1 i) What is the number of candidates who contested the election?
-- Count of candidates who contested the election
select count(WINNER) from `data`;
-- 2263 candidates contested the election

-- Q1 ii) What is Count of Winning Candidates?
select count(WINNER) as 'winning candidates count' from `data` where WINNER=1;
-- 539 Candidates won election

-- Q1 iii) What is Count of lost candidates
select count(WINNER) as 'winning candidates count' from `data` where WINNER=0;
-- 1724 Candidates lost election

-- Q2) Display Party wise Postal Votes & General Votes
select PARTY,avg(`GENERAL VOTES`),avg(`POSTAL VOTES`) from  `data`
group by PARTY ;
-- Query  shows Party wise Postal Votes & General Votes

-- Q3 List Top 5 oldest winning candidates of the M P election.?
select NAME,AGE,PARTY,STATE from `data` where WINNER='1' order by AGE desc limit 5;
-- Top 5 Old aged winning candidates are  DR. SHAFIQUR REHMAN BARQ=86,Farooq Abdullah=83,CHOUDHURY MOHAN JATUA,MULAYAM SINGH YADAV,G. S. BASAVARAJ

-- Q4 Rank the top 5 young winning candidates of the M P election.?
select NAME,AGE,PARTY,STATE from `data` where WINNER='1' order by AGE asc limit 5;
-- Top 5 Young winning candidates are GODDETI. MADHAVI=26 years,PRAJWAL REVANNA=28,Nusrat Jahan Ruhi=28,TEJASVI SURYA=28,INDRA HANG SUBBA=30.

-- Q5) Display State wise,Constituency wise Winning Candidates name of BJP Party
select STATE,CONSTITUENCY,NAME from `data` 
where WINNER='1' and PARTY='BJP'
order by STATE asc;
-- Query displays State wise,Constituency wise  Candidates name & Total Votes Polled.

-- Q6) List Name of candidates with assets greater than 1 crore who were victorious in the election.
select NAME,ASSETS from `data` where WINNER='1' and ASSETS > 10000000
order by ASSETS desc;
-- M V V SATYANARAYANA has highest asset followed by SHRIMANT CHH. UDAYANRAJE PRATAPSINHMAHARAJ BHONSLE & MALA RAJYA LAXMI SHAH & so on.

-- Q7) Display Top 10 Constituency having higher number of total electors ?
select CONSTITUENCY,STATE,`ELECTORS inCONSTITUENCY` as 'Total Electors' from `data` 
where WINNER='1'
order by 3 desc
limit 10;
-- Top 10 Constituency are WAYANAD,HOSHANGABAD,KANGRA,MANDI and so on

-- Q8) What are the qualifications of the candidate with the highest number of criminal cases?
select NAME,EDUCATION,`CRIMINAL CASES` from `data` 
where `CRIMINAL CASES`>10
order by `CRIMINAL CASES` desc;
-- K SURENDRAN has 240 criminal cases Qualification is Graduate

-- Q9) Display Candidates who has no Criminal cases
select NAME ,PARTY from `data` where `CRIMINAL CASES`=0;
-- Candidates with out any case are Godam Nagesh , Manoj Kumar Soni , Dr. SUJAY RADHAKRISHNA VIKHEPATIL and so on

-- Q10) What is Qualification of SC/ST Candidates?
select  distinct(EDUCATION) from `data` where CATEGORY!='GENERAL'; 
-- Qualification of SC/ST Candidates are 12th Pass,Doctorate,Post Graduate,Graduate Professional & Others.

create database bear_dataset_case;
use bear_dataset_case;

select * from bear_attack;
select * from bear_attack_sec;

-- Find the name of the tourist and their age and latitude of their location
select a.name,a.age,b.latitude
from bear_attack a inner join bear_attack_sec b on a.ID=b.ID;

-- Show the gender and type of bear 
select a.gender,b.ï»¿Bear_type
from bear_attack a inner join bear_attack_sec b on a.ID=b.ID;

-- Display the 1901 tourist as view and then display the kill rate
Create view tourist_year as 
select year
from bear_attack 
where year>1901;

select t.year,d.kill_count
from tourist_year t inner join bear_attack c on t.year=c.year inner join bear_attack_sec d on c.ID=d.ID
where t.year>1901;

-- Show the name and gender and hunters more than 20
select a.gender,a.name,b.hunter
from bear_attack a inner join bear_attack_sec b on a.ID=b.ID
where b.hunter>20;

-- Show the gender and latitude after creating view then show the grizzly where it is 1 
Create view tourist_details as
select a.gender,b.latitude
from bear_attack a inner join bear_attack_sec b on a.ID=b.ID;

select a.gender,b.latitude,b.grizzly
from tourist_details a inner join bear_attack_sec b on a.latitude=b.latitude
Where b.grizzly= 1;

-- Show the black bear and their kill count and show the gender along side
select a.gender,b.ï»¿Bear_type,b.kill_count
from bear_attack a inner join bear_attack_sec b on a.ID=b.ID
where b.ï»¿Bear_type= "Black Bear";

-- Show the tourist name and gender make a view and then  show the hunter who were more than 3 and kill count is less than 10
create view tourist_data as 
select Name,gender,ID
from bear_attack;

select a.Name,a.gender,b.kill_count,b.hunter,a.ID
from tourist_data a inner join bear_attack_sec b on a.ID=b.ID
where b.kill_count<10 and b.hunter>3
order by a.Name asc,a.gender desc;
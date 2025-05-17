select * from ibm_employees

/* No duplicates were found */
with cte1 as (
select *, row_number() over (partition by Age, Attrition, BusinessTravel, DailyRAte, Department, DistanceFromHome, Education, EducationField, EmployeeCOunt, EnvironmentSatisfaction, Gender, HourlyRate, JobInvolvement, JobLevel, JobRole, JobSatisfaction, MaritalStatus, MonthlyIncome, MonthlyRate, NumCompaniesWorked, Over18, OverTime, PercentSalaryHike, PerformanceRating, RelationshipSatisfaction, StandardHours, StockOptionLevel, TotalWorkingYears, TrainingTimesLastYear, WorkLifeBalance, YearsAtCompany, YearsInCurrentRole, YearsSinceLastPromotion, YearsWithCurrManager ORDER BY EmployeeNumber ASC) as row_nmbr
from ibm_employees
)
select * from cte1
where row_nmbr > 1

/* Comparing employees' productivity and experience, indentifying who is and excellent/Outstanding worker and being Underpaid */
with cte2 as (
select c.*, d.avg_salary, 
case when c.Education = 1 then 'Below College' 
when c.Education = 2 then 'College'  
when c.Education = 3 then 'Bachelor'  
when c.Education = 4 then 'Master'
 when c.Education = 5 then 'PhD' else null end as education_lvl,
case when c.PerformanceRating = 1 then 'Low' 
when c.PerformanceRating = 2 then 'Good'  
when c.PerformanceRating = 3 then 'Excellent'  
when c.PerformanceRating = 4 then 'Outstanding'
else null end as productivity,
 case when c.TotalWorkingYears <=  2 then 'No/Little Experience' 
when c.TotalWorkingYears <= 5 then 'Moderately Experienced'  
when c.TotalWorkingYears <= 10 then 'Experienced'  
else 'Senior' end as experience,
case when c.PerformanceRating >= 4 and c.MonthlyIncome < d.avg_salary then 'Valuable Underpaid Employee'
when c.PerformanceRating < 3 and c.MonthlyIncome > d.avg_salary then 'Unreasonably High Paid Employee'
else 'Reasonably Paid Employee' end as salary_evaluation
from ibm_employees c
join avg_salaries_departments d
on c.Department = d.department
), 
cte3 as (
select Department,
avg(MonthlyIncome) as avg_dept_month_income, 
min(MonthlyIncome) as min_dept_month_income, 
max(MonthlyIncome) as max_dept_month_income from ibm_employees
group by Department
) 
Select a.EmployeeNumber,
a.Gender, 
a.JobRole,
a.productivity, 
a.MonthlyIncome,
a.avg_salary,
a.salary_evaluation,
a.experience,
a.education_lvl,
a.department,  
b.avg_dept_month_income, 
b.min_dept_month_income, 
b.max_dept_month_income
from cte2 a
join cte3 b
on a.Department = b.Department
Order by TotalWorkingYears, MonthlyIncome

/* Additional table to compare employees' salaries to average salaries in thta department */
create table avg_salaries_departments (
department varchar(25),
avg_salary decimal(10, 0)
)

insert into avg_salaries_departments
(department, avg_salary)
values ('Research & Development', 6300),
('Sales', '3800'),
('Human Resources', 5000)

/* What percentage of employees have PhD, Master Degree, etc */
with cte4 as (
Select *,
case when Education = 1 then 'Below College' 
when Education = 2 then 'College'  
when Education = 3 then 'Bachelor'  
when Education = 4 then 'Master'
 when Education = 5 then 'PhD' else null end as education_lvl
from ibm_employees
)
select distinct education_lvl,
round(100 * count(*) over (partition by education_lvl) / count(*) over (), 2) as percentage_education from cte4

/* Which Department is the Biggest? */ 
Select distinct department, 
count(*) over (partition by department) as n_employees,
round( 100 * count(*) over (partition by department) / count(*) over (), 2) as percentage_department
from ibm_employees
Order by percentage_department desc

alter table ibm_employees
add column experience text

/* Labelling each education level properly */
with cte as (
select *, 
	case when b.Education = 1 then 'Below College' 
when b.Education = 2 then 'College'  
when b.Education = 3 then 'Bachelor'  
when b.Education = 4 then 'Master'
when b.Education = 5 then 'PhD' 
	else null end as education_level,
	case when b.PerformanceRating = 1 then 'Low' 
when b.PerformanceRating = 2 then 'Good'  
when b.PerformanceRating = 3 then 'Excellent'  
when b.PerformanceRating = 4 then 'Outstanding'
	else null end as productivity1,
	case when b.TotalWorkingYears <=  2 then 'No/Little Experience' 
when b.TotalWorkingYears <= 5 then 'Moderately Experienced'  
when b.TotalWorkingYears <= 10 then 'Experienced'  
	else 'Senior' end as experience1
from ibm_employees b
)
Update ibm_employees a
join cte b 
on a.EmployeeNumber = b.EmployeeNumber 
Set a.education_lvl = b.education_level,
a.productivity = b.productivity1,
a.experience = b.experience1

select Education, education_lvl,
performancerating, productivity,
totalworkingyears, experience
from ibm_employees


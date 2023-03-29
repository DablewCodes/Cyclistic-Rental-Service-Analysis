For usage info about each query, read the documentation document.

Select count(Column_name) from data-project-371810.Chicago_employees_dataset.Employees where Column_name is Null

Create table data-project-371810.Chicago_employees_dataset.Employees_v1 as
(Select * from data-project-371810.Chicago_employees_dataset.Employees where Full_or_Part_time is not Null)

Select Distinct count(*) from data-project-371810.Chicago_employees_dataset.Employees_v1

Create table data-project-371810.Chicago_employees_dataset.Employees_v2 as
(Select Name, Job_Titles, Department, Full_or_Part_Time, Salary_or_Hourly, Typical_Hours, cast(Annual_Salary as int64) as Annual_Salary, Hourly_Rate from data-project-371810.Chicago_employees_dataset.Employees_v1)

Select (count(*)/(Select count(*) from data-project-371810.Chicago_employees_dataset.Employees_v2))*100 from data-project-371810.Chicago_employees_dataset.Employees_v2 where Full_or_Part_Time = "P"

Select (count(*)/(Select count(*) from data-project-371810.Chicago_employees_dataset.Employees_v2))*100 from data-project-371810.Chicago_employees_dataset.Employees_v2 where Salary_or_Hourly = "SALARY"

Select (count(*)/6951)*100 from data-project-371810.Chicago_employees_dataset.Employees_v2 where Typical_Hours = 40

Select avg(Annual_Salary) from data-project-371810.Chicago_employees_dataset.Employees_v2 where Salary_or_Hourly = "SALARY"

Select Job_Titles, avg(Annual_Salary) as Avg_Salary from data-project-371810.Chicago_employees_dataset.Employees_v2 group by Job_Titles order by Avg_Salary DESC limit 50

Select Department, avg(Annual_Salary) as Avg_Salary from data-project-371810.Chicago_employees_dataset.Employees_v2 group by Department order by Avg_Salary DESC

Select avg(Typical_Hours * Hourly_Rate * 49), avg(Annual_Salary) from data-project-371810.Chicago_employees_dataset.Employees_v2
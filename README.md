# Pewlett-Hackard-Analysis

## Overview

Pewlett Hackard is a large company boasting several thousand employees, among whom is a large number of employees who in the near future will begin to retire. The company wants to be prepared for the "silver tsunami" in which, in addition, the experience of employees to retire can be used to train new employees and make the transition easier, that is, through the creation of a Mentorship Program. So, we have prepared an analysis in which we obtained the following:

- The number of employees to be retired according to their title.
- The number of positions to be filled.
- The number of positions to fill grouped by title and department.
- Identified employees who are eligible to participate in a Mentorship Program.
- The number of employees eligible to participate in the Mentorship Program grouped by department and position.

## Results

For this analysis we got the information of the company from six .csv files and we used PostgreSQL, pgAdmin 4 to prepare, read and get the data we need.

First, we made an entity-relationship diagram (ERD) which allowed us to connect the different tables with the information to perform our analysis. 

![QuickDBD-export](https://user-images.githubusercontent.com/113747210/202033761-5d206889-eb08-429c-b7bd-a6e905b924f4.png)

Then we wrote our queries on pgAdmin to get the following data:

1.	The list of employees who are retiring in the next years.

<img width="286" alt="list_retiring_employees" src="https://user-images.githubusercontent.com/113747210/202033845-51599f67-36c4-43f7-ac81-6d25e004d26b.png">


2.	A table that contains the number of titles filled by employees who are retiring.

<img width="128" alt="retiring_titles" src="https://user-images.githubusercontent.com/113747210/202034834-35a7fea8-e326-42a1-8955-36ba9405552b.png">

3.	A table for current employees who are eligible for the Mentorship Program

<img width="368" alt="mentorship_program" src="https://user-images.githubusercontent.com/113747210/202034004-758a7138-f4db-4d37-af1a-e05099706328.png">

## Summary

To sum up, and to give the company the necessary tools to face the upcoming “silver tsunami”, we provide response to the following questions to have the complete picture of the amount of staff who will be retiring, the positions that need to be filled, the departments, and the staff that can mentor the new employees.

•	How many roles will need to be filled as the "silver tsunami" begins to make an impact?

As we can see from the retirement titles table there are 72,458 employees who will be retiring in the next few years, also made a query that show us the number of positions that needs to be filled by title and by department. In the next picture we can observe the position with the most retirements, Senior Engineers from the departments of Development, and Production, Senior Staff from Sales department.

<img width="207" alt="retiring_bydepartment" src="https://user-images.githubusercontent.com/113747210/202034377-de0a3b6d-0a4c-467d-98d7-f5d4371c7002.png">


We also made an extra query for the employees eligible for the Mentorship Program by department and position as we can see in the picture below:

<img width="366" alt="mentorship_bydepartment" src="https://user-images.githubusercontent.com/113747210/202034302-fa443af0-ab91-4c04-8233-b0aea7eca25f.png">

•	Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

With the data we retrieved we can see enough personnel to enter the Mentorship Program to train the new employees because there are staff from all the departments and different level of positions to prepare the future workforce of the company.





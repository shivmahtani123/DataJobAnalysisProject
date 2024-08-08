# Top Paying Jobs and Most Optimal Skills For Data Analysts In Canada and India (Or Remote)

## Introduction
The main objective of this project is to guide and inform aspiring data analysts, including myself, who want to work in Canada or India, on the job titles available as well as the corresponding companies and top salaries offered for those roles.

From there, we can move forward to understand the specific skills that are required and in demand for those jobs in data analyst and business analyst roles, such as SQL, Power BI, Python, Azure, AWS and more. 

Furthermore, we aim to explore which of these skills may result in higher average salaries and, given the salary, which skills are most optimal to learn in order to be successful as a data or business analyst. 

## Background

In these queries, Canada, India and remote jobs are all considered. Additionally, since we want to narrow our search to entry-level jobs without the need for a master's degree, we also filter the job postings that don't mention a degree requirement.

Since I am Indian, and I study in Canada, these filters are for the purpose of understanding the dynamics of the job market according to my search parameters. I hope that these insights can help others in a similar position.

SQL queries: [project_sql](/project_sql/)

## Questions Answered
1. What are the top paying jobs for Data Analysts in Canada/India?
2. What skills are required for these top paying jobs?
3. Which skills are most in demand for the role of Data Analysts in Canada/India
4. Which skills pay the most for these roles?
5. What are the most optimal skills to learn for Data Analysts in Canada/India based on salary and demand?

## Tools
- **SQL** - The dominant tool I used to clean, sort, reference, analyze and extract critical information from the database
- **PostgreSQL** - The database management system of choice to process the large dataset
- **Power BI** - The visualization software I used
- **Git & GitHub** - To manage my project and repository
- **Visual Studio Code** - The efficient and user-friendly editor I used

## Analysis
Detail the methods and procedures used in the project. Explain the data analysis process, algorithms implemented, and any experiments conducted.

### 1. What are the top paying jobs for Data Analysts in Canada/India?
```sql
SELECT 
    job_id,
    company_dim.name as "Company Name",
    job_title_short,
    job_title, 
    job_location,
    job_no_degree_mention,
    job_work_from_home,
    salary_year_avg
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short IN('Data Analyst') AND
    salary_year_avg IS NOT NULL AND
    (job_country = 'Canada'
    OR job_country = 'India' OR job_work_from_home = TRUE) AND
    job_no_degree_mention = TRUE
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
### Insights


## Conclusion
Summarize the  key findings and results of the project. Discuss the significance of the outcomes and how they address the initial objectives.

## What I Learned
Reflect on the learning experiences gained from the project. Highlight new skills acquired, challenges faced, and how they were overcome.





WITH top_paying_jobs AS(SELECT 
    job_id,company_dim.name as "Company Name",job_title,job_title_short,salary_year_avg
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short IN('Data Analyst','Business Analyst') AND 
    salary_year_avg IS NOT NULL AND 
    (job_country = 'Canada' 
    OR job_work_from_home = TRUE)
ORDER BY 
    salary_year_avg DESC
LIMIT 10)

SELECT 
    top_paying_jobs.*,skills_dim.skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC;
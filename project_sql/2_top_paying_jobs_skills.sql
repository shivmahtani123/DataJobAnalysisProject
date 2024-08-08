WITH top_paying_jobs AS(SELECT 
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
LIMIT 10)

SELECT 
    top_paying_jobs.*,skills_dim.skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC;

/* INNER JOIN is used instead of LEFT JOIN because 
 some job_ids are not associated with any skill */ 
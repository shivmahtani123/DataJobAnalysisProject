SELECT 
    job_id,
    company_dim.name as "Company Name",
    job_title_short,
    job_title,
    job_location,
    job_work_from_home,
    salary_year_avg
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
LIMIT 20;


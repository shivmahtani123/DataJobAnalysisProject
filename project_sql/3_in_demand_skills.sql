SELECT
    skills,COUNT(*) AS demand_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short IN('Data Analyst','Business Analyst') AND 
    (job_country = 'Canada' 
    OR job_work_from_home = TRUE)
GROUP BY
    skills
ORDER BY
    COUNT(*) DESC
LIMIT 10;




/*these are the most in demand skills. 
This means that if you were looking for a job in Data Analyst or a 
Business Analyst position, these are the skills you would want to know. 
This doesn't necessarily mean that these skills will guarantee you 
the highest salary though. */ 
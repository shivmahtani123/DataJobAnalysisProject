SELECT
    DISTINCT skills_dim.skills,
    COUNT(job_postings_fact.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg)) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short IN ('Data Analyst') AND 
    job_postings_fact.salary_year_avg IS NOT NULL AND 
    (job_postings_fact.job_country = 'Canada' OR 
    job_postings_fact.job_country = 'India' OR 
    job_postings_fact.job_work_from_home = TRUE) AND
    job_postings_fact.job_no_degree_mention = TRUE
GROUP BY
    skills_dim.skills
HAVING
    COUNT(job_postings_fact.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC;


/*DISTINCT used in SELECT because some skills like sas and mongodb have 
duplicates but a different skill_id. This doesn't affect results. Sample can be seen
in 5_optimal_skills.sql */

/* Demand count for higher-salary associated skills
tend to be lower as we are filtering for those job postings where
no degree is mentioned. Entry level jobs likely don't except these 
highly specialized or cloud-based skills  */
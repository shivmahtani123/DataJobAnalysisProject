SELECT
    skills,
    ROUND(AVG(salary_year_avg)) as avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short IN('Data Analyst') AND
    salary_year_avg IS NOT NULL AND
    (job_country = 'Canada'
    OR job_country = 'India' OR job_work_from_home = TRUE) AND
    job_no_degree_mention = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 15;


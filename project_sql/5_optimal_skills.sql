WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(*) AS demand_count
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short IN('Data Analyst','Business Analyst') AND 
        salary_year_avg IS NOT NULL AND 
        (job_country = 'Canada' OR 
        job_work_from_home = TRUE)
    GROUP BY
        skills_dim.skill_id
), average_salary AS (
    SELECT
        skills_dim.skill_id,
        ROUND(AVG(salary_year_avg)) as avg_salary
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short IN('Data Analyst','Business Analyst') AND 
        salary_year_avg IS NOT NULL AND 
        (job_country = 'Canada' OR 
        job_work_from_home = TRUE)
    GROUP BY
        skills_dim.skill_id
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.demand_count,
    average_salary.avg_salary
FROM
    skills_demand
INNER JOIN
    average_salary ON skills_demand.skill_id = average_salary.skill_id
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT 25;

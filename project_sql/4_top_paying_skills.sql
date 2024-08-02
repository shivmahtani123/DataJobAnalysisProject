SELECT
    skills,
    ROUND(AVG(salary_year_avg)) as avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short IN('Data Analyst','Business Analyst') AND 
    salary_year_avg IS NOT NULL AND 
    (job_country = 'Canada' 
    OR job_work_from_home = TRUE)
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/* If you notice, when looking at the jobs in Canada, the top paying skills 
change completely compared to worldwide. Canada doesn't appear to value 
svn, solidity, couchbase, or datarobot a lot while in the whole dataset,
these skills are the top most paying skills. This may be because of the difference
in software being used. This is also because of the number of people or companies
that require these skills have reduced a lot in the past years, while programs
like r, looker, snowflake are newer and more adopted in recent times. 
R is quite popular in Canada in particular*/
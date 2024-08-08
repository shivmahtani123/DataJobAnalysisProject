SELECT 
    TO_CHAR(job_posted_date,'Month') as Month,
    COUNT(*) AS "# of Job Postings"
FROM job_postings_fact
GROUP BY month
ORDER BY COUNT(*) DESC

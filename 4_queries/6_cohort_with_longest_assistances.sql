-- SELECT cohorts.name, AVG(completed_at - started_at)  AS average_assistance_time
-- FROM assistance_requests
-- JOIN students ON students.id = assistance_requests.student_id
-- JOIN cohorts ON cohorts.id = students.cohort_id
-- GROUP BY cohorts.name
-- HAVING AVG(completed_at - started_at) = (
--   SELECT MAX(avg_assist_time)
--     FROM (
--         SELECT AVG(completed_at - started_at) AS avg_assist_time
--         FROM assistance_requests ar
--         JOIN students s ON s.id = ar.student_id
--         JOIN cohorts c ON c.id = s.cohort_id
--         GROUP BY c.name
--     ) foo
-- )
-- ORDER BY average_assistance_time;


SELECT cohorts.name, avg(completed_at - started_at) as average_assistance_time
FROM assistance_requests 
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;
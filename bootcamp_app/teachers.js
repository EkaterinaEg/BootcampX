const { Pool } = require("pg");

const pool = new Pool({
  user: "vagrant",
  password: "123",
  host: "localhost",
  database: "bootcampx",
});

const cohort_name = process.argv[2];
pool
  .query(
    `
    SELECT DISTINCT teachers.name AS name, cohorts.name AS cohort
    FROM teachers
    JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
    JOIN students ON students.id = assistance_requests.student_id
    JOIN cohorts ON cohorts.id = students.cohort_id
    WHERE cohorts.name LIKE '%${cohort_name}%'
    GROUP BY teachers.name, cohorts.name; 
`
  )
  .then((res) => {
    res.rows.forEach((teacher) => {
      console.log(`${teacher.cohort}: ${teacher.name}`);
    });
  })
  .catch((err) => console.error("query error", err.stack));

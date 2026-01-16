WITH skills_demand AS (
    SELECT skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND job_work_from_home = TRUE
        AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id,
        skills_dim.skills
),
average_salary AS (
    SELECT skills_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND job_work_from_home = TRUE
        AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id,
        skills_dim.skills
)
SELECT skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM skills_demand
    INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY avg_salary DESC,
    demand_count DESC
LIMIT 25;
/*
 What Stands Out
 
 1. Engineering-leaning skills drive higher pay
 Skills like distributed systems, cloud platforms, and backend languages consistently appear at the top of the pay spectrum. These tools are typically used in environments where analysts work closely with engineers, handle large datasets, or support production systems.
 What this means:
 When a data analyst role overlaps with engineering responsibilities, compensation tends to increase.
 
 2. Collaboration and workflow tools matter more than expected
 Tools used for documentation, project tracking, and team collaboration show up alongside high pay. These aren’t analytical tools themselves, but they signal work in larger, more complex organizations where analytics is embedded in structured engineering processes.
 What this means:
 Higher pay often comes with cross-team collaboration and mature workflows, not just technical skill.
 
 3. Cloud data warehouses and platforms are highly valued
 Modern cloud ecosystems and managed data platforms are strongly represented. These tools support scalable analytics and real-time decision-making, which are priorities for companies investing heavily in data.
 What this means:
 Analysts who understand cloud-native data environments are more valuable than those limited to local or legacy systems.
 
 4. Programming languages split into two categories
 There’s a clear distinction between:
 Languages used for analysis and modeling
 Languages used for systems and performance
 The second group tends to align with higher compensation because it pushes the role beyond analysis into building and maintaining data infrastructure.
 What this means:
 Depth in programming matters more than breadth, especially when it supports production systems.
 
 5. Core analytics tools dominate demand, not pay
 Widely used tools like scripting languages, visualization platforms, and statistical software appear very frequently but sit lower in compensation compared to more specialized skills.
 What this means:
 These tools are essential but expected — they get you hired, not highly paid on their own.
 Key Takeaways
 High pay follows complexity, not popularity
 Engineering adjacency increases value
 Cloud and distributed systems experience is a differentiator
 Foundational analytics skills are necessary but not sufficient
 How to Use This Insight
 If your goal is to maximize career growth and compensation:
 Keep core analytics skills strong
 Add cloud, data platform, or engineering-oriented tools
 Position yourself as someone who can build, not just analyze
 Target roles where analytics supports production systems
 If you want, I can also:
 Group these skills into career paths
 Help you decide what to learn next
 Translate this into a resume or portfolio strategy
 
 
 
 [
 {
 "skill_id": 8,
 "skills": "go",
 "demand_count": "27",
 "avg_salary": "115320"
 },
 {
 "skill_id": 234,
 "skills": "confluence",
 "demand_count": "11",
 "avg_salary": "114210"
 },
 {
 "skill_id": 97,
 "skills": "hadoop",
 "demand_count": "22",
 "avg_salary": "113193"
 },
 {
 "skill_id": 80,
 "skills": "snowflake",
 "demand_count": "37",
 "avg_salary": "112948"
 },
 {
 "skill_id": 74,
 "skills": "azure",
 "demand_count": "34",
 "avg_salary": "111225"
 },
 {
 "skill_id": 77,
 "skills": "bigquery",
 "demand_count": "13",
 "avg_salary": "109654"
 },
 {
 "skill_id": 76,
 "skills": "aws",
 "demand_count": "32",
 "avg_salary": "108317"
 },
 {
 "skill_id": 4,
 "skills": "java",
 "demand_count": "17",
 "avg_salary": "106906"
 },
 {
 "skill_id": 194,
 "skills": "ssis",
 "demand_count": "12",
 "avg_salary": "106683"
 },
 {
 "skill_id": 233,
 "skills": "jira",
 "demand_count": "20",
 "avg_salary": "104918"
 },
 {
 "skill_id": 79,
 "skills": "oracle",
 "demand_count": "37",
 "avg_salary": "104534"
 },
 {
 "skill_id": 185,
 "skills": "looker",
 "demand_count": "49",
 "avg_salary": "103795"
 },
 {
 "skill_id": 2,
 "skills": "nosql",
 "demand_count": "13",
 "avg_salary": "101414"
 },
 {
 "skill_id": 1,
 "skills": "python",
 "demand_count": "236",
 "avg_salary": "101397"
 },
 {
 "skill_id": 5,
 "skills": "r",
 "demand_count": "148",
 "avg_salary": "100499"
 },
 {
 "skill_id": 78,
 "skills": "redshift",
 "demand_count": "16",
 "avg_salary": "99936"
 },
 {
 "skill_id": 187,
 "skills": "qlik",
 "demand_count": "13",
 "avg_salary": "99631"
 },
 {
 "skill_id": 182,
 "skills": "tableau",
 "demand_count": "230",
 "avg_salary": "99288"
 },
 {
 "skill_id": 197,
 "skills": "ssrs",
 "demand_count": "14",
 "avg_salary": "99171"
 },
 {
 "skill_id": 92,
 "skills": "spark",
 "demand_count": "13",
 "avg_salary": "99077"
 },
 {
 "skill_id": 13,
 "skills": "c++",
 "demand_count": "11",
 "avg_salary": "98958"
 },
 {
 "skill_id": 186,
 "skills": "sas",
 "demand_count": "63",
 "avg_salary": "98902"
 },
 {
 "skill_id": 7,
 "skills": "sas",
 "demand_count": "63",
 "avg_salary": "98902"
 },
 {
 "skill_id": 61,
 "skills": "sql server",
 "demand_count": "35",
 "avg_salary": "97786"
 },
 {
 "skill_id": 9,
 "skills": "javascript",
 "demand_count": "20",
 "avg_salary": "97587"
 }
 ] */
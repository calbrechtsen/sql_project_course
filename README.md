📊 High-Paying Skills for Remote Data Analysts
📌 Introduction

This project analyzes which skills are both in demand and highly paid for remote Data Analyst roles.
Rather than focusing only on popular tools, the analysis highlights skills that command higher salaries, helping data professionals make more strategic learning and career decisions.

The dataset contains job postings with associated skills and salary information. Using SQL, I aggregated demand counts and average salaries to identify the top 25 highest-paying skills for remote data analysts with reported salaries.

🛠 Tools I Used

SQL – Data extraction, joins, aggregations, and filtering

PostgreSQL (or compatible SQL engine)

CTEs (Common Table Expressions) – Clean, readable query structure

Data Visualization (optional)

Python (Pandas, Matplotlib / Seaborn)

Tableau / Power BI

Excel

🔍 The Analysis
Query Overview

The analysis is built using two CTEs:

skills_demand

Counts how often each skill appears in remote Data Analyst job postings

average_salary

Calculates the average salary associated with each skill

These are joined to surface skills that are:

Remote-friendly

Salary-reported

In meaningful demand (>10 postings)

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
      AND job_work_from_home = TRUE
      AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id, skills_dim.skills
),
average_salary AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
      AND job_work_from_home = TRUE
      AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id, skills_dim.skills
)
SELECT 
    sd.skill_id,
    sd.skills,
    sd.demand_count,
    av.avg_salary
FROM skills_demand sd
INNER JOIN average_salary av 
    ON sd.skill_id = av.skill_id
WHERE sd.demand_count > 10
ORDER BY av.avg_salary DESC, sd.demand_count DESC
LIMIT 25;

📈 Visual Insights
💰 Average Salary by Skill (Top 25)

(Bar chart — Avg Salary)

📌 Insight:
Engineering-adjacent skills such as Go, Hadoop, Snowflake, and Cloud platforms dominate the top salary range.

Example visualization:

| Go        | ██████████████████ $115k
| Hadoop   | █████████████████  $113k
| Snowflake| ████████████████   $113k

📊 Skill Demand vs Salary

(Scatter plot — Demand vs Avg Salary)

📌 Insight:

Some skills (Python, Tableau, SQL) have very high demand but moderate pay

Others (Go, Cloud tools) show lower demand but much higher compensation

This highlights that salary follows complexity, not popularity.

🧠 Skill Categories by Pay Level

(Optional grouped bar or color-coded chart)

Category	Examples	Pay Trend
Core Analytics	Python, R, Tableau	Medium
Cloud Platforms	AWS, Azure, BigQuery	High
Engineering / Systems	Go, Java, Hadoop	Very High
Collaboration Tools	Jira, Confluence	Surprisingly High
🧠 What I Learned
1. Engineering-leaning skills pay more

Skills tied to systems, infrastructure, and scalability consistently earn higher salaries.

Takeaway:
When analytics overlaps with engineering, compensation increases.

2. Cloud platforms are a major differentiator

Modern data stacks rely heavily on cloud-native tools like AWS, Azure, Snowflake, and BigQuery.

Takeaway:
Understanding cloud data environments significantly increases market value.

3. Popular ≠ Highly Paid

Python, Tableau, and SQL appear everywhere — but they do not top the salary rankings.

Takeaway:
These tools are expected, not differentiating.

4. Workflow & collaboration tools signal maturity

Tools like Jira and Confluence correlate with higher pay, indicating work in larger, structured organizations.

Takeaway:
Higher pay often comes with cross-team collaboration and mature data processes.

🧾 Conclusion

This analysis shows that high compensation for data analysts is driven by complexity and proximity to engineering, not just analytical proficiency.

🔑 Key Takeaways

High pay follows technical depth, not popularity

Cloud and distributed systems experience matter

Core analytics skills are necessary but insufficient alone

Analysts who build systems, not just dashboards, earn more

🎯 How to Use This Insight

If your goal is career growth and higher compensation:

Maintain strong core analytics skills

Add cloud, data platform, or engineering-adjacent tools

Position yourself as someone who can build and scale, not just analyze

📬 Next Steps (Optional Enhancements)

Group skills into learning roadmaps

Create a resume or portfolio strategy

Build dashboards from this data

Add Python notebooks for visualization

If you want, I can:
✅ Add Python visualization code
✅ Convert this into a portfolio blog post
✅ Optimize it for recruiters
✅ Create a skills learning roadmap

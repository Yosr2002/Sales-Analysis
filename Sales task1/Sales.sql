use final
-----------------------------------------------------------
--1- Number of employee-----
SELECT COUNT(*) AS TotalEmployees
FROM ['All data $'];
-------------------------------------------------------------
--2- Male to Females employee-----------------

SELECT 
    Gender , 
    COUNT(*) AS TotalEmployees, 
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ['All data $'])) AS Percentage
FROM ['All data $']
WHERE Gender IS NOT NULL
GROUP BY 
    Gender;
	---------------------------------------------------------------
	--3- employee distribution based on department----------
SELECT 
    Department, 
    COUNT(*) AS TotalEmployees
FROM 
    ['All data $']
WHERE 
    Department IS NOT NULL
GROUP BY 
    Department
ORDER BY 
    TotalEmployees DESC;
--------------------------------------------------------------------
--4-- Retention Rate-----------------------------------------
	SELECT 
    (COUNT(CASE WHEN Attrition = 'No' THEN 1 END) * 100.0 / COUNT(*)) AS RetentionRate
FROM 
    ['All data $'];
--------------------------------------------------------------------------
--5- Years at company-----------------------------
SELECT 
    AVG(YearsAtCompany) AS AvgYearsAtCompany
FROM 
   ['All data $'];
-------------------------------------------------------------------
--6-YearsInMostRecentRole-----------------------------------
   SELECT 
    AVG(YearsInMostRecentRole) AS AvgYearsInRole
FROM 
    ['All data $'];
--------------------------------------------------------------
--7- Employee Distribution Based on Age------------------------
SELECT 
    Age, 
    COUNT(*) AS TotalEmployees
FROM 
   ['All data $']
WHERE 
    Age IS NOT NULL
GROUP BY 
    Age
ORDER BY 
    Age;

------------------------------------------------------------------
--8-- Employee Based on Over time-----------------------------
	SELECT 
    CASE 
        WHEN OverTime IS NOT NULL THEN 'Has OverTime'
        ELSE 'No OverTime'
    END AS OverTimeStatus, 
    COUNT(*) AS TotalEmployees
FROM 
    ['All data $']
GROUP BY 
    CASE 
        WHEN OverTime IS NOT NULL THEN 'Has OverTime'
        ELSE 'No OverTime'
    END;
--------------------------------------------------------------------
--9--EDUCATION---------------------------------------------------
	SELECT 
    Education, 
    COUNT(*) AS TotalEmployees
FROM 
 ['All data $']
 WHERE 
    Education IS NOT NULL

GROUP BY 
    Education 
ORDER BY 
    Education;
--------------------------------------------------------------------
--10--MaritalStatus-----------------------------------------
SELECT 
    MaritalStatus, 
    COUNT(*) AS TotalEmployees
FROM 
    ['All data $']
	 WHERE 
   MaritalStatus IS NOT NULL
GROUP BY 
    MaritalStatus;
--------------------------------------------------------------------
--11-Salary by Departments----

	SELECT 
    Department, 
    AVG(Salary) AS AvgSalary
FROM 
  ['All data $']
  WHERE 
    Department IS NOT NULL
    AND Salary IS NOT NULL
GROUP BY 
    Department
ORDER BY 
    AvgSalary DESC;

-----------------------------------------------------------
--12-JOB ROLE--------------------------------------------
SELECT 
    JobRole, 
    COUNT(*) AS TotalEmployees
FROM 
   ['All data $']
   WHERE 
    JobRole IS NOT NULL
GROUP BY 
    JobRole
ORDER BY 
    TotalEmployees DESC;
--------------------------------------------------------------
------------------------------------------------------------


-- 1-Performance and Satisfaction Correlation--
--1-EnvironmentSatisfaction &SelfRating& ManagerRating
 SELECT 
    EnvironmentSatisfaction, 
    AVG(SelfRating) AS AvgSelfRating, 
    AVG(ManagerRating) AS AvgManagerRating
FROM 
   ['All data $']
WHERE 
    EnvironmentSatisfaction IS NOT NULL
GROUP BY 
    EnvironmentSatisfaction
ORDER BY 
    EnvironmentSatisfaction;
   ------------------------------------------
   --2-JobSatisfaction & SelfRating & ManagerRating
   SELECT 
    JobSatisfaction, 
    AVG(SelfRating) AS AvgSelfRating, 
    AVG(ManagerRating) AS AvgManagerRating
FROM 
    ['All data $']
WHERE 
    JobSatisfaction IS NOT NULL
GROUP BY 
    JobSatisfaction
ORDER BY 
    JobSatisfaction;
-----------------------------------------------------------
--3-RelationshipSatisfaction &SelfRating & Manager Rating
SELECT 
    RelationshipSatisfaction, 
    AVG(SelfRating) AS AvgSelfRating, 
    AVG(ManagerRating) AS AvgManagerRating
FROM 
   ['All data $']
WHERE 
    RelationshipSatisfaction IS NOT NULL
GROUP BY 
    RelationshipSatisfaction
ORDER BY 
    RelationshipSatisfaction;
	------------------------------------------------------
	--4-Worklifebalance & SelfRating & ManagerRating
	SELECT 
    WorkLifeBalance, 
    AVG(SelfRating) AS AvgSelfRating, 
    AVG(ManagerRating) AS AvgManagerRating
FROM 
    ['All data $']
WHERE 
    WorkLifeBalance IS NOT NULL
GROUP BY 
    WorkLifeBalance
ORDER BY 
    WorkLifeBalance;
--------------------------------------------------
--5-WorklifeBalance & Jobsatisfaction
SELECT 
    WorkLifeBalance, 
    AVG(JobSatisfaction) AS AvgJobSatisfaction
FROM 
   ['All data $']
WHERE 
    WorkLifeBalance IS NOT NULL
GROUP BY 
    WorkLifeBalance
ORDER BY 
    WorkLifeBalance;
----------------------------------------------------------------
--  6-TrainingOpportunitiesTaken& selfRating &ManagerRating
SELECT 
    TrainingOpportunitiesTaken, 
    AVG(SelfRating) AS AvgSelfRating, 
    AVG(ManagerRating) AS AvgManagerRating
FROM 
    ['All data $']
WHERE 
    TrainingOpportunitiesTaken IS NOT NULL
GROUP BY 
    TrainingOpportunitiesTaken
ORDER BY 
    TrainingOpportunitiesTaken;



	-----------------------------------------------------
	--2- Attrition and Retention-----------------------
--------------------------------------------------------------
--1-Predictors of Attrition
SELECT 
    JobSatisfaction,
    WorkLifeBalance,
    AVG(YearsAtCompany) AS AvgYearsAtCompany,
    AVG(Salary) AS AvgSalary,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM 
    ['All data $']
WHERE 
    JobSatisfaction IS NOT NULL 
    AND WorkLifeBalance IS NOT NULL
GROUP BY 
    JobSatisfaction, WorkLifeBalance
ORDER BY 
    AttritionCount DESC;
-----------------------------------------------------------------
-- 2-Impact of Overtime on Attrition
SELECT 
    OverTime,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM 
    ['All data $']
WHERE 
    OverTime IS NOT NULL
GROUP BY 
    OverTime
ORDER BY 
    AttritionCount DESC;
	---------------0000000000000000000000000000000000000000000000000------------------------------------------
	--3- Years with Current Manager & Attrition
	SELECT 
    YearsWithCurrManager,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM 
    ['All data $']
WHERE 
    YearsWithCurrManager IS NOT NULL
GROUP BY 
    YearsWithCurrManager
ORDER BY 
    AttritionCount DESC;
-----------------------------------------------------------------
--3- Distance from Home & Attrition
SELECT 
    [DistanceFromHome (KM)],
    COUNT(DISTINCT EmployeeID) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM 
    ['All data $']
GROUP BY 
    [DistanceFromHome (KM)]
ORDER BY 
    AttritionCount DESC;

------------------------------------------------------------------------
--3-employee demographics and performance:--------------
--1--Age and Performance----------------------
SELECT 
    Age,
    AVG(SelfRating) AS AvgSelfRating,
    AVG(ManagerRating) AS AvgManagerRating,
    AVG(JobSatisfaction) AS AvgJobSatisfaction
FROM 
    ['All data $']
WHERE 
    Age IS NOT NULL AND 
    SelfRating IS NOT NULL AND 
    ManagerRating IS NOT NULL AND 
    JobSatisfaction IS NOT NULL
GROUP BY 
    Age
ORDER BY 
    Age;

----------------------------------------------------
--2-Department and Job Role Comparison--------------

SELECT 
    Department,
    JobRole,
    AVG(SelfRating) AS AvgSelfRating,
    AVG(ManagerRating) AS AvgManagerRating,
    COUNT(*) AS TotalEmployees
FROM 
    ['All data $']
WHERE 
    Department IS NOT NULL AND 
    JobRole IS NOT NULL AND 
    SelfRating IS NOT NULL AND 
    ManagerRating IS NOT NULL
GROUP BY 
    Department, JobRole
ORDER BY 
    AvgSelfRating DESC;

------------------------------------------------------------
--3-Business Travel Impact on Job Satisfaction and Attrition--
SELECT 
    BusinessTravel,
    AVG(JobSatisfaction) AS AvgJobSatisfaction,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
    COUNT(*) AS TotalEmployees
FROM 
    ['All data $']
WHERE 
    BusinessTravel IS NOT NULL AND 
    JobSatisfaction IS NOT NULL
GROUP BY 
    BusinessTravel
ORDER BY 
    AttritionCount DESC;


------------------------------------------------------------------
--4-Salary, Education, and Promotion insights--

--1--Average Salary by Education Level--
SELECT 
    Education,
    AVG(Salary) AS AvgSalary,
    COUNT(*) AS TotalEmployees
FROM 
    ['All data $']
WHERE 
    Education IS NOT NULL AND 
    Salary IS NOT NULL
GROUP BY 
    Education
ORDER BY 
    AvgSalary DESC;
--------------------------------------------------------------
--2-Salary Distribution by Promotion Status--------------
SELECT 
    YearsSinceLastPromotion,
    AVG(Salary) AS AvgSalary,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM 
    ['All data $']
WHERE 
    YearsSinceLastPromotion IS NOT NULL AND 
    Salary IS NOT NULL
GROUP BY 
    YearsSinceLastPromotion
ORDER BY 
    YearsSinceLastPromotion;
-------------------------------------------------------------------
--3-Impact of Education on Promotion Rates---------
SELECT 
    Education,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN YearsSinceLastPromotion > 0 THEN 1 ELSE 0 END) AS PromotedCount,
    AVG(Salary) AS AvgSalary
FROM 
   ['All data $']
WHERE 
    Education IS NOT NULL AND 
    YearsSinceLastPromotion IS NOT NULL AND 
    Salary IS NOT NULL
GROUP BY 
    Education
ORDER BY 
    PromotedCount DESC;
------------------------------------------------------------------
--4-Salary Increase by Education Level--------------------------
SELECT 
    Education,
    AVG(Salary) AS AvgSalary,
    AVG(YearsSinceLastPromotion) AS AvgYearsSinceLastPromotion,
    COUNT(*) AS TotalEmployees
FROM 
    ['All data $']
WHERE 
    Education IS NOT NULL AND 
    Salary IS NOT NULL AND 
    YearsSinceLastPromotion IS NOT NULL
GROUP BY 
    Education
ORDER BY 
    AvgSalary DESC;
-----------------------------------------------------------------------------
----6- Diversity and Inclusion Insights----------
--1-Ethnicity and JobRole Distribution----
SELECT 
    Ethnicity,
    JobRole,
    COUNT(*) AS TotalEmployees
FROM 
    ['All data $']
WHERE 
    Ethnicity IS NOT NULL AND 
    JobRole IS NOT NULL
GROUP BY 
    Ethnicity, JobRole
ORDER BY 
    TotalEmployees DESC;
	------------------------------------------------
	--2- Gender and Job Satisfaction Levels---------
	SELECT 
    Gender,
    AVG(JobSatisfaction) AS AvgJobSatisfaction,
    AVG(SelfRating) AS AvgSelfRating,
    AVG(ManagerRating) AS AvgManagerRating,
    COUNT(*) AS TotalEmployees
FROM 
   ['All data $']
WHERE 
    Gender IS NOT NULL AND 
    JobSatisfaction IS NOT NULL AND 
    SelfRating IS NOT NULL AND 
    ManagerRating IS NOT NULL
GROUP BY 
    Gender
ORDER BY 
    AvgJobSatisfaction DESC;
---------------------------------------------------
--Tenure and Career Development Insights----------
--1-Years in Most Recent Role vs. Satisfaction and Performance-
SELECT 
    YearsInMostRecentRole,
    AVG(JobSatisfaction) AS AvgJobSatisfaction,
    AVG(SelfRating) AS AvgSelfRating,
    AVG(ManagerRating) AS AvgManagerRating,
    COUNT(*) AS TotalEmployees
FROM 
   ['All data $']
WHERE 
    YearsInMostRecentRole IS NOT NULL AND 
    JobSatisfaction IS NOT NULL AND 
    SelfRating IS NOT NULL AND 
    ManagerRating IS NOT NULL
GROUP BY 
    YearsInMostRecentRole
ORDER BY 
    YearsInMostRecentRole;
-----------------------------------------------------
--2--Years at Company vs. Job Satisfaction and Attrition
SELECT 
    YearsAtCompany,
    AVG(JobSatisfaction) AS AvgJobSatisfaction,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM 
    ['All data $']
WHERE 
    YearsAtCompany IS NOT NULL AND 
    JobSatisfaction IS NOT NULL
GROUP BY 
    YearsAtCompany
ORDER BY 
    YearsAtCompany;


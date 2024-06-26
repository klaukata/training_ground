-- @@@ == do it again



-- 1. Recyclable and Low Fat Products - https://leetcode.com/problems/recyclable-and-low-fat-products/?envType=study-plan-v2&envId=top-sql-50
select product_id from products
    where low_fats = "Y" and recyclable = "Y";

-- 2. Find Customer Referee - https://leetcode.com/problems/find-customer-referee/description/?envType=study-plan-v2&envId=top-sql-50
-- @@@
select name 
    from Customer
    where not referee_id = 2 or referee_id is null
    order by name desc;

-- 3.  Big Countries - https://leetcode.com/problems/big-countries/description/?envType=study-plan-v2&envId=top-sql-50
select name, population, area 
    from world
    where area >= 3000000 or population >= 25000000
    order by name;

-- 4. Article Views I -  https://leetcode.com/problems/article-views-i/description/?envType=study-plan-v2&envId=top-sql-50
select distinct author_id as id
    from Views
    where author_id = viewer_id
    order by id;

-- 5. Invalid Tweets - https://leetcode.com/problems/invalid-tweets/description/?envType=study-plan-v2&envId=top-sql-50
select tweet_id
    from tweets
    where length(content) > 15;

-- Basic Joins
-- 1. Replace Employee ID With The Unique Identifier - https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/description/?envType=study-plan-v2&envId=top-sql-50
-- @@@
select EmployeeUNI.unique_id, name
    from Employees
    left join EmployeeUNI on Employees.id = EmployeeUNI.id;

-- 2. Product Sales Analysis I - https://leetcode.com/problems/product-sales-analysis-i/description/?envType=study-plan-v2&envId=top-sql-50
select p.product_name, year, price
    from sales
    left join product as p on sales.product_id = p.product_id
    order by p.product_name

-- 3. Customer Who Visited but Did Not Make Any Transactions - https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/description/?envType=study-plan-v2&envId=top-sql-50
-- @@@
select customer_id, count(customer_id) as count_no_trans
    from Visits
    left join Transactions on Transactions.visit_id = Visits.visit_id
    where Transactions.transaction_id is null
    group by customer_id

-- 4. Rising Temperature - https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50
-- @@
select w1.id
    from Weather w1, Weather w2
    where datediff(w1.recordDate, w2.recordDate) = 1 and w1.temperature > w2.temperature
select w1.id
    from Weather w1, Weather w2
    where w1.id - w2.id = 1 and w1.temperature > w2.temperature

-- 6. Employee Bonus - https://leetcode.com/problems/employee-bonus/description/?envType=study-plan-v2&envId=top-sql-50
select name, bonus
    from Employee
    left join Bonus on Employee.empId = Bonus.empId
    where bonus < 1000 or bonus is null;

-- 7. Students and Examinations - https://leetcode.com/problems/students-and-examinations/description/?envType=study-plan-v2&envId=top-sql-50
-- @@@
select st.student_id, st.student_name, su.subject_name, count(e.subject_name) as attended_exams
    from Students st
    join Subjects su
    left join Examinations e on st.student_id = e.student_id and su.subject_name = e.subject_name
    group by st.student_id, su.subject_name
    order by st.student_id
select 
    st.student_id,
    st.student_name,
    su.subject_name,
    count(e.subject_name) as attended_exams
    from Students st
    join Subjects su
    left join Examinations e on e.student_id = st.student_id and su.subject_name = e.subject_name
    group by st.student_id, su.subject_name
    order by st.student_id

-- 8. Managers with at Least 5 Direct Reports - https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/?envType=study-plan-v2&envId=top-sql-50
-- @@@
select name
    from Employee
    where id in (
        select managerId
        from Employee
        group by managerId
        having count(managerId) >= 5
    )
-- EMPLOYEE 테이블에서 '해외영업1부'에 속한 모든 직원의 이름, 직급, 급여를 조회하시오.
select
    dept_id
from
    department
where
    dept_title='해외영업1부';
select
    emp_name 이름,
    job_code 직급,
    salary 급여
from
    employee
where
    dept_code in (
        select
            dept_id
        from
            department
        where
            dept_title = '해외영업1부'

    );

-- EMPLOYEE 테이블에서 모든 직원의 평균 급여보다 높은 급여를 받는 직원의 이름과 급여를 조회하시오.
select
    emp_name,
    salary
from
    employee
where
    salary > all(
        select
            avg(salary)
        from
            employee
    );

-- EMPLOYEE 테이블에서 각 부서의 평균 급여보다 높은 급여를 받는 직원의 이름, 부서명, 급여를 조회하시오.
select
    emp_name,
    dept_code,
    salary
from
    employee a
where
    salary > all(
        select
            avg(salary)
        from
            employee b
        group by dept_code
        having a.dept_code = b.dept_code

    );

-- 상관서브쿼리문제
-- EMPLOYEE 테이블에서 각 부서별로 가장 높은 급여를 받는 직원의 이름, 부서명, 급여를 조회하시오.
select
    dept_code,
    max(salary)
from
    employee
group by
    dept_code;
select
    emp_name,
    dept_code,
    salary
from
    employee a
where
    salary = (
        select
            max(salary)
        from
            employee
        where
            dept_code = a.dept_code
    );

-- EMPLOYEE 테이블에서 각 직급별 평균 급여보다 높은 급여를 받는 직원의 이름, 직급, 급여를 조회하시오.
select
    job_code,
    avg(salary)
from
    employee
group by
    job_code;
select
    emp_name 이름,
    job_code 직급,
    salary 급여
from
    employee a
where
    salary = (
        select
            avg(salary)
        from
            employee
        where
            job_code = a.job_code
    );

-- EXISTS 절 문제
-- EXISTS
-- 서브쿼리 결과 집합에 행이 존재하면 참, 행이 존재하지 않으면 거짓
-- DEPARTMENT 테이블에서 직원이 있는 부서의 부서명을 조회하시오.
select
    a.dept_id,
    a.dept_title
from
    department a
where
    exists(
    select
        dept_code
    from
        employee b
    where
        b.dept_code = a.dept_id
           );


-- EMPLOYEE 테이블에서 급여가 가장 높은 직원의 이름과 급여를 조회하시오. (NOT EXISTS 사용)
-- NOT EXISTS
-- 서브쿼리 결과집합에 행이 존재하지 않으면 참, 행이 존재하면 거짓
select
    a.emp_name,
    a.salary
from
    employee a
where
    not exists(
        select
            salary
        from
            employee b
       where
           b.salary > a.salary
    );


-- CTE 문제
-- EMPLOYEE 테이블에서 각 부서별 평균 급여를 계산하고,
-- 평균 급여가 4000000 이상인 부서의 부서명과 평균 급여를 조회하시오.
WITH DeptAvgSalary AS (
    SELECT DEPT_CODE, AVG(SALARY) AS AvgSalary
    FROM EMPLOYEE
    GROUP BY DEPT_CODE
)
SELECT D.DEPT_TITLE, DAS.AvgSalary
FROM DeptAvgSalary DAS
         JOIN DEPARTMENT D ON DAS.DEPT_CODE = D.DEPT_ID
WHERE DAS.AvgSalary >= 4000000;
-- EMPLOYEE 테이블에서 DEPT_CODE가 'D1'인 데이터를 조회하시오.
select
    dept_code
from
    employee
where
    dept_code = 'D1';


-- EMPLOYEE 테이블에서 SALARY가 5000000 이상인 데이터를 조회하시오.
select
    salary
from
    employee
where
    salary >= 5000000;

-- EMPLOYEE 테이블에서 DEPT_CODE가 'D1'이면서 SALARY가 3000000 이상인 데이터를 조회하시오.
select
    *
from
    employee
where
    dept_code = 'D1'
  and
    salary >= 3000000;

-- EMPLOYEE 테이블에서 DEPT_CODE가 'D1'이거나 JOB_CODE가 'J4'인 데이터를 조회하시오.
select
    *
from
    employee
where
    dept_code = 'D1'
OR job_code = 'J4';

-- EMPLOYEE 테이블에서 SALARY가 2000000 이상 4000000 이하인 데이터를 조회하시오.
select
    *
from
    employee
where
    salary >= 2000000 and
    salary <= 4000000;

-- EMPLOYEE 테이블에서 EMP_NAME에 '김'이 포함된 데이터를 조회하시오.
select
    *
from
    employee
where
    emp_name like '%김%';

-- EMPLOYEE 테이블에서 EMP_NAME이 '이'로 시작하는 데이터를 조회하시오.
select
    *
from
    employee
where
    emp_name like '이__';

-- EMPLOYEE 테이블에서 EMAIL이 'greedy.com'으로 끝나는 데이터를 조회하시오.
select
    *
from
    employee
where
    email like '%greedy.com';

-- EMPLOYEE 테이블에서 EMP_NAME이 '송'으로 시작하고 '기'로 끝나는 데이터를 조회하시오.
select
    *
from
    employee
where
    emp_name like '송_기';

-- EMPLOYEE 테이블에서 PHONE이 '010'으로 시작하지 않는 데이터를 조회하시오.
select
    *
from
    employee
where phone not like '010%';

-- EMPLOYEE 테이블에서 DEPT_CODE가 'D1', 'D2', 'D3'인 데이터를 조회하시오.
select
    *
from
    employee
where
    dept_code in('d1', 'd2', 'd3');


-- EMPLOYEE 테이블에서 JOB_CODE가 'J1', 'J2', 'J3'이 아닌 데이터를 조회하시오.
select
    *
from
    employee
where
    job_code not in ('j1','j2','j3');

-- EMPLOYEE 테이블에서 SAL_LEVEL이 'S1', 'S2', 'S3'인 데이터를 조회하시오.
select
    *
from
    employee
where
    sal_level in ('s1','s2','s3');

-- EMPLOYEE 테이블에서 DEPT_CODE가 NULL인 데이터를 조회하시오.
select
    *
from
    employee
where
    dept_code is null;

-- EMPLOYEE 테이블에서 EMAIL이 NULL이 아닌 데이터를 조회하시오.
select
    *
from
    employee
where
    email is not null;

-- 부서코드가 'D6' 이거나 'D8'인 직원의
-- 이름, 부서, 급여를 조회하세요
-- IN 연산자 : 비교하려는 값 목록에 일치하는 값이 있는지 확인
select
    *
from
    employee
where
    dept_code = 'd6' or 'd8' in (emp_name, salary);

-- 이씨성이 아닌 직원의 사번, 이름, 이메일주소 조회
select
    emp_id,
    emp_name,
    email
from
    employee
where
    emp_name not like '이%';

-- J2직급의 급여 200만원 이상 받는 직원이거나
-- J7 직급인 직원의 이름, 급여, 직급코드 조회
select
    emp_name,
    salary,
    job_code
from
    employee
where
    job_code = 'j2' and (salary >= 2000000) or job_code = 'j7';

-- J7 직급이거나 J2 직급인 직원들 중
-- 급여가 200만원 이상인 직원의
-- 이름, 급여, 직급코드를 조회하세요
select
    emp_name,
    salary,
    job_code
from
    employee
where
    (job_code = 'j7' or  job_code = 'j2') and salary >= 2000000;
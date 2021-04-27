import express from 'express'
import moment from "moment"
import db from '../database/index.js'


const router = express.Router();


router.get('/managers_count', async function(req, res, next) {
    try {
        const result = await db.sequelize.query(
            `WITH RECURSIVE r AS (
            
               SELECT employee_id, last_name, 0 AS mng_cnt
               FROM employees
               where manager_id is null
               
               UNION ALL

               SELECT emp.employee_id, emp.last_name, r.mng_cnt + 1 AS mng_cnt
               FROM employees as emp
                  JOIN r
                      ON emp.manager_id = r.employee_id
            )
            SELECT * FROM r
            order by 1`.replace(/\s+/g, ' '))
        res.status(200).send(result[0])
    } catch (e) {
       res.status(500).send(e)
    }
});

router.get('/minimal_salary', async function(req, res, next) {
    try {
        const result = await db.sequelize.query(
            `SELECT a.employee_id, a.LAST_NAME, a.SALARY, a.DEPARTMENT_ID
            FROM EMPLOYEES as a LEFT OUTER JOIN
            (
                SELECT DEPARTMENT_ID, MIN(SALARY) AS min_sal
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID IS NOT NULL
                GROUP BY DEPARTMENT_ID
            ) AS b
            ON a.DEPARTMENT_ID = b.DEPARTMENT_ID
            WHERE a.SALARY = b.min_sal`.replace(/\s+/g, ' '))
        res.status(200).send(result[0])
    } catch (e) {
        res.status(500).send(e)
    }
});

router.get('/average_salary', async function(req, res, next) {
    try {
        const result = await db.sequelize.query(
            `SELECT a.employee_id, a.LAST_NAME, a.SALARY, b.avg_sal
            FROM EMPLOYEES as a LEFT OUTER JOIN
            (
                SELECT DEPARTMENT_ID, AVG(SALARY) AS avg_sal
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID IS NOT NULL
                GROUP BY DEPARTMENT_ID
            ) AS b
            ON a.DEPARTMENT_ID = b.DEPARTMENT_ID`.replace(/\s+/g, ' '))
        res.status(200).send(result[0])
    } catch (e) {
        res.status(500).send(e)
    }
});

router.get('/percents', async function(req, res, next) {
    try {
        const result = await db.sequelize.query(
            `SELECT DEPARTMENT_ID, SUM(SALARY), round(Sum(salary) / (
                select sum(salary)
                from employees
                ) * 100, 2)
                FROM EMPLOYEES 
                WHERE DEPARTMENT_ID IS NOT NULL
                GROUP BY DEPARTMENT_ID
            `.replace(/\s+/g, ' '))
        res.status(200).send(result[0])
    } catch (e) {
        res.status(500).send(e)
    }
});

router.get('/employee_and_salary', async function(req, res, next) {
    try {
        const result = await db.sequelize.query(
            `with var(id) as (
            values(${req.body.id})
            )
            select employee_id, salary
            from employees, var
            where employee_id = id`.replace(/\s+/g, ' '))
        res.status(200).send(result[0].length === 0 ? '0' : result[0])
    } catch (e) {
        res.status(500).send(e)
    }
});

router.get('/hierarchy', async function(req, res, next) {
    try {
        const result = await db.sequelize.query(
            `WITH RECURSIVE TABL AS 
            ( 
            select row_number() over() as id, * from( 
            SELECT REGION_NAME NUM1, TO_CHAR(REGION_ID,'FM999999999999999999') NUM2, ' ' NUM3, 'R' NUM4 
            FROM REGIONS 
            
            UNION ALL 
            
            SELECT COUNTRY_NAME, COUNTRY_ID, TO_CHAR(REGION_ID,'FM999999999999999999'), 'C' NUM4 
            FROM COUNTRIES 
            
            UNION ALL 
            
            SELECT CITY, TO_CHAR(LOCATION_ID,'FM999999999999999999'), COUNTRY_ID, 'L' NUM4 
            FROM LOCATIONS 
            
            UNION ALL 
            
            SELECT DEPARTMENT_NAME, TO_CHAR(DEPARTMENT_ID,'FM999999999999999999'), 
            TO_CHAR(LOCATION_ID,'FM999999999999999999'), 'D' NUM4 
            FROM DEPARTMENTS 
            ) as alias 
            
            ), CTE_CONNECT_BY AS 
            ( 
            SELECT 1 AS LEVEL, ARRAY[id] AS hierarchy, s.* 
            FROM TABL s 
            
            UNION ALL 
            
            SELECT LEVEL + 1 AS LEVEL, r.hierarchy || s.id, s.* 
            FROM CTE_CONNECT_BY r 
            INNER JOIN TABL s ON r.NUM2 = s.NUM3 
            ) 
            SELECT LEVEL, LPAD(NUM1, LENGTH(NUM1) + (LEVEL-1)*3, ' ') AS "PT" 
            FROM CTE_CONNECT_BY 
            ORDER BY hierarchy;`.replace(/\s+/g, ' '))
        let prettyRes = result[0].map(elem => [elem.level, elem.PT])
        console.log(prettyRes)
        res.status(200).send(result[0])
    } catch (e) {
        res.status(500).send(e)
    }
});

router.get('/2011_avg_salary', async function(req, res, next) {
    try {
        const queryResult = await db.sequelize.query(
            `select employee_id, salary, hire_date, COALESCE(commission_pct , 0 ) as commission_pct, job_id 
                from employees`)
        const startDate =  new Date('2000-01-01')
        const finishDate =  new Date('2001-01-01')
        let result = []
        for (let elem of queryResult[0]) {
            let salary = elem.salary
            let commission = elem.commission_pct
            let date = new Date(elem.hire_date) > startDate ? new Date(elem.hire_date) : startDate
            let diff = Math.trunc(moment(finishDate).diff(date, 'months', true))
            let commissionCount = Math.trunc(diff / 4)
            let avg = +((salary * diff + commission * commissionCount * salary) / diff).toFixed(2)
            result.push({
                "employee_id": elem.employee_id,
                "avg_salary": avg,
                "diff": diff,

            })
        }
        res.status(200).send(result)
    } catch (e) {
        res.status(500).send(e)
    }
});

export default router
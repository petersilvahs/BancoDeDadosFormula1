/* Porcentagem no podium */
SELECT CONCAT(grid.FORENAME," ",grid.SURNAME) NOME, grid.PODIUM, ROUND(grid.PODIUM/TOTAL_CORRIDAS.TOTAL*100,2) PERCENT, TOTAL_CORRIDAS.TOTAL
FROM
    (SELECT DRIVERS.SURNAME, DRIVERS.FORENAME, COUNT(results.POSITION) PODIUM
    FROM results  
    INNER JOIN  drivers DRIVERS ON results.DRIVERID = DRIVERS.DRIVERID 
    INNER JOIN races ON results.raceId = races.raceId
    WHERE results.POSITION IN (1,2,3)  
    GROUP BY DRIVERS.SURNAME, DRIVERS.FORENAME ) grid
INNER JOIN
    (SELECT DRIVERS.SURNAME, DRIVERS.FORENAME, COUNT(results.DRIVERID) TOTAL
    FROM results 
    INNER JOIN drivers DRIVERS ON results.DRIVERID = DRIVERS.DRIVERID
    GROUP BY DRIVERS.SURNAME, DRIVERS.FORENAME) TOTAL_CORRIDAS
    ON TOTAL_CORRIDAS.SURNAME = grid.SURNAME AND TOTAL_CORRIDAS.FORENAME = grid.FORENAME
WHERE PODIUM >25
ORDER BY PERCENT DESC
limit 5; 
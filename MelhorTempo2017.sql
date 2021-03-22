/* Tempo mais rápido de 2017 */
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT results.fastestLap, results.fastestLapTime, concat(drivers.forename," ",drivers.surname) name, results.fastestLapSpeed
FROM results
INNER JOIN drivers ON 
results.driverId = drivers.driverId
WHERE raceId > 969 AND raceId < 988
GROUP by name 
ORDER BY fastestLapTime ASC
Limit  7;
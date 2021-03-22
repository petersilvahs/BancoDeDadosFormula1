SELECT  concat(drivers.forename," ",drivers.surname) name, results.fastestLap, results.fastestLapTime, results.fastestLapSpeed
FROM results
INNER JOIN drivers ON 
results.driverId = drivers.driverId
WHERE raceId > 969 AND raceId < 988
GROUP by name
ORDER BY fastestLapSpeed DESC
Limit  7 ;
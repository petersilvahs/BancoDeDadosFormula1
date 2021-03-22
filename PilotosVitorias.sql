/* Pilotos Vitórias */
SELECT CONCAT(drivers.forename, " ",drivers.surname) nome, COUNT(results.position) Vitorias,drivers.driverId
FROM results 
INNER JOIN drivers on
results.driverId = drivers.driverId
where raceId > 969 AND raceId <988 AND results.position = 1 
GROUP BY results.position, nome
order by POSITION asc
-- query for testing products database
SELECT json_build_object('status',CASE WHEN (select COUNT(id) FROM coffees) > 0 THEN 'Connected' ELSE 'Not connected' END) as results
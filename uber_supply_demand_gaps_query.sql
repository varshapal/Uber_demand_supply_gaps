SELECT * FROM uber_request_data;

-- Count total request
SELECT COUNT(request_id) total_request 
FROM uber_request_data;


--Number of Request by Pickup Points
SELECT pickup_point, COUNT(*) total_request
FROM uber_request_data
GROUP BY pickup_point
ORDER BY total_request DESC;


-- Number of drop request time of the day
SELECT drop_time_status, COUNT(*) drop_request
FROM uber_request_data
GROUP BY drop_time_status
ORDER BY drop_request DESC;


-- Number of request by status
SELECT status, COUNT(*) request_by_status
FROM uber_request_data
GROUP BY status
ORDER BY request_by_status DESC;

--Number of Requests which status is cancled time of day are early morning and late night.
SELECT COUNT(request_id) AS cancelled_requests
FROM uber_request_data
WHERE status = 'Cancelled'
AND request_time_status IN ('Early Morning', 'Late Night');


--Top 10 drivers with most completed trip
SELECT driver_id, COUNT(*) completed_trip
FROM uber_request_data
WHERE status = 'Trip Completed'
GROUP BY driver_id
ORDER BY completed_trip DESC
LIMIT 10;


--Number of total request, copleted request and gap between total and completed request by time of day

SELECT request_time_status, COUNT(*) AS total_requests,
  SUM(CASE WHEN status = 'Trip Completed' THEN 1 ELSE 0 END) AS completed_requests,
  SUM(CASE WHEN status != 'Trip Completed' THEN 1 ELSE 0 END) AS gap
FROM uber_request_data
GROUP BY request_time_status
ORDER BY gap DESC;





















--Number of request where status is completed, pickup point is airport, 
--request time status is early morning and late night



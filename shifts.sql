--SELECT * FROM shift_data$


SELECT
	rota.date,
	st.first_name,
	st.last_name,
	st.hourly_rate,
	sh.start_time,
	sh.end_time,
	(DATEDIFF(MINUTE, sh.start_time, sh.end_time))/60.0 AS shift_in_hours,
	((DATEDIFF(MINUTE, sh.start_time, sh.end_time))/60.0) * st.hourly_rate AS staff_cost
FROM rota_data$ rota
LEFT JOIN shift_data$ sh ON sh.shift_id = rota.shift_id
LEFT JOIN staff_data$ st ON st.staff_id = rota.staff_id


SELECT 
	s2.ing_name,
	s2.ordered_weight,
	(i.quantity * ing.ing_weight) AS total_inv_weight,
	(i.quantity * ing.ing_weight) - s2.ordered_weight AS remaining_weight
FROM
	(SELECT 
		ing_id,
		ing_name,
		SUM(ordered_weight) AS ordered_weight
	FROM 
		stock1
	GROUP BY
		ing_id,
		ing_name) AS s2
	LEFT JOIN inventory_data$ i ON i.item_id = s2.ing_id
	LEFT JOIN ingredients_data$ ing ON ing.ing_id = s2.ing_id
WHERE ing.ing_name IS NOT NULL

	--select * from inventory_data$
	--select * from stock1
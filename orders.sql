SELECT
	o.order_id,
	i.item_price,
	o.quantity,
	i.item_cat,
	i.item_name,
	o.created_at,
	a.delivery_address1,
	a.delivery_address2,
	a.delivery_city,
	a.delivery_postcode,
	o.delivery
FROM 
	orders_data$ AS o
	LEFT JOIN item_data$ AS i ON o.item_id = i.item_id
	LEFT JOIN address_data$ a ON a.add_id = o.add_id
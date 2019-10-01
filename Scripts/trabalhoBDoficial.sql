select products.product_name,
order_details.quantity

from products 
inner join order_details on order_details.product_id = products.id;


select products.product_name,
order_details.quantity
from products 
inner join order_details on order_details.product_id = products.id
group by product_name asc, quantity desc; 


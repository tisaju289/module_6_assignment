

CREATE Table `customers`(
    `customer_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
    `name` VARCHAR(50) NOT NULL
    `email` VARCHAR NOT(60) NULL
    `location` VARCHAR NOT(100) NULL
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
)




CREATE TABLE `orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `customer_id` BIGINT(20) UNSIGNED NOT NULL,
  `order_date` varchar(50) NOT NULL,
  `toral_amount` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
   FOREIGN KEY (`customer_id`) REFERENCES `customers`(`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) 


CREATE TABLE `products` (
  `product_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) 

CREATE TABLE `categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) 



 


CREATE TABLE `order_items` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `order_id` BIGINT(20) UNSIGNED NOT NULL,
  `product_id` BIGINT(20) UNSIGNED NOT NULL,
  `quantity` varchar(50) NOT NULL,
  `unit_price` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
   FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`) ON DELETE RESTRICT ON UPDATE CASCADE
   FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) 


SELECT customers.customer_id, customers.name, customers.email, customers.location, COUNT(orders.order_id) as total_orders
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.name, customers.email, customers.location
ORDER BY total_orders DESC;



SELECT products.name, order_items.quantity, (order_items.quantity * order_items.unit_price) as total_amount
FROM order_items
JOIN products ON order_items.product_id = products.product_id
ORDER BY order_items.order_id ASC;



SELECT categories.name as category_name, SUM(order_items.quantity * order_items.unit_price) as total_revenue
FROM order_items
JOIN products ON order_items.product_id = products.product_id
JOIN categories ON products.category_id = categories.category_id
GROUP BY categories.name
ORDER BY total_revenue DESC;



SELECT customers.name, SUM(order_items.quantity * order_items.unit_price) as total_purchase_amount
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY customers.name
ORDER BY total_purchase_amount DESC
LIMIT 5;


-- 1. Write a query to create a route_details table.

CREATE TABLE route_details (
    route_id INT PRIMARY KEY,
    flight_num VARCHAR(10) NOT NULL,
    origin_airport VARCHAR(50) NOT NULL,
    destination_airport VARCHAR(50) NOT NULL,
    aircraft_id INT,
    distance_miles DECIMAL(10,2),
    CONSTRAINT chk_flight_num CHECK (flight_num LIKE 'FL%'),
    CONSTRAINT chk_distance_miles CHECK (distance_miles > 0)
);

-- 2. Query to display passengers who have traveled in routes 01 to 25.

SELECT *
FROM passengers_on_flights
WHERE route_id BETWEEN 01 AND 25;

-- 3. Query to identify the number of passengers and total revenue in business class.

SELECT COUNT(*) AS num_passengers, SUM(price_per_ticket * no_of_tickets) AS total_revenue
FROM ticket_details
WHERE class_id = 'Business';

-- 4. Query to display full names of customers.

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM customer;

-- 5. Query to extract registered customers who have booked a ticket.

SELECT *
FROM customer c
INNER JOIN ticket_details t ON c.customer_id = t.customer_id;

-- 6. Query to identify customer's first and last names based on their customer ID and brand.

SELECT c.first_name, c.last_name
FROM customer c
INNER JOIN ticket_details t ON c.customer_id = t.customer_id
WHERE t.brand = 'Emirates';

--7. Query to identify customers who have traveled by Economy Plus class.

SELECT customer_id
FROM passengers_on_flights
WHERE class_id = 'Economy Plus'
GROUP BY customer_id
HAVING COUNT(*) > 0;

-- 8. Query to identify if revenue has crossed $10,000.

SELECT IF(SUM(price_per_ticket * no_of_tickets) > 10000, 'Yes', 'No') AS revenue_crossed_10000
FROM ticket_details;

--9. Query to create and grant access to a new user.

CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'new_user'@'localhost';

--10. Query to find the maximum ticket price for each class using window functions.

SELECT class_id, MAX(price_per_ticket) OVER(PARTITION BY class_id) AS max_ticket_price
FROM ticket_details;

--11. Query to extract passengers whose route ID is 4.

SELECT *
FROM passengers_on_flights
WHERE route_id = 4;

-- 12. Query to view execution plan of passengers_on_flights table for route ID 4.

EXPLAIN SELECT * FROM passengers_on_flights WHERE route_id = 4;

-- 13. Query to calculate total price of all tickets booked by a customer across different aircraft IDs using ROLLUP function.

SELECT customer_id, aircraft_id, SUM(price_per_ticket * no_of_tickets) AS total_price
FROM ticket_details
GROUP BY customer_id, aircraft_id WITH ROLLUP;

-- 14. Query to create a view with only business class customers along with the brand of airlines.

CREATE VIEW business_class_customers AS
SELECT c.*, t.brand
FROM customer c
INNER JOIN ticket_details t ON c.customer_id = t.customer_id
WHERE t.class_id = 'Business';

-- 15. Query to create a stored procedure to get details of passengers flying between a range of routes.

DELIMITER //

CREATE PROCEDURE GetPassengerDetailsByRouteRange(IN start_route INT, IN end_route INT)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'passengers_on_flights') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Table does not exist';
    ELSE
        SELECT *
        FROM passengers_on_flights
        WHERE route_id BETWEEN start_route AND end_route;
    END IF;
END //

DELIMITER ;

-- 16. Query to create a stored procedure to extract route details where the traveled distance is more than 2000 miles.

DELIMITER //

CREATE PROCEDURE GetRoutesWithDistanceMoreThan2000Miles()
BEGIN
    SELECT *
    FROM routes
    WHERE distance_miles > 2000;
END //

DELIMITER ;

-- 17. Query to create a stored procedure to group distance traveled by each flight into three categories.

DELIMITER //

CREATE PROCEDURE GroupDistanceIntoCategories()
BEGIN
    SELECT
        route_id,
        flight_num,
        CASE
            WHEN distance_miles BETWEEN 0 AND 2000 THEN 'Short distance travel'
            WHEN distance_miles BETWEEN 2001 AND 6500 THEN 'Intermediate distance travel'
            ELSE 'Long distance travel'
        END AS distance_category
    FROM routes;
END //

DELIMITER ;

-- 18. Query to extract ticket purchase date, customer ID, class ID, and specify if complimentary services are
    -- provided for the specific class using a stored function in a stored procedure.

DELIMITER //

CREATE FUNCTION ProvideComplimentaryServices(class VARCHAR(20)) RETURNS VARCHAR(3)
BEGIN
    IF class IN ('Business', 'Economy Plus') THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //

CREATE PROCEDURE GetTicketDetailsWithComplimentaryServices()
BEGIN
    SELECT p_date, customer_id, class_id, ProvideComplimentaryServices(class_id) AS complimentary_services
    FROM ticket_details;
END //

DELIMITER ;

-- 19. Query to extract the first record of the customer whose last name ends with Scott using a cursor.

DELIMITER //

CREATE PROCEDURE GetCustomerWithLastNameScott()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE customer_name VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT CONCAT(first_name, ' ', last_name) FROM customer WHERE last_name LIKE '%Scott';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO customer_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT customer_name;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;




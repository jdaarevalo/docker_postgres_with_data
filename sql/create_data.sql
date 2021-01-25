set session my.number_of_sales = '2000000';
set session my.number_of_products = '300';
set session my.number_of_coutries = '100';
set session my.number_of_cities = '30';
set session my.start_date = '2019-01-01 00:00:00';
set session my.end_date = '2020-02-01 00:00:00';

--delete tables 
DROP TABLE IF EXISTS city CASCADE;
DROP TABLE IF EXISTS country CASCADE;
DROP TABLE IF EXISTS product CASCADE;
DROP TABLE IF EXISTS sale CASCADE;

-- Creation of product
CREATE TABLE IF NOT EXISTS product (
				  product_id INT NOT NULL,
				  name varchar(250) NOT NULL,
				  PRIMARY KEY (product_id)
				);

				-- Creation of country
CREATE TABLE IF NOT EXISTS country (
				  country_id INT NOT NULL,
				  country_name varchar(450) NOT NULL,
				  PRIMARY KEY (country_id)
				);

				-- Creation of city
CREATE TABLE IF NOT EXISTS city (
				  city_id INT NOT NULL,
				  city_name varchar(450) NOT NULL,
				  country_id INT NOT NULL,
				  PRIMARY KEY (city_id),
				  CONSTRAINT fk_country
				      FOREIGN KEY(country_id) 
					  REFERENCES country(country_id)
				);

				-- Creation of sale
CREATE TABLE IF NOT EXISTS sale (
				  sale_id INT NOT NULL,
				  amount DECIMAL(20,3) NOT NULL,
				  date_sale TIMESTAMP,
				  product_id INT NOT NULL,
				  city_id INT NOT NULL,
				  PRIMARY KEY (sale_id),
				  CONSTRAINT fk_product
				      FOREIGN KEY(product_id) 
					  REFERENCES product(product_id),
				  CONSTRAINT fk_city
				      FOREIGN KEY(city_id) 
					  REFERENCES city(city_id)
					  
				);

				-- Filling of products
INSERT INTO product
select id, concat('Product ', id) 
FROM GENERATE_SERIES(1, current_setting('my.number_of_products')::int) as id;

-- Filling of countries
INSERT INTO country
select id, concat('Country ', id) 
FROM GENERATE_SERIES(1, current_setting('my.number_of_coutries')::int) as id;

-- Filling of cities
INSERT INTO city
select id
	, concat('City ', id)
	, floor(random() * (current_setting('my.number_of_coutries')::int) + 1)::int
FROM GENERATE_SERIES(1, current_setting('my.number_of_cities')::int) as id;

-- Filling of sales

INSERT INTO sale
select id 
	, round(CAST(float8 (random() * 10000) as numeric), 3)
	, TO_TIMESTAMP(start_date, 'YYYY-MM-DD HH24:MI:SS') +
		random()* (TO_TIMESTAMP(end_date, 'YYYY-MM-DD HH24:MI:SS') 
							- TO_TIMESTAMP(start_date, 'YYYY-MM-DD HH24:MI:SS'))
	, floor(random() * (current_setting('my.number_of_products')::int) + 1)::int
	, floor(random() * (current_setting('my.number_of_cities')::int) + 1)::int
FROM GENERATE_SERIES(1, current_setting('my.number_of_sales')::int) as id
	, current_setting('my.start_date') as start_date
	, current_setting('my.end_date') as end_date;

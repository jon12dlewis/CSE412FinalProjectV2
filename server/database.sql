CREATE DATABASE notYelp;

CREATE TABLE resturants(
	r_id SERIAL PRIMARY KEY,
	description VARCHAR(255)
);

CREATE TABLE reviews(
	rev_id SERIAL PRIMARY KEY,
	r_id int,
	rev_text VARCHAR(255),
	rev_date VARCHAR(255),
	rev_rating int
);

CREATE TABLE reservations(
	res_id SERIAL PRIMARY KEY,
	t_id int,
	res_date VARCHAR(255),
	res_size int
);

CREATE TABLE customers(
	c_id SERIAL PRIMARY KEY,
	rev_id int,
	res_id int,
	c_name VARCHAR(255),
	c_age int,
	c_address VARCHAR(255),
	c_email VARCHAR(255),
	c_phone VARCHAR(255)
);

CREATE TABLE dinner_tables(
	t_id SERIAL PRIMARY KEY,
	r_id int,
	max_seats int,
	reserved bool
);

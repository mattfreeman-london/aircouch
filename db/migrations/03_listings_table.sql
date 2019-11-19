CREATE TABLE listings(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(100), price DECIMAL(6,2), start_date DATE, end_date DATE, host_id INTEGER REFERENCES users (id));

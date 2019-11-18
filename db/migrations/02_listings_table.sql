CREATE TABLE listings(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(100), price DECIMAL(6,2), available_date DATE, user_id INTEGER REFERENCES users (id));

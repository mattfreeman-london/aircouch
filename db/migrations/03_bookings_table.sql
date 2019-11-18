CREATE TABLE bookings(id SERIAL PRIMARY KEY, date DATE, listing_id INTEGER REFERENCES listings (id));

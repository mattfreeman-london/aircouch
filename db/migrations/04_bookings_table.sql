CREATE TABLE bookings(id SERIAL PRIMARY KEY, start_date DATE, end_date DATE, approved BOOLEAN, guest_id INTEGER REFERENCES users(id), listing_id INTEGER REFERENCES listings (id));

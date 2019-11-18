# aircouch

1) User doesn't need to be signed in to view listings
As a visitor
So I can view plan a stay
I want to view available listings

2) As a guest,
So I can book a space
I want to sign up fo an account

3) As a guest,
So that I can book a space
I want to sign In

4)
As a host,
So that I can rent my couch out
I want to be able to list my space.

As a host,
So I can maximize my income
I want to list multiple spaces

5) As a host,
to avoid a clash,
I want my spaces to be unable for booking if they're occupied

As a host,
when one of spaces is booked,
it is marked as 'occupied'

6) As a host
So that I can approve a hire request
I would like to be able to see who is requesting

6) As a guest
So that I can select a date
I would like to be able to see available dates for the space

7) As a guest
So I can stay somewhere
I would like to book a space for one night

As a guest, I would like to be able to book a space for one night

Database Steps in README.md:
1. brew install postgresql
2. brew services start postgresql
3. psql postgres
4. CREATE DATABASE aircouch;
5. \c aircouch
6. CREATE TABLE (x3) found in root/db/migrations
7. CREATE DATABASE aircouch_test;
8. \c aircouch_test
9. CREATE TABLE (x3) found in root/db/migrations

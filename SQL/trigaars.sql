CREATE DATABASE MovieBookingSystem;
USE MovieBookingSystem;

-- Movies Table
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    language VARCHAR(50),
    duration INT,
    release_date DATE,
    rating DECIMAL(2,1)
);

-- Actors Table
CREATE TABLE Actors (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    actor_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    dob DATE,
    nationality VARCHAR(50)
);

-- Directors Table
CREATE TABLE Directors (
    director_id INT AUTO_INCREMENT PRIMARY KEY,
    director_name VARCHAR(100) NOT NULL,
    dob DATE,
    nationality VARCHAR(50)
);

-- Genres Table
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);

-- Theaters Table
CREATE TABLE Theaters (
    theater_id INT AUTO_INCREMENT PRIMARY KEY,
    theater_name VARCHAR(100) NOT NULL,
    location VARCHAR(150),
    phone VARCHAR(15)
);

-- Screens Table
CREATE TABLE Screens (
    screen_id INT AUTO_INCREMENT PRIMARY KEY,
    theater_id INT,
    screen_name VARCHAR(50),
    total_seats INT,
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id)
);

-- Shows Table
CREATE TABLE Shows (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    screen_id INT,
    show_date DATE,
    show_time TIME,
    ticket_price DECIMAL(8,2),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (screen_id) REFERENCES Screens(screen_id)
);

-- Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- Bookings Table
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    show_id INT,
    booking_date DATETIME,
    total_amount DECIMAL(10,2),
    booking_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);

-- Tickets Table
CREATE TABLE Tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    seat_number VARCHAR(10),
    ticket_price DECIMAL(8,2),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- Movie_Actors Junction Table
CREATE TABLE Movie_Actors (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)
);

-- Movie_Directors Junction Table
CREATE TABLE Movie_Directors (
    movie_id INT,
    director_id INT,
    PRIMARY KEY (movie_id, director_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (director_id) REFERENCES Directors(director_id)
);

-- Movie_Genres Junction Table
CREATE TABLE Movie_Genres (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);maniiallakm






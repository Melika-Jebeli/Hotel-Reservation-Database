Hotel Reservation Management System (SQL Database Project)

💡 Project Overview

This project focuses on the design, implementation, and management of a Hotel Reservation System database using SQL. 
The primary goal is to fully model the key entities—Hotels, Rooms, Guests, Reservations, and Services—and build the necessary structures (Views, Stored Procedures, Functions) to support core business operations.

📄 Project Documentation and Diagrams

For a comprehensive understanding of the system's architecture, this repository includes detailed documentation. 
Specifically, you will find Entity-Relationship Diagrams (ERD) to visually represent the database schema and its complex relationships. 
Additionally, UML diagrams (Use Case, Sequence, and Activity) are included to illustrate the system's requirements and the flow of core business processes, such as room booking and payment processing.

📊 Database Schema and Structure

The database is composed of 7 main tables and 2 linking tables to manage many-to-many relationships.

Core Entities:

Table	Purpose

Hotels: Stores basic hotel information and rating.

Rooms: Details of rooms (type, price, capacity) and linkage to the hotel.

Guests: Guest profiles and contact records.

Reservations: Core booking details, including check-in/out dates and total amounts.

Payments: Records financial transactions associated with each reservation.

Service: A catalog of additional services offered and their prices.

res_service / guests_service: Manages the assignment of services to reservations or directly to guests.

🛠️ Implementation and Features

This repository includes SQL scripts for implementing the following database features:

Analytical Queries: To answer complex business questions (e.g., finding available rooms between two dates).

Views: To simplify complex queries (e.g., guest_reservation_view).

Stored Procedures: To perform repetitive tasks (e.g., displaying guest details or hotel addresses).

Functions: For custom logic (e.g., determining the hotel's grade based on its rating).

Triggers: To maintain data integrity (e.g., automatically adding a default room when a new hotel is created).

🚀 Setup Guide

To fully recreate this database in your environment (such as SQL Server, MySQL, or PostgreSQL), follow these steps:

Create Database: Create a new database (e.g., HotelDB).

Execute Scripts:

First, run the sql/SQLQuery6.sql script to establish the structure and relationships.

Next, run the sql/SQLQuery6+.sql script to create all the advanced logic.

✒️ Author
Melika Jebeli

GitHub: https://github.com/Melika-Jebeli

Email: Melika.hj8@gmail.com

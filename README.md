# Smart Inventory Management System for Flower Shop with Candles

## Table of Contents
- [Introduction](#introduction)
- [Requirements](#requirements)
  - [Hardware](#hardware)
  - [Software](#software)
- [Setup](#setup)
  - [Clone the Repository](#clone-the-repository)
  - [Install Dependencies](#install-dependencies)
  - [Configure .env file](#configure-.env-file)
  - [Database Setup](#database-setup)
  - [Migrate Database](#migrate-database)
  - [Start the Server](#start-the-server)
- [Running the Program](#running-the-program)


## Introduction
The **Smart Inventory Management System** is designed to help flower shops efficiently manage both perishable (flowers) and non-perishable (candles) inventory. Using machine learning and historical sales data, it forecasts demand, reduces waste, and automates inventory updates in real time.

## Requirements

### Hardware
- **Device**: Computer or server capable of running a desktop website

### Software
- **Code Editor**: Visual Studio Code (VSCode)
- **Version Control**: Git
- **Database**: MySQL
- **Framework**: Laravel (PHP framework)
- **Local Server**: XAMPP for local testing

## Setup

### Clone the Repository
```bash
git clone [https://github.com/jiedjoshua/SmartInventoryManagementSystem/](https://github.com/jiedjoshua/SmartInventoryManagementSystem.git)
cd InventoryManagementSystem
```
### Install Dependencies
Make sure you have Composer installed to manage PHP dependencies.
```bash
composer install
```
### Configure .env file
- DB_DATABASE=inventorymanagementsystem
- DB_USERNAME=root
- DB_PASSWORD=

### Database Setup
- Open XAMPP then start the apache and mysql
- Open PHPmyAdmin and import the sql file

### Migrate the database
```bash
php artisan migrate
```

## Running the program

### Start the server
```bash
php artisan serve
```




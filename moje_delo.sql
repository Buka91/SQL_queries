PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Job;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Company;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Region;
DROP TABLE IF EXISTS JobType;
DROP TABLE IF EXISTS Job_Users;
DROP TABLE IF EXISTS Company_Users;

CREATE TABLE Company(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR2(10) NOT NULL,
	description TEXT
);

CREATE TABLE Category(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR2(10) NOT NULL
);

CREATE TABLE Region(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR2(10) NOT NULL
);

CREATE TABLE JobType(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	type VARCHAR2(10) NOT NULL
);

CREATE TABLE Job(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR2(20) NOT NULL,
	description TEXT,
	categoryId INTEGER,
	companyId INTEGER,
	regionId INTEGER,
	jobTypeId INTEGER,
	FOREIGN KEY (categoryId) REFERENCES Category(id),
	FOREIGN KEY (companyId) REFERENCES Company(id),
	FOREIGN KEY (regionId) REFERENCES Region(id),
	FOREIGN KEY (jobTypeId) REFERENCES JobType(id)
);

CREATE TABLE Users(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	firstName VARCHAR2(10),
	lastName VARCHAR2(10),
	location VARCHAR2(20),
	phoneNumber VARCHAR2(12),
	email VARCHAR2(20),
	username VARCHAR2(10),
	pass VARCHAR2(20),
	cv TEXT,
	regionId INTEGER,
	FOREIGN KEY (regionId) REFERENCES Region(id)
);

CREATE TABLE Job_Users(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	jobId INTEGER,
	usersId INTEGER,
	FOREIGN KEY (jobId) REFERENCES Job(id),
	FOREIGN KEY (usersId) REFERENCES Users(id)
);

CREATE TABLE Company_Users(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	companyId INTEGER,
	usersId INTEGER,
	FOREIGN KEY (companyId) REFERENCES Company(id),
	FOREIGN KEY (usersId) REFERENCES Users(id)
);
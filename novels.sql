CREATE DATABASE novels;

CREATE USER 'novels'@'localhost' IDENTIFIED BY 'Gr34tN0vel$';

GRANT ALL ON novels.* TO 'novels'@'localhost';

USE novels;

CREATE TABLE genres (
  id INT auto_increment,
  name VARCHAR(255),
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deletedAt DATETIME,
  PRIMARY KEY (id)
);


CREATE TABLE authors (
  id INT auto_increment,
  nameFirst VARCHAR(255) NOT NULL,
  nameLast VARCHAR(255),
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deletedAt DATETIME,
  PRIMARY KEY(id)
);

CREATE TABLE novels (
  id INT auto_increment,
  title VARCHAR(255) NOT NULL,
  authorId INT,
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deletedAt DATETIME,
  PRIMARY KEY (id),
  FOREIGN KEY (authorId) REFERENCES authors(id)
);

CREATE TABLE novelGenres (
genreID INT,
novelID INT,
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt DATETIME,
PRIMARY KEY (genreID, novelID),
FOREIGN KEY (novelID) REFERENCES novels (id),
FOREIGN KEY (genreID) REFERENCES genres (id)
);

INSERT INTO genres (name, id) VALUES ("Adventure", 1);
INSERT INTO genres (name, id) VALUES ("African Literature", 2);
INSERT INTO genres (name, id) VALUES ("Crime", 3);
INSERT INTO genres (name, id) VALUES ("Drama", 4);
INSERT INTO genres (name, id) VALUES ("Dystopia", 5);
INSERT INTO genres (name, id) VALUES ("Fantasy", 6);
INSERT INTO genres (name, id) VALUES ("Fiction", 7);
INSERT INTO genres (name, id) VALUES ("French Literature", 8);
INSERT INTO genres (name, id) VALUES ("Gothic", 9);
INSERT INTO genres (name, id) VALUES ("Historical Fiction", 10);
INSERT INTO genres (name, id) VALUES ("Horror", 11);
INSERT INTO genres (name, id) VALUES ("Mystery", 12);
INSERT INTO genres (name, id) VALUES ("Plays", 13);
INSERT INTO genres (name, id) VALUES ("Russian Literature", 14);
INSERT INTO genres (name, id) VALUES ("Science Fiction", 15);
INSERT INTO genres (name, id) VALUES ("Thriller", 16);
INSERT INTO genres (name, id) VALUES ("Time Travel", 17);
INSERT INTO genres (name, id) VALUES ("War", 18);

INSERT INTO authors (nameFirst, nameLast, id) VALUES ("Bram", "Stoker", 1);
INSERT INTO authors (nameFirst, nameLast, id) VALUES ("Oscar", "Wilde", 2);
INSERT INTO authors (nameFirst, nameLast, id) VALUES ("Alice", "Walker", 3);
INSERT INTO authors (nameFirst, nameLast, id) VALUES ("Leo", "Tolstoy", 4);
INSERT INTO authors (nameFirst, nameLast, id) VALUES ("Charles", "Dickens", 5);
INSERT INTO authors (nameFirst, nameLast, id) VALUES ("Arthur", "Miller", 6);
INSERT INTO authors (nameFirst, nameLast, id) VALUES ("Alexandre", "Dumas", 7);
INSERT INTO authors (nameFirst, nameLast, id) VALUES ("Arthur Conan", "Doyle", 8);
INSERT INTO authors (nameFirst, nameLast, id) VALUES ("Robert Louis", "Stevenson", 9);
INSERT INTO authors (nameFirst, nameLast, id) VALUES ("Fyodor", "Dostoyevsky", 10);
INSERT INTO authors (nameFirst, nameLast, id) VALUES ("Agatha", "Christie", 11);
INSERT INTO authors (nameFirst, nameLast, id) VALUES ("Ray", "Bradbury", 12);
INSERT INTO authors (nameFirst, nameLast, id) VALUES ("George", "Orwell", 13);
INSERT INTO authors (nameFirst, nameLast, id) VALUES ("H.G.", "Wells", 14);
INSERT INTO authors (nameFirst, nameLast, id) VALUES ("Chinua", "Achebe", 15);

INSERT INTO novels (title, authorId) VALUES ("A Tale of Two Cities", 5);
INSERT INTO novels (title, authorId) VALUES ("Animal Farm", 13);
INSERT INTO novels (title, authorId) VALUES ("Crime and Punishment", 10);
INSERT INTO novels (title, authorId) VALUES ("Dracula", 1);
INSERT INTO novels (title, authorId) VALUES ("Fahrenheit 451", 12);
INSERT INTO novels (title, authorId) VALUES ("Murder on the Orient Express", 11);
INSERT INTO novels (title, authorId) VALUES ("The Color Purple", 3);
INSERT INTO novels (title, authorId) VALUES ("The Crucible", 6);
INSERT INTO novels (title, authorId) VALUES ("The Hound of the Baskervilles", 8);
INSERT INTO novels (title, authorId) VALUES ("The Picture of Dorian Gray", 2);
INSERT INTO novels (title, authorId) VALUES ("The Strange Case of Dr. Jekyll and Mr. Hyde", 9);
INSERT INTO novels (title, authorId) VALUES ("The Three Musketeers", 7);
INSERT INTO novels (title, authorId) VALUES ("The Time Machine", 14);
INSERT INTO novels (title, authorId) VALUES ("Things Fall Apart", 15);
INSERT INTO novels (title, authorId) VALUES ("War and Peace", 4);

INSERT INTO novelGenres (novelID, genreID) VALUES (1, 7);
INSERT INTO novelGenres (novelID, genreID) VALUES (1, 10);
INSERT INTO novelGenres (novelID, genreID) VALUES (2, 7);
INSERT INTO novelGenres (novelID, genreID) VALUES (2, 15);
INSERT INTO novelGenres (novelID, genreID) VALUES (2, 5);
INSERT INTO novelGenres (novelID, genreID) VALUES (3, 7);
INSERT INTO novelGenres (novelID, genreID) VALUES (3, 14);
INSERT INTO novelGenres (novelID, genreID) VALUES (3, 12);
INSERT INTO novelGenres (novelID, genreID) VALUES (4, 7);
INSERT INTO novelGenres (novelID, genreID) VALUES (4, 11);
INSERT INTO novelGenres (novelID, genreID) VALUES (4, 6);
INSERT INTO novelGenres (novelID, genreID) VALUES (5, 7);
INSERT INTO novelGenres (novelID, genreID) VALUES (5, 15);
INSERT INTO novelGenres (novelID, genreID) VALUES (5, 5);
INSERT INTO novelGenres (novelID, genreID) VALUES (6, 7);
INSERT INTO novelGenres (novelID, genreID) VALUES (6, 12);
INSERT INTO novelGenres (novelID, genreID) VALUES (7, 7);
INSERT INTO novelGenres (novelID, genreID) VALUES (7, 11);
INSERT INTO novelGenres (novelID, genreID) VALUES (8, 7);
INSERT INTO novelGenres (novelID, genreID) VALUES (8, 4);
INSERT INTO novelGenres (novelID, genreID) VALUES (8, 10);
INSERT INTO novelGenres (novelID, genreID) VALUES (8, 13);
INSERT INTO novelGenres (novelID, genreID) VALUES (9, 7);
INSERT INTO novelGenres (novelID, genreID) VALUES (9, 3);
INSERT INTO novelGenres (novelID, genreID) VALUES (9, 12);
INSERT INTO novelGenres (novelID, genreID) VALUES (9, 16);
INSERT INTO novelGenres (novelID, genreID) VALUES (10, 7);
INSERT INTO novelGenres (novelID, genreID) VALUES (10, 11);
INSERT INTO novelGenres (novelID, genreID) VALUES (10, 9);
INSERT INTO novelGenres (novelID, genreID) VALUES (10, 6);
INSERT INTO novelGenres (novelID, genreID) VALUES (11, 7);
INSERT INTO novelGenres (novelID, genreID) VALUES (11, 12);
INSERT INTO novelGenres (novelID, genreID) VALUES (11, 15);
INSERT INTO novelGenres (novelID, genreID) VALUES (11, 11);
INSERT INTO novelGenres (novelID, genreID) VALUES (12, 7);
INSERT INTO novelGenres (novelID, genreID) VALUES (12, 8);
INSERT INTO novelGenres (novelID, genreID) VALUES (12, 10);
INSERT INTO novelGenres (novelID, genreID) VALUES (12, 1);
INSERT INTO novelGenres (novelID, genreID) VALUES (13, 7);
INSERT INTO novelGenres (novelID, genreID) VALUES (13, 1);
INSERT INTO novelGenres (novelID, genreID) VALUES (13, 17);
INSERT INTO novelGenres (novelID, genreID) VALUES (14, 7);
INSERT INTO novelGenres (novelID, genreID) VALUES (14, 2);
INSERT INTO novelGenres (novelID, genreID) VALUES (14, 10);
INSERT INTO novelGenres (novelID, genreID) VALUES (15, 7);
INSERT INTO novelGenres (novelID, genreID) VALUES (15, 10);
INSERT INTO novelGenres (novelID, genreID) VALUES (15, 18);
INSERT INTO novelGenres (novelID, genreID) VALUES (15, 14);
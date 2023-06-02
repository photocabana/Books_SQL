#forward Engineer - Done
#Text.txt 

SELECT * FROM users;
SELECT * FROM favorites;
SELECT * FROM books;

#Create 5 different users: Jane Amsden, Emily Dixon, Theodore Dostoevsky, William Shapiro, Lao Xiu
INSERT INTO users (first_name, last_name)
VALUES('Jane', 'Amsden');

INSERT INTO users (first_name, last_name) 
VALUES('Emily', 'Dixon'), ('Theodore', 'Dostoevsky'), ('William', 'Shapiro'), ('Lao', 'Xiu');

#Create 5 books with the following names: C Sharp, Java, Python, PHP, Ruby
INSERT INTO books (title, num_of_pages) 
VALUES('C Sharp', 652), ('Java', 736), ('Python', 1036), ('PHP', 800), ('Ruby', 420);

#Change the name of the CSharp book to C#
#Error 1175
#You also can disable safe mode in MySQL Workbench, go to Edit -> Preferences -> SQL Editor, and uncheck "Safe Updates" check box.
#Then Select Query Drop down menu and Reconnect the Server
UPDATE books
SET title = "C#"
WHERE title = "C Sharp";

#Change the first name of the 4th user to Bill
UPDATE users
SET first_name = "Bill"
WHERE id = 4;

#Have the first user favorite the first 2 books
#Have the seccond user favorite the first 3 books
#Have the thrid user favorite the first 4 books
#Have the fourth user favorite all the books
#Error 1452
SET FOREIGN_KEY_CHECKS=0;
INSERT into favorites (user_id, book_id)
VALUES (1, 1), (1, 2), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2), (3, 3), (3, 4), (4, 1), (4, 2), (4, 3), (4, 4), (4, 5);

#Retrieve all the users who favorited the 3rd book
SELECT id, first_name, last_name from users
JOIN favorites on users.id = favorites.user_id
WHERE favorites.book_id = 3;

#remove the first user of the 3rd book's favorite
DELETE FROM favorites WHERE user_id = 2 AND book_id = 3;

#Have the 5th user favorite the 2nd book
INSERT into favorites (user_id, book_id)
VALUES (5, 2);

#Find all the books that the 3rd user favorited
SELECT * from books
JOIN favorites on books.id = favorites.book_id
WHERE favorites.user_id = 3;

#Find all the users that faorited the 5th book
SELECT * from users
JOIN favorites on favorites.user_id = users.id
WHERE favorites.book_id = 5;
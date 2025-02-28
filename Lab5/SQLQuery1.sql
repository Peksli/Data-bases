--Используя операции соединения таблиц построить следующие запросы:
USE Library

--1. Составить полные сведения о читателях и книгах, которые за ними числятся. 
--Вывести полную информацию о читателях и книгах.
SELECT ReaderID, BookID, Author, Title, YearOfPublish, Surname, Name, Patronymic, PhoneNumber, Address
FROM JournalGiveBooks
INNER JOIN Books ON JournalGiveBooks.BookID = Books.ID
INNER JOIN Readers ON JournalGiveBooks.ReaderID = Readers.ID



--2. Вывести полную информацию о книгах, которые числятся за данным читателем.
SELECT ReaderID, BookID, Author, Title
FROM JournalGiveBooks
INNER JOIN Books ON JournalGiveBooks.ID = Books.ID
ORDER BY ReaderID ASC


--3. Вывести полную информацию о читателях, которые взяли книги, изданные в прошедшем году.
SELECT ReaderID, BookID, NumberReaderTicket, Surname, Name, Patronymic, PhoneNumber, Address
FROM JournalGiveBooks
INNER JOIN Readers ON JournalGiveBooks.ReaderID = Readers.ID
WHERE JournalGiveBooks.DataOfGive <= DATEADD(YEAR, -1,  GETDATE())


--4. Составить список должников на сегодняшний день.
SELECT ReaderID, BookID, DataNeedReturn, DataActualReturn, NumberReaderTicket, Surname, Name, Patronymic, PhoneNumber, Address
FROM JournalGiveBooks
INNER JOIN Readers ON JournalGiveBooks.ID = Readers.ID
WHERE JournalGiveBooks.DataNeedReturn < JournalGiveBooks.DataActualReturn




--Используя операции UNION, EXCEPT, INTERSECT построить следующие запросы:
--1. Отыскать какие книги изданы разными издательствами.
SELECT Title FROM Books
UNION ALL -- Отличие от обычного UNION в том, что включает дубликаты.
SELECT Publisher FROM Publishers
WHERE Publishers.PublisherID IN(
	SELECT CodeOfPublisher FROM Books
)


--2. Определить есть ли среди читателей и авторов однофамильцы
SELECT Surname FROM Readers
INTERSECT
SELECT Author FROM Books


--3. Отыскать книги, которые в текущем году еще не брали читатели.
SELECT ID FROM Books
EXCEPT
SELECT BookID FROM JournalGiveBooks
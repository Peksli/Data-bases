--��������� �������� ���������� ������ ��������� ��������� �������:
USE Library

--1. ��������� ������ �������� � ��������� � ������, ������� �� ���� ��������. 
--������� ������ ���������� � ��������� � ������.
SELECT ReaderID, BookID, Author, Title, YearOfPublish, Surname, Name, Patronymic, PhoneNumber, Address
FROM JournalGiveBooks
INNER JOIN Books ON JournalGiveBooks.BookID = Books.ID
INNER JOIN Readers ON JournalGiveBooks.ReaderID = Readers.ID



--2. ������� ������ ���������� � ������, ������� �������� �� ������ ���������.
SELECT ReaderID, BookID, Author, Title
FROM JournalGiveBooks
INNER JOIN Books ON JournalGiveBooks.ID = Books.ID
ORDER BY ReaderID ASC


--3. ������� ������ ���������� � ���������, ������� ����� �����, �������� � ��������� ����.
SELECT ReaderID, BookID, NumberReaderTicket, Surname, Name, Patronymic, PhoneNumber, Address
FROM JournalGiveBooks
INNER JOIN Readers ON JournalGiveBooks.ReaderID = Readers.ID
WHERE JournalGiveBooks.DataOfGive <= DATEADD(YEAR, -1,  GETDATE())


--4. ��������� ������ ��������� �� ����������� ����.
SELECT ReaderID, BookID, DataNeedReturn, DataActualReturn, NumberReaderTicket, Surname, Name, Patronymic, PhoneNumber, Address
FROM JournalGiveBooks
INNER JOIN Readers ON JournalGiveBooks.ID = Readers.ID
WHERE JournalGiveBooks.DataNeedReturn < JournalGiveBooks.DataActualReturn




--��������� �������� UNION, EXCEPT, INTERSECT ��������� ��������� �������:
--1. �������� ����� ����� ������ ������� ��������������.
SELECT Title FROM Books
UNION ALL -- ������� �� �������� UNION � ���, ��� �������� ���������.
SELECT Publisher FROM Publishers
WHERE Publishers.PublisherID IN(
	SELECT CodeOfPublisher FROM Books
)


--2. ���������� ���� �� ����� ��������� � ������� ������������
SELECT Surname FROM Readers
INTERSECT
SELECT Author FROM Books


--3. �������� �����, ������� � ������� ���� ��� �� ����� ��������.
SELECT ID FROM Books
EXCEPT
SELECT BookID FROM JournalGiveBooks
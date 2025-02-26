--1. Список читателей, у которых на руках находятся книги.
SELECT DISTINCT ReaderID as [ID имеющих книги]
FROM JournalGiveBooks
WHERE BookID IN (
	SELECT BookID
	FROM JournalGiveBooks
	WHERE BookID IS NOT NULL
)


--2. Список читателей, у которых  находятся книги, срок возврата которых прошел.
SELECT ReaderID as [Срок истек у читаталей с ID]
FROM JournalGiveBooks
WHERE DataNeedReturn < DataActualReturn


--3. Список издательств, книги которых поступили в прошлом году.
SELECT CodeOfPublisher
FROM Books
WHERE YearOfPublish = (
	SELECT YEAR(GETDATE()) - 1
)


--4. Фамилию читателя с максимальным сроком задержки возврата книги.
SELECT Surname
FROM Readers
WHERE ID = (
	SELECT TOP 1 ReaderID
	FROM JournalGiveBooks
	GROUP BY ReaderID
	ORDER BY MAX(DATEDIFF(DAY, DataNeedReturn, DataActualReturn)) DESC
)


--5. Фамилии читателей, которые должны вернуть книги в ближайшие 3 дня.
SELECT Surname
FROM Readers
WHERE ID IN (
	SELECT ReaderID
	FROM JournalGiveBooks
	WHERE DATEDIFF(DAY, DataOfGive, DataNeedReturn) <= 3
)

USE Library

--1.	Подсчитать количество читателей, имеющих отчество «Иванович».
SELECT Patronymic, COUNT(*) as Количество
FROM Readers
GROUP BY Patronymic
HAVING Patronymic='Иванович'


--2.	Подсчитать количество книг, которое числится за каждым читателем. 
SELECT ReaderID, COUNT(*) as [Числится книг]
FROM JournalGiveBooks
GROUP BY ReaderID


--3.	Определить код читателя, который взял максимальное число книг. 
SELECT TOP 1 ReaderID, COUNT(*) as [Числится книг]
FROM JournalGiveBooks
GROUP BY ReaderID
ORDER BY [Числится книг] DESC


--4.	Определить код  издательства, количество книг которого максимально.
SELECT TOP 1 CodeOfPublisher, SUM(TotalCount) as [Числится книг]
FROM Books
GROUP BY CodeOfPublisher
ORDER BY [Числится книг] DESC


--5.	Подсчитать сколько книг в среднем находится на руках у читателя. 
SELECT AVG([Числится книг]) as [Среднее количество книг]
FROM(
	SELECT ReaderID, COUNT(BookID) as [Числится книг]
	FROM JournalGiveBooks
	GROUP BY ReaderID
) as Subquery


--6.	Определить год издания книг, количество которых в библиотеке максимально
SELECT YearOfPublish
FROM Books
WHERE CodeOfPublisher = (
	SELECT TOP 1 CodeOfPublisher
	FROM Books
	GROUP BY CodeOfPublisher
	ORDER BY SUM(TotalCount) DESC
)


--7.	Определить дату выдачи максимального количества книг. 
SELECT DataOfGive, [Числится книг за датой]
FROM(
	SELECT TOP 1 ReaderID, DataOfGive, COUNT(*) as [Числится книг за датой]
	FROM JournalGiveBooks
	GROUP BY ReaderID, DataOfGive
	ORDER BY [Числится книг за датой] DESC
) as Subquery
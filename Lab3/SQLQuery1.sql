USE Library

--1.	���������� ���������� ���������, ������� �������� ����������.
SELECT Patronymic, COUNT(*) as ����������
FROM Readers
GROUP BY Patronymic
HAVING Patronymic='��������'


--2.	���������� ���������� ����, ������� �������� �� ������ ���������. 
SELECT ReaderID, COUNT(*) as [�������� ����]
FROM JournalGiveBooks
GROUP BY ReaderID


--3.	���������� ��� ��������, ������� ���� ������������ ����� ����. 
SELECT TOP 1 ReaderID, COUNT(*) as [�������� ����]
FROM JournalGiveBooks
GROUP BY ReaderID
ORDER BY [�������� ����] DESC


--4.	���������� ���  ������������, ���������� ���� �������� �����������.
SELECT TOP 1 CodeOfPublisher, SUM(TotalCount) as [�������� ����]
FROM Books
GROUP BY CodeOfPublisher
ORDER BY [�������� ����] DESC


--5.	���������� ������� ���� � ������� ��������� �� ����� � ��������. 
SELECT AVG([�������� ����]) as [������� ���������� ����]
FROM(
	SELECT ReaderID, COUNT(BookID) as [�������� ����]
	FROM JournalGiveBooks
	GROUP BY ReaderID
) as Subquery


--6.	���������� ��� ������� ����, ���������� ������� � ���������� �����������
SELECT YearOfPublish
FROM Books
WHERE CodeOfPublisher = (
	SELECT TOP 1 CodeOfPublisher
	FROM Books
	GROUP BY CodeOfPublisher
	ORDER BY SUM(TotalCount) DESC
)


--7.	���������� ���� ������ ������������� ���������� ����. 
SELECT DataOfGive, [�������� ���� �� �����]
FROM(
	SELECT TOP 1 ReaderID, DataOfGive, COUNT(*) as [�������� ���� �� �����]
	FROM JournalGiveBooks
	GROUP BY ReaderID, DataOfGive
	ORDER BY [�������� ���� �� �����] DESC
) as Subquery
--1. ������ ���������, � ������� �� ����� ��������� �����.
SELECT DISTINCT ReaderID as [ID ������� �����]
FROM JournalGiveBooks
WHERE BookID IN (
	SELECT BookID
	FROM JournalGiveBooks
	WHERE BookID IS NOT NULL
)


--2. ������ ���������, � �������  ��������� �����, ���� �������� ������� ������.
SELECT ReaderID as [���� ����� � ��������� � ID]
FROM JournalGiveBooks
WHERE DataNeedReturn < DataActualReturn


--3. ������ �����������, ����� ������� ��������� � ������� ����.
SELECT CodeOfPublisher
FROM Books
WHERE YearOfPublish = (
	SELECT YEAR(GETDATE()) - 1
)


--4. ������� �������� � ������������ ������ �������� �������� �����.
SELECT Surname
FROM Readers
WHERE ID = (
	SELECT TOP 1 ReaderID
	FROM JournalGiveBooks
	GROUP BY ReaderID
	ORDER BY MAX(DATEDIFF(DAY, DataNeedReturn, DataActualReturn)) DESC
)


--5. ������� ���������, ������� ������ ������� ����� � ��������� 3 ���.
SELECT Surname
FROM Readers
WHERE ID IN (
	SELECT ReaderID
	FROM JournalGiveBooks
	WHERE DATEDIFF(DAY, DataOfGive, DataNeedReturn) <= 3
)

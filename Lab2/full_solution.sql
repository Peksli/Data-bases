-- 1. ������� ��� ������� ������� ������ ����.
SELECT * FROM JournalGiveBooks


-- 2. ������� ������  ��������� � ��������� ����������
SELECT * FROM Readers WHERE Patronymic='��������'


-- 3. ������� ������ ���������, �� �������� �������� ����� � ����� 2, �������� � ������� ������.
SELECT * FROM JournalGiveBooks WHERE BookID=2 AND MONTH(DataOfGive)=1


-- 4. ������� ������  ����, �������� � 1980, 1990 � 2000 ����.
SELECT * FROM Books WHERE YearOfPublish IN (1980, 1990, 2000)


-- 5. �������  ����  ���������, ������� ����� ����� � ���������� ������.
SELECT ID, DataOfGive FROM JournalGiveBooks WHERE MONTH(DataOfGive)=1 



-- 6. ������� ������ ���������, � ������� ��� ��������.
SELECT * FROM Readers WHERE PhoneNumber IS NULL



-- 7. ������� ������ ����, �������� ������� ���������� �� ����� �».
SELECT * FROM Books WHERE Title LIKE '�%'

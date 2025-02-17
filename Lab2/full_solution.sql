-- 1. Вывести всю таблицу «Журнал выдачи книг».
SELECT * FROM JournalGiveBooks


-- 2. Вывести список  читателей с отчеством «Иванович»
SELECT * FROM Readers WHERE Patronymic='Иванович'


-- 3. Вывести список читателей, за которыми числится книга с кодом 2, выданная в прошлом месяце.
SELECT * FROM JournalGiveBooks WHERE BookID=2 AND MONTH(DataOfGive)=1


-- 4. Вывести список  книг, изданных в 1980, 1990 и 2000 году.
SELECT * FROM Books WHERE YearOfPublish IN (1980, 1990, 2000)


-- 5. Вывести  коды  читателей, которые брали книги в предыдущем месяце.
SELECT ID, DataOfGive FROM JournalGiveBooks WHERE MONTH(DataOfGive)=1 



-- 6. Вывести список читателей, у которых нет телефона.
SELECT * FROM Readers WHERE PhoneNumber IS NULL



-- 7. Вывести список книг, название которых начинается на букву «В».
SELECT * FROM Books WHERE Title LIKE 'В%'

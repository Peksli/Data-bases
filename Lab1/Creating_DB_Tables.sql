CREATE DATABASE Library
GO


USE Library
GO


CREATE TABLE Publishers
(
	PublisherID INT IDENTITY(1, 1) PRIMARY KEY,
	Publisher NVARCHAR(20)
)


CREATE TABLE Readers
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	NumberReaderTicket INT,
	Surname NVARCHAR(20),
	Name NVARCHAR(20),
	Patronymic NVARCHAR(20),
	PhoneNumber NVARCHAR(20),
	Address NVARCHAR(20)
)


CREATE TABLE Books
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	InventoryNumber INT,
	Author NVARCHAR(20),
	Title NVARCHAR(20),
	YearOfPublish INT,
	CodeOfPublisher INT,
	TotalCount INT

	FOREIGN KEY (CodeOfPublisher) REFERENCES Publishers(PublisherID) ON DELETE CASCADE
)


CREATE TABLE JournalGiveBooks
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	ReaderID INT,
	BookID INT,
	DataOfGive DATE,
	DataNeedReturn DATE,
	DataActualReturn DATE,

	FOREIGN KEY (ReaderID) REFERENCES Readers(ID) ON DELETE CASCADE,
	FOREIGN KEY (BookID) REFERENCES Books(ID) ON DELETE CASCADE
)
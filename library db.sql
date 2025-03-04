CREATE DATABASE LibraryDB
CREATE TABLE [Books]
(
[id] INT PRIMARY KEY IDENTITY(1,1),
[title] NVARCHAR(100) NOT NULL,
[author] NVARCHAR(100) NOT NULL,
[genre] NVARCHAR(100),
[available_copies] INT NOT NULL,
[times_borrowed] INT NOT NULL 
)
 
CREATE TABLE Readers 
(
[id] INT PRIMARY KEY IDENTITY(1,1),
[name] NVARCHAR(100) NOT NULL,
[identification_num] int, 
[age] INT NOT NULL
)
 
CREATE TABLE Loans 
(
[id] INT PRIMARY KEY IDENTITY(1,1),
[reader_id] INT  FOREIGN KEY REFERENCES [Readers]([id]),
[book_id] INT FOREIGN KEY  REFERENCES [Books]([id]),
[borrow_date] DATE,
[return_date] DATE,
)

INSERT INTO [Books]([title],[author],[genre],[available_copies],[times_borrowed])
Values
(@title,@author,@genre,@available_copies,@times_borrowed)

INSERT INTO [Readers](name, identification_num, age)
values 
(@name, @identification_num, age)

INSERT INTO Loans ([reader_id], [book_id], [borrow_date], [return_date])
values 
(@reader_id, @book_id, @borrow_date, @return_date)

SELECT * FROM Readers
SELECT * FROM Books
SELECT * FROM Loans

-- Create table Customers
CREATE TABLE Customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    Username NVARCHAR(45) NOT NULL,
    [FirstName] NVARCHAR(45) NOT NULL,
    [LastName] NVARCHAR(45) NOT NULL,
    Gender CHAR(1) NOT NULL CHECK (Gender IN ('M', 'F')),
    Phone CHAR(10) UNIQUE,
    Email VARCHAR(255) UNIQUE,
    City VARCHAR(50),
    [Address] VARCHAR(50),
	MembershipType VARCHAR(50) --Regular/CFRIEND/CVIP
);


-- Create table Movies
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(255),
    Duration INT,
    Subtitle BIT,
    Director VARCHAR(50),
    [Description] VARCHAR(500),
    [Language] VARCHAR(50),
    ReleaseDate DATETIME,
    TrailerURL VARCHAR(255),
	AgeRestriction INT,
	Genre VARCHAR(50),
);



-- Create table Cinemas
CREATE TABLE Cinemas (
    CinemaID INT PRIMARY KEY,
    [Name] VARCHAR(255) NOT NULL,
    [Location] VARCHAR(255) NOT NULL,
    TotalScreens INT CHECK (TotalScreens > 0)
);

-- Create table Discounts
CREATE TABLE Discounts (
    DiscountID VARCHAR(10) PRIMARY KEY,
    [Description] VARCHAR(255),
    DiscountValue DECIMAL(10, 2),
);

-- Create table PaymentMethods
CREATE TABLE PaymentMethods (
    PaymentMethodID INT PRIMARY KEY,
    MethodName VARCHAR(50),
    [Description] VARCHAR(255)
);

-- Create table Booking
CREATE TABLE Booking (
	BookingID VARCHAR(30) PRIMARY KEY,
	CustomerID VARCHAR(10) NOT NULL,
	BookingDate DATETIME, -- automatic current date
	TransactionStatus VARCHAR(20) CHECK (TransactionStatus IN ('Pending', 'Confirmed', 'Cancelled')),
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-- Create table Transactions
CREATE TABLE Transactions (
    TransactionID VARCHAR(10) PRIMARY KEY,
    BookingID VARCHAR(30) NOT NULL,
    --FinalAmount DECIMAL(10, 2), -- sua lai cach tinh quantity * pricePerUnit
	FinalAmount DECIMAL(10, 2) NULL,
    DiscountID VARCHAR(10) NULL,
    TransactionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    PaymentMethodID INT,
	CustomerID VARCHAR(10),

    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID),
    FOREIGN KEY (DiscountID) REFERENCES Discounts(DiscountID),
    FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethods(PaymentMethodID),
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

ALTER TABLE Transactions
alter column DiscountID


-- Create table TicketPrice
CREATE TABLE TicketPrice (
	PriceID INT PRIMARY KEY,
	CinemaID INT,
	BasePrice DECIMAL(10, 2),
	AgeGroup INT,
	SeatType INT,
	FOREIGN KEY (CinemaID) REFERENCES Cinemas(CinemaID)
);


-- Create table Rooms
CREATE TABLE Rooms (
	RoomID VARCHAR(10) PRIMARY KEY,
	CinemaID INT,
	Capacity INT CHECK (Capacity > 0),

	FOREIGN KEY (CinemaID) REFERENCES Cinemas(CinemaID)
);



	-- Create table Seats
CREATE TABLE Seats (
	SeatID VARCHAR(20) PRIMARY KEY,
	RoomID VARCHAR(10) NOT NULL,
	SeatNumber INT NOT NULL,
	[Row] CHAR(1),
	[Status] BIT,
	[Type] CHAR(1),

	CONSTRAINT FK_Room FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID),
	CONSTRAINT UQ_Room_Seat UNIQUE (RoomID, SeatNumber, [Row]) --  dam bao cac ghe la duy nhat cho moi roomID
);



-- Create table ShowTimes
CREATE TABLE ShowTimes (
	ShowTimeID INT PRIMARY KEY, 
	MovieID INT NOT NULL,
	StartTime VARCHAR(10),

	FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

-- Create table DetailBooking
CREATE TABLE DetailBooking (
	DetailBookingID INT PRIMARY KEY,
	BookingID VARCHAR(30) NOT NULL,
	TicketID VARCHAR(30) NULL, -- Nullable
	FoodID VARCHAR(30) NULL, -- Nullable
	PricePerUnit DECIMAL(10, 2),
	Quantity INT,
	ProductType VARCHAR(20) NOT NULL, -- Values 'Ticket' or 'Food'


	-- Foreign key
	FOREIGN KEY (BookingID) REFERENCES Booking(BookingID),
	FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID),
	FOREIGN KEY (FoodID) REFERENCES FoodAndBeverages(FoodID), -- reference to either FoodAndBeverages or Ticket

	-- 1 of them is not null
	CONSTRAINT CHK_TicketOrFood CHECK (TicketID IS NOT NULL OR FoodID IS NOT NULL),

	-- Ensure ProductType aligns with either TicketID or FoodID
	CONSTRAINT CHK_ProductType CHECK (
	    (ProductType = 'Ticket' AND TicketID IS NOT NULL AND FoodID IS NULL) OR 
	    (ProductType = 'Food' AND FoodID IS NOT NULL AND TicketID IS NULL)
	),

	CONSTRAINT UQ_Booking_TicketFood UNIQUE (BookingID, TicketID, FoodID)

	--CONSTRAINT UQ_Booking_Ticket UNIQUE (BookingID, TicketID),
    --CONSTRAINT UQ_Booking_Food UNIQUE (BookingID, FoodID), -- Unique composite key -- Trong truong hop co nhieu phan loai hang

);

alter table DetailBooking
ADD CONSTRAINT UQ_Booking_TicketFood UNIQUE (BookingID, TicketID, FoodID)


-- Create table Ticket
CREATE TABLE Ticket (
	TicketID VARCHAR(30) PRIMARY KEY,
	PriceID INT NOT NULL,
	SeatID VARCHAR(20) NOT NULL,
	MovieID INT NOT NULL,
	ShowTimeID INT NOT NULL,


	FOREIGN KEY (PriceID) REFERENCES TicketPrice(PriceID),
	FOREIGN KEY (SeatID) REFERENCES Seats(SeatID),
	FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
	FOREIGN KEY (ShowTimeID) REFERENCES ShowTimes(ShowTimeID)
);


-- Create table FoodAndBeverages
CREATE TABLE FoodAndBeverages (
	FoodID VARCHAR(30) PRIMARY KEY,
	CinemaID INT NOT NULL,
	ProductName VARCHAR(255),
	Category VARCHAR(255),
	Price DECIMAL(10, 2),

	FOREIGN KEY (CinemaID) REFERENCES Cinemas(CinemaID)
);



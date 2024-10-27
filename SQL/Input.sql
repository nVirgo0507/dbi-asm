-- ============ INSERT DATA ============ --
-- Food
INSERT INTO FoodAndBeverages (ProductName, Category, Price, CinemaID) VALUES
('Popcorn', 'Snack', 5.00, 1), -- CinemaID 1
('Soda', 'Drink', 3.00, 1),
('Candy', 'Snack', 2.50, 1),
('Nachos', 'Snack', 4.50, 2), -- CinemaID 2
('Water', 'Drink', 1.00, 2);

-- Cinema
INSERT INTO Cinemas (CinemaID, Name, Location, TotalScreens) VALUES
(1, N'Cinestar Đà Lạt', N'Đà Lạt', 5),
(2, 'Cinestar Sinh Viên', N'Bình Dương', 6);

-- Thêm phòng cho Cinema 
-- Rooms
INSERT INTO Rooms (CinemaID, Capacity) 
VALUES 
(1, 100),  -- Room 1
(2, 100);

-- Seats (S)
INSERT INTO Seats(RoomID, SeatNumber, [Row])
VALUES
('C1R1', 1, 'A'),
('C1R1', 2, 'A'),
('C1R1', 3, 'A'),
('C1R1', 4, 'A'),
('C1R1', 5, 'A'),
('C1R1', 6, 'A'),
('C1R1', 7, 'A'),
('C1R1', 8, 'A'),


('C1R2', 1, 'A'),
('C1R2', 2, 'A'),
('C1R2', 3, 'A'),
('C1R2', 4, 'A'),

('C1R2', 1, 'B'),
('C1R2', 2, 'B'),
('C1R2', 3, 'B'),
('C1R2', 4, 'B');

-- Seats (D)
INSERT INTO Seats(RoomID, SeatNumber, [Row], [Type])
VALUES 
('C1R2', 5, 'B', 'D'),
('C1R2', 6, 'B', 'D'),
('C1R2', 7, 'B', 'D'),
('C1R2', 8, 'B', 'D');	



INSERT INTO Seats(RoomID, SeatNumber, [Row])
VALUES
('C2R1', 1, 'A'),
('C2R1', 2, 'A'),
('C2R1', 3, 'A'),
('C2R1', 4, 'A'),
('C2R1', 5, 'A'),
('C2R1', 6, 'A'),
('C2R1', 7, 'A'),
('C2R1', 8, 'A'),

('C2R2', 1, 'A'),
('C2R2', 2, 'A'),
('C2R2', 3, 'A'),
('C2R2', 4, 'A'),

('C2R2', 1, 'B'),
('C2R2', 2, 'B'),
('C2R2', 3, 'B'),
('C2R2', 4, 'B');

-- Seats (D) - Cinema2
INSERT INTO Seats(RoomID, SeatNumber, [Row], [Type])
VALUES 
('C2R2', 5, 'B', 'D'),
('C2R2', 6, 'B', 'D'),
('C2R2', 7, 'B', 'D'),
('C2R2', 8, 'B', 'D');


--BasePrice:
-- AgeGroup: 1; SeatType: 0 --> BasePrice: 65000
-- AgeGroup: 2; SeatType: 0 --> BasePrice: 45000
-- AgeGroup: 1; SeatType: 1 --> BasePrice: 135000

-- SeatType: 0 - single; 1 - double
INSERT INTO TicketPrice(PriceID, CinemaID, BasePrice, AgeGroup, SeatType)
VALUES
(1, 1, 65000, 1, 0),
(2, 1, 45000, 2, 0),
(3, 1, 135000, 1, 1); 


-- ShowTimes
INSERT INTO ShowTimes (ShowTimeID, MovieID, StartTime)
VALUES 
(1, 1, '08:30:00'),
(2, 1, '09:40:00'),
(3, 1, '10:40:00'),
(4, 1, '11:50:00'),
(5, 1, '12:50:00'),
(6, 1, '14:00:00'),
(7, 2, '10:25:00'),
(8, 2, '13:00:00'),
(9, 2, '15:35:00'),
(10, 2, '17:05:00'),
(11, 2, '18:10:00'),
(12, 2, '19:40:00'),
(13, 3, '09:00:00'),
(14, 3, '12:00:00'),
(15, 3, '15:00:00'),
(16, 3, '18:00:00'),
(17, 3, '21:00:00'),
(18, 3, '24:00:00'),
(19, 4, '08:00:00'),
(20, 4, '11:00:00'),
(21, 4, '14:00:00'),
(22, 4, '17:00:00'),
(23, 4, '20:00:00'),
(24, 4, '23:00:00'),
(25, 5, '09:00:00'),
(26, 5, '12:00:00'),
(27, 5, '15:00:00'),
(28, 5, '18:00:00'),
(29, 5, '21:00:00'),
(30, 5, '24:00:00'),
(31, 6, '08:30:00'),
(32, 6, '11:30:00'),
(33, 6, '14:30:00'),
(34, 6, '17:30:00'),
(35, 6, '20:30:00'),
(36, 6, '23:30:00'),
(37, 7, '09:00:00'),
(38, 7, '12:00:00'),
(39, 7, '15:00:00'),
(40, 7, '18:00:00'),
(41, 7, '21:00:00'),
(42, 7, '24:00:00'),
(43, 8, '08:00:00'),
(44, 8, '11:00:00'),
(45, 8, '14:00:00'),
(46, 8, '17:00:00'),
(47, 8, '20:00:00'),
(48, 8, '23:00:00');


-- Ticket
INSERT INTO Ticket(PriceID, SeatID, MovieID, ShowTimeID)
VALUES
(1, 'C1R1A1', 1, 1),  -- PriceID 1, Seat C1R1A1, Movie Inception, ShowTime 08:00
(2, 'C1R1A2', 1, 1),  -- PriceID 2, Seat C1R1A2, Movie Inception, ShowTime 08:00
(3, 'C1R1A3', 1, 7);  -- PriceID 3, Seat C1R1A3, Movie Shawshank Redemption, ShowTime 08:30

INSERT INTO Ticket(PriceID, SeatID, MovieID, ShowTimeID)
VALUES
(1, 'C1R1A4', 1, 7), -- PriceID 1, Seat C1R1A4, Movie The Dark Knight, ShowTime 09:00
(2, 'C1R1A5', 4, 19), -- PriceID 2, Seat C1R1A5, Movie Pulp Fiction, ShowTime 08:00
(3, 'C1R1A6', 5, 25), -- PriceID 3, Seat C1R1A6, Movie Forrest Gump, ShowTime 09:00
(1, 'C1R1A7', 6, 31), -- PriceID 1, Seat C1R1A7, Movie The Matrix, ShowTime 08:30
(2, 'C1R1A8', 7, 37), -- PriceID 2, Seat C1R1A8, Movie Interstellar, ShowTime 09:00
(3, 'C1R2A1', 8, 43), -- PriceID 3, Seat C1R2A1, Movie Silence of the Lambs, ShowTime 08:00
(1, 'C1R2A2', 1, 3),  -- PriceID 1, Seat C1R2A2, Movie Inception, ShowTime 14:00
(2, 'C1R2A3', 2, 4),  -- PriceID 2, Seat C1R2A3, Movie Shawshank Redemption, ShowTime 17:00
(3, 'C1R2A4', 3, 5);  -- PriceID 3, Seat C1R2A4, Movie The Dark Knight, ShowTime 20:00

INSERT INTO Ticket(PriceID, SeatID, MovieID, ShowTimeID)
VALUES
(1, 'C2R1A1', 1, 1),  
(2, 'C2R1A2', 1, 1),  
(3, 'C2R1A3', 1, 7),
(1, 'C2R1A4', 1, 7), 
(2, 'C2R1A5', 4, 19), 
(3, 'C2R1A6', 5, 25);


-- =========== Movies =========== --
select * from Movies
-- Movies
INSERT INTO Movies (MovieID, Title, Duration, Subtitle, Director, [Description], [Language], ReleaseDate, TrailerURL, AgeRestriction, Genre)
VALUES 
(1, N'VENOM: KÈO CUỐI', 109, 1, 'Kelly Marcel', N'Venom phải đối mặt với kẻ thù lớn nhất từ trước đến nay', 'English', '2024-10-25', 'https://youtu.be/6yCMRxGI4RA', 'T13', N'Hành Động'),
(2, N'NGÀY XƯA CÓ MỘT CHUYỆN TÌNH', 142, 0, N'Trịnh Đình Lê Minh', N'Ngày Xưa Có Một Chuyện Tình xoay quanh câu chuyện tình bạn', N'Tiếng Việt', '2024-11-01', 'https://youtu.be/4Y2q2tx1Ee8', 'T16', N'Tình Cảm'),
(3, N'CÔ DÂU HÀO MÔN', 152, 1, N'Vũ Ngọc Đãng', N'Bộ phim xoay quanh câu chuyện làm dâu nhà hào môn', N'Tiếng Việt', '2024-10-18', 'https://youtu.be/OP5X4Bp-g78', 'T18', N'Tình Cảm'),
(4, N'QUỶ ĂN TẠNG 2', 154, 0, 'Taweewat Wantha', N'Giữa những phép thuật ma quỷ và những sinh vật nguy hiểm.', N'Thái Lan', '2024-10-18', 'https://youtu.be/3ghi6ffcfAI', 'T18', N'Kinh Dị'),
(5, N'TRÒ CHƠI NHÂN TÍNH', 142, 0, 'WILLIAM AHERNE', N'Lễ hội trường bỗng biến thành sân chơi "khát máu" của thế lực bí ẩn', N'Thái Lan', '2024-10-06', 'https://youtu.be/pMOxeYCXrJY', 'T16', N'Kinh Dị'),
(6, N'BIỆT ĐỘI HOTGIRL', 136, 1, N'Vĩnh Khương', N'Câu chuyện của 6 cô gái đến từ 3 quốc gia Châu Á.', N'Việt Nam', '2024-10-31', 'https://youtu.be/Qr5wEF3NAOA', 'T16', 'Tình Cảm'),
(7, N'ELLI VÀ BÍ ẨN CHIẾC TÀU MA', 169, 1, 'Piet De Rycker', N'Một hồn ma nhỏ vô gia cư gõ cửa nhà những cư dân lập dị của Chuyến tàu ma để tìm kiếm một nơi thuộc về.', N'Khác', '2024-10-07', 'https://youtu.be/j_rApVdDV-E', 'P', N'Hoạt Hình'),
(8, N'ROBOT HOANG DÃ 2D LT', 118, 0, 'Chris Sanders', N'Cuộc phiêu lưu hoành tráng theo chân hành trình của một robot — đơn vị ROZZUM 7134.', N'Hoa Kỳ', '2024-10-14', 'https://youtu.be/HIIqMUqzsTw', 'P', 'Hoạt Hình');


-- ========== DETAIL BOOKING ========== --
INSERT INTO DetailBooking (DetailBookingID, BookingID, TicketID, ProductType)
VALUES (1, 'B00001', 'TC1M1S1-2EAB3A13', 'Ticket');

-- Insert for Food (without specifying PricePerUnit)
INSERT INTO DetailBooking (DetailBookingID, BookingID, FoodID, Quantity, ProductType)
VALUES (2, 'B00001', 'FOOD-25702CE0', 1, 'Food');


INSERT INTO DetailBooking (DetailBookingID, BookingID, FoodID, Quantity, ProductType)
VALUES (3, 'B00002', 'FOOD-25702CE0', 2, 'Food')

INSERT INTO DetailBooking (DetailBookingID, BookingID, TicketID, ProductType)
VALUES (4, 'B00003', 'TC1M1S1-B93F4D6D', 'Ticket')

INSERT INTO DetailBooking (DetailBookingID, BookingID, TicketID, ProductType)
VALUES (5, 'B00004', 'TC1M5S25-EB92AC39', 'Ticket');

INSERT INTO DetailBooking (DetailBookingID, BookingID, FoodID, Quantity, ProductType)
VALUES (6, 'B00004', 'FOOD-5C5F15A5', 3, 'Food');

INSERT INTO DetailBooking (DetailBookingID, BookingID, FoodID, Quantity, ProductType)
VALUES (7, 'B00004', 'FOOD-AD8D8F00', 1, 'Food');

INSERT INTO DetailBooking (DetailBookingID, BookingID, FoodID, Quantity, ProductType)
VALUES (8, 'B00004', 'FOOD-25702CE0', 3, 'Food');

INSERT INTO DetailBooking (DetailBookingID, BookingID, FoodID, Quantity, ProductType)
VALUES (9, 'B00006', 'FOOD-25702CE0', 2, 'Food');

INSERT INTO DetailBooking (DetailBookingID, BookingID, FoodID, Quantity, ProductType)
VALUES (10, 'B00007', 'FOOD-25702CE0', 3, 'Food');

INSERT INTO DetailBooking (DetailBookingID, BookingID, TicketID, ProductType)
VALUES (11, 'B00008', 'TC1M3S5-687D0BEA', 'Ticket');

INSERT INTO DetailBooking (DetailBookingID, BookingID, FoodID, Quantity, ProductType)
VALUES 
(12, 'B00008', 'FOOD-25702CE0', 2, 'Food'),
(13, 'B00009', 'FOOD-25702CE0', 4, 'Food');

INSERT INTO DetailBooking (DetailBookingID, BookingID, TicketID, ProductType)
VALUES (14, 'B00009', 'TC1M7S37-2FA21465', 'Ticket');


-- ========== Booking ========== --
INSERT INTO Booking(BookingID, CustomerID, TransactionDate)
VALUES
('B00001', 'C00001', NULL),
('B00002', 'C00002', NULL),
('B00003', 'C00003', NULL),
('B00004', 'C00004', NULL),
('B00005', 'C00005', NULL);

-- Test cac truong hop co ngay giam gia
INSERT INTO Booking(BookingID, CustomerID, TransactionDate, BookingDate)
VALUES
('B00006', 'C00005', NULL, '2024-10-28 20:20:41.683'),
('B00007', 'C00005', NULL, '2024-10-30 16:20:41.683'),
('B00008', 'C00005', NULL, '2024-10-30 08:20:41.683'),
('B00009', 'C00003', NULL, '2024-10-27 19:20:41.683');


-- ========== Customers ========== --
-- Thêm dữ liệu vào bảng Customers
INSERT INTO Customers (CustomerID, Username, FirstName, LastName, Gender, Phone, Email, City, Address, MembershipType)
VALUES 
('C00001', N'Cineguest', 'Vy', N'Trần Thúy', 'F', '0985677213', 'vynhinhanh@gmail.com', N'Đà Lạt', N'12/8 Ngõ 6', 'Regular'),
('C00002', N'Love_plus', 'Nhi', N'Phạm Dương', 'F', '0987654321', 'traxanh18@gmail.com', N'Hồ Chí Minh', N'10D Phan Chu Trinh Q10', 'CFRIEND'),
('C00003', N'cậu_bé_bút_chì', 'Thanh', N'Lê Thị', 'F', '0915789432', 'teddybear@hotmail.com', N'Đà Lạt', N'11/80 Ngô Tất Tố', 'CVIP'),
('C00004', N'hoa_hồng_đen', 'Minh', N'Trần Tô Chí', 'M', '0876999435', 'coolkid19@gmail.com', N'Hà Nội', N'145D/2 Hẻm 3 Đống Đa', 'Regular'),
('C00005', N'phú_bà', 'Dương', 'Nguyễn Trần Khánh ', 'M', '0739187660', 'sadkidz@gmail.com', N'Bình Dương', N'353E Võ Chí Công', 'CFRIEND');

-- ========== Discounts ========== --
INSERT INTO Discounts (DiscountID, DiscountValue, [Description])
VALUES
('DISC00001', 0.15, 'For C''VIP'),
('DISC00002', 0.1, 'For C''FRIEND');

-- ========== Payment Methods ========== --
INSERT INTO PaymentMethods (PaymentMethodID, MethodName, [Description])
VALUES
(1, 'MBBank', N'Ngân Hàng MB'),
(2, 'VCBank', N'Ngân Hàng VietcomBank'),
(3, 'Momo', N'Ví Momo');


INSERT INTO Transactions(TransactionID, BookingID, PaymentMethodID)
VALUES
('TRANS00001', 'B00001', 1),
('TRANS00002', 'B00002', 1),
('TRANS00003', 'B00003', 1),
('TRANS00004', 'B00004', 1),
('TRANS00005', 'B00005', 1),
('TRANS00006', 'B00006', 1),
('TRANS00007', 'B00007', 1),
('TRANS00008', 'B00008', 1),
('TRANS00009', 'B00009', 1);

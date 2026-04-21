-- Thiết kế I/O và luồng:
-- Tạo 1 bảng bookings gồm booking_id tự tăng, status, user_id
-- sau đó đặt điều kiện nếu status = 'CANCELLED' thì trả về 1, còn ko thì trả về 0
-- rồi dùng hàm sum để tính xem tổng số lần trả về 1
-- cụ thể là mỗi lần status = 'CANCELLED' thì sẽ trả về 1 hoặc 0 nếu dùng count nó sẽ đếm cả những lần trả về 0
-- vd như có 7 lần 1 và 3 lần 0, dùng count thì sẽ đếm ra 10, còn sum thì chỉ là 7 thôi
-- tiếp là nhóm tổng số lần Hủy này theo user_id
-- đặt điều kiện ở having, count(*)>10, số lần hủy>5

CREATE DATABASE anti_fraud;
USE anti_fraud;

CREATE TABLE bookings (
	booking_id INT PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR (50) NOT NULL,
    user_id INT NOT NULL
);

INSERT INTO bookings (status, user_id)
VALUES 
	('COMPLETED', 36),
	('CANCELLED', 1),
	('PENDING', 69),
	('CANCELLED', 6969),
	('COMPLETED', 1),
	('CANCELLED', 36),
	('COMPLETED', 6969),
	('CANCELLED', 1),
	('COMPLETED', 69),
	('CANCELLED', 6969),
	('PENDING', 36),
	('CANCELLED', 1),
	('COMPLETED', 1),
	('CANCELLED', 69),
	('COMPLETED', 6969),
	('CANCELLED', 1),
	('PENDING', 6969),
	('COMPLETED', 36),
	('CANCELLED', 6969),
	('COMPLETED', 69),
	('CANCELLED', 1),
	('COMPLETED', 6969),
	('PENDING', 1),
	('CANCELLED', 36),
	('COMPLETED', 36),
	('CANCELLED', 6969),
	('COMPLETED', 1),
	('CANCELLED', 69),
	('COMPLETED', 6969),
	('CANCELLED', 1),
	('PENDING', 36),
	('COMPLETED', 1),
	('CANCELLED', 6969),
	('COMPLETED', 69),
	('CANCELLED', 6969),
	('COMPLETED', 36),
	('CANCELLED', 1),
	('COMPLETED', 6969),
	('CANCELLED', 36),
	('COMPLETED', 1);
    
SELECT user_id, count(*) AS total_bookings,
sum(CASE WHEN status = 'CANCELLED' THEN 1 ELSE 0 END) as total_cancelled
FROM bookings
GROUP BY user_id
HAVING total_bookings >10 AND total_cancelled >5; 

SELECT user_id, count(*) AS total_bookings,
sum(case when status = 'CANCELLED' then 1 else 0 end) as total_cancelled
FROM bookings
GROUP BY user_id;
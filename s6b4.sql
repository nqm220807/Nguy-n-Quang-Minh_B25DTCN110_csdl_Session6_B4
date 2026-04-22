-- 1. Hai hướng tiếp cận
-- Cách 1 — Lọc trễ (anti-pattern):
-- Gom tất cả booking (kể cả CANCELLED/FAILED), rồi trong HAVING mới “lọc”:
-- Đếm COMPLETED bằng conditional aggregation
-- Tính AVG(total_price) nhưng phải cẩn trọng: nếu không lọc sớm, average sẽ bị “nhiễu” bởi đơn không hợp lệ hoặc phải viết CASE phức tạp.
-- Cách 2 — Lọc sớm (clean & chuẩn production):
-- Loại bỏ rác ngay từ WHERE, sau đó mới aggregate

-- 2. Cách tối ưu nhất
SELECT hotel_id
FROM bookings
WHERE status = 'COMPLETED'
GROUP BY hotel_id
HAVING COUNT(*) >= 50 AND AVG(total_price) > 3000000;
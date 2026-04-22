-- GIẢI PHÁP 1: DÙNG OR
-- So sánh từng giá trị bằng dấu '=' rồi nối bằng OR

SELECT *
FROM Orders
WHERE reason = 'KHACH_HUY'
   OR reason = 'QUAN_DONG_CUA'
   OR reason = 'KHONG_CO_TAI_XE'
   OR reason = 'BOM_HANG';
-- Nhược điểm:
-- - Code dài, lặp lại nhiều
-- - Khó bảo trì nếu thêm nhiều điều kiện
-- - Khi có nhiều nguyên nhân → rất rối

-- GIẢI PHÁP 2: DÙNG IN  
-- Gom các giá trị thành 1 tập hợp rồi kiểm tra thuộc tập

SELECT *
FROM Orders
WHERE reason IN (
    'KHACH_HUY',
    'QUAN_DONG_CUA',
    'KHONG_CO_TAI_XE',
    'BOM_HANG'
);

-- Ưu điểm:
-- - Ngắn gọn, dễ đọc
-- - Dễ mở rộng (chỉ thêm phần tử vào list)

-- SO SÁNH NHANH
-- OR:
--   + Dễ hiểu với người mới
--    Code roois khi nhiều điều kiện
--
-- IN:
--   + Clean code
--   + 10, 20, 100 giá trị vẫn ok
--   + Hiệu năng tốt hơn

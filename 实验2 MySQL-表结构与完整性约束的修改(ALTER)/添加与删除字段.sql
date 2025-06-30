USE MyDb;

-- 语句1：删除 orderDetail 表中的 orderDate 列
ALTER TABLE orderDetail DROP COLUMN orderDate;

-- 语句2：添加 unitPrice 列，类型是 numeric(10,2)
ALTER TABLE orderDetail ADD unitPrice NUMERIC(10,2);

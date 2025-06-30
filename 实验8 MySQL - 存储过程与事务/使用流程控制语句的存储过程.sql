use fib;

-- 创建存储过程`sp_fibonacci(in m int)`，向表fibonacci插入斐波拉契数列的前m项，及其对应的斐波拉契数。fibonacci表初始值为一张空表。请保证你的存储过程可以多次运行而不出错。

drop procedure if exists sp_fibonacci;
delimiter $$
create procedure sp_fibonacci(in m int)
begin
######## 请补充代码完成存储过程体 ########
    DECLARE i INT DEFAULT 0;
    DECLARE f0 BIGINT DEFAULT 0;
    DECLARE f1 BIGINT DEFAULT 1;
    DECLARE fn BIGINT;

    -- 当前最大已有的项数
    DECLARE max_n INT;

    -- 查询已有的最大 n 值，空表时为 NULL，用 IFNULL 变成 -1（表示还未插入过第0项）
    SELECT IFNULL(MAX(n), -1) INTO max_n FROM fibonacci;

    -- 从 max_n + 1 开始插入，直到 m-1
    SET i = max_n + 1;

    WHILE i < m DO
        IF i = 0 THEN
            SET fn = 0;
        ELSEIF i = 1 THEN
            SET fn = 1;
        ELSE
            SET fn = f0 + f1;
            SET f0 = f1;
            SET f1 = fn;
        END IF;

        INSERT INTO fibonacci(n, fibn) VALUES(i, fn);
        SET i = i + 1;
    END WHILE;

end $$

delimiter ;

 

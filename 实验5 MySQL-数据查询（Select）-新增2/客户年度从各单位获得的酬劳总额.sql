-- 将客户年度从各单位获得的酬劳进行排序


SELECT 
    c.c_name,
    EXTRACT(YEAR FROM w.w_time) AS year,
    c.c_id_card,
    COALESCE(SUM(CASE WHEN w.w_type = 1 THEN w.w_amount ELSE 0 END), 0) AS full_t_amount,
    COALESCE(SUM(CASE WHEN w.w_type = 2 THEN w.w_amount ELSE 0 END), 0) AS part_t_amount
FROM 
    client c
JOIN 
    wage w ON c.c_id = w.w_c_id
GROUP BY 
    c.c_name, c.c_id_card, EXTRACT(YEAR FROM w.w_time)
ORDER BY 
    (SUM(CASE WHEN w.w_type = 1 THEN w.w_amount ELSE 0 END) + 
     SUM(CASE WHEN w.w_type = 2 THEN w.w_amount ELSE 0 END)) DESC;



/* end of you code */
-- 16) 查询持有相同基金组合的客户对，如编号为A的客户持有的基金，编号为B的客户也持有，反过来，编号为B的客户持有的基金，编号为A的客户也持有，则(A,B)即为持有相同基金组合的二元组，请列出这样的客户对。为避免过多的重复，如果(1,2)为满足条件的元组，则不必显示(2,1)，即只显示编号小者在前的那一对，这一组客户编号分别命名为c_id1,c_id2。

-- 请用一条SQL语句实现该查询：

SELECT 
    p1.pro_c_id AS c_id1,
    p2.pro_c_id AS c_id2
FROM 
    property p1
JOIN 
    property p2 
ON 
    p1.pro_pif_id = p2.pro_pif_id 
    AND p1.pro_c_id < p2.pro_c_id
WHERE 
    p1.pro_type = 3 
    AND p2.pro_type = 3
GROUP BY 
    p1.pro_c_id, p2.pro_c_id
HAVING 
    COUNT(*) = (
        SELECT COUNT(*)
        FROM property p3
        WHERE p3.pro_c_id = p1.pro_c_id 
        AND p3.pro_type = 3
    )
AND 
    COUNT(*) = (
        SELECT COUNT(*)
        FROM property p4
        WHERE p4.pro_c_id = p2.pro_c_id 
        AND p4.pro_type = 3
    );






/*  end  of  your code  */
-- 13) 综合客户表(client)、资产表(property)、理财产品表(finances_product)、
--     保险表(insurance)、基金表(fund)和投资资产表(property)，
--     列出所有客户的编号、名称和总资产，总资产命名为total_property。
--     总资产为储蓄卡余额，投资总额，投资总收益的和，再扣除信用卡透支的金额
--     (信用卡余额即为透支金额)。客户总资产包括被冻结的资产。
--    请用一条SQL语句实现该查询：

SELECT 
    c_id,
    c_name,
    IFNULL(SUM(profit), 0) AS total_property
FROM 
    client 
LEFT JOIN (
    SELECT
        b_c_id AS pro_c_id,
        SUM(
            IF(
                b_type = '储蓄卡',
                b_balance,
                -b_balance
            )
        ) AS profit
    FROM 
        bank_card
    GROUP BY 
        b_c_id

    UNION ALL

    SELECT 
        pro_c_id,
        p_amount * pro_quantity + pro_income AS profit
    FROM 
        property 
    JOIN 
        finances_product ON pro_pif_id = p_id
    WHERE 
        pro_type = '1'

    UNION ALL

    SELECT 
        pro_c_id,
        i_amount * pro_quantity + pro_income AS profit
    FROM 
        property 
    JOIN 
        insurance ON pro_pif_id = i_id
    WHERE 
        pro_type = '2'

    UNION ALL

    SELECT 
        pro_c_id,
        f_amount * pro_quantity + pro_income AS profit
    FROM 
        property 
    JOIN 
        fund ON pro_pif_id = f_id
    WHERE 
        pro_type = '3'
) pro 
ON c_id = pro.pro_c_id
GROUP BY 
    c_id;







/*  end  of  your code  */ 
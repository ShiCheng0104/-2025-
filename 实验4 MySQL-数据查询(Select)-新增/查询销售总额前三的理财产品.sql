 -- 1) 查询销售总额前三的理财产品
--   请用一条SQL语句实现该查询：

WITH yearly_ranked_products AS (
    SELECT
        YEAR(pro_purchase_time) AS pyear,
        pro_pif_id AS p_id,
        SUM(property.pro_quantity * p_amount) AS sumamount,
        RANK() OVER (
            PARTITION BY YEAR(pro_purchase_time)
            ORDER BY SUM(property.pro_quantity * p_amount) DESC
        ) AS rk
    FROM
        property
    JOIN
        finances_product ON property.pro_pif_id = finances_product.p_id
    WHERE
        pro_type = 1
        AND pro_purchase_time BETWEEN '2010-01-01' AND '2011-12-31'
    GROUP BY
        YEAR(pro_purchase_time), pro_pif_id
)
SELECT pyear, rk, p_id, sumamount
FROM yearly_ranked_products
WHERE rk <= 3
ORDER BY pyear, rk;
/*  end  of  your code  */
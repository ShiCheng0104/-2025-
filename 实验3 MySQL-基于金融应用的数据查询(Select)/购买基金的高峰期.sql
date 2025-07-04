-- 17 查询2022年2月购买基金的高峰期。至少连续三个交易日，所有投资者购买基金的总金额超过100万(含)，则称这段连续交易日为投资者购买基金的高峰期。只有交易日才能购买基金,但不能保证每个交易日都有投资者购买基金。2022年春节假期之后的第1个交易日为2月7日,周六和周日是非交易日，其余均为交易日。请列出高峰时段的日期和当日基金的总购买金额，按日期顺序排序。总购买金额命名为total_amount。
--    请用一条SQL语句实现该查询：

select
    daycnt.pro_purchase_time as pro_purchase_time,
    daycnt.amount as total_amount
from (
        select
            *,
            count(*) over(
                partition by orderday.workday - orderday.rownum
            ) cnt
        from (
                select
                    *,
                    row_number() over(
                        order by workday
                    ) rownum
                from (
                        select
                            pro_purchase_time,
                            sum(pro_quantity * f_amount) as amount,
                            datediff(
                                pro_purchase_time,
                                "2021-12-31"
                            ) - 2 * week(pro_purchase_time) as workday
                        from
                            property,
                            fund
                        where
                            pro_pif_id = f_id
                            and pro_type = 3
                            and pro_purchase_time like "2022-02-%"
                        group by
                            pro_purchase_time
                    ) amount_by_day
                where
                    amount_by_day.amount > 1000000
            ) orderday
    ) daycnt
where daycnt.cnt >= 3;

/*  end  of  your code  */
...
SELECT
    t1.investor_id,
    t2.sector_name,
    ROUND(
        (t1.no_of_shares * 100.0) / 
        SUM(t1.no_of_shares) OVER (PARTITION BY t1.investor_id), -- Key line
        2
    ) AS share_percentage
FROM
    investor_transactions t1
JOIN
    sectors t2 ON t1.sector_id = t2.sector_id
...

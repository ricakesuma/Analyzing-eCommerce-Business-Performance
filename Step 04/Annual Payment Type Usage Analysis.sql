--1.
SELECT
    payment_type AS tipe_pembayaran,
    COUNT(payment_type) AS jumlah_penggunaan
FROM public.order_payments_dataset
GROUP BY payment_type
ORDER BY jumlah_penggunaan DESC;

--2.
WITH YearlyPayments AS (
    SELECT
        EXTRACT(YEAR FROM o.order_purchase_timestamp) AS tahun,
        op.payment_type AS tipe_pembayaran,
        COUNT(op.payment_type) AS jumlah_penggunaan
    FROM public.order_payments_dataset op
    JOIN public.orders_dataset o ON op.order_id = o.order_id
    WHERE EXTRACT(YEAR FROM o.order_purchase_timestamp) BETWEEN 2016 AND 2018
    GROUP BY tahun, op.payment_type
)

SELECT
    tipe_pembayaran,
    SUM(CASE WHEN tahun = 2016 THEN jumlah_penggunaan ELSE 0 END) AS "2016",
    SUM(CASE WHEN tahun = 2017 THEN jumlah_penggunaan ELSE 0 END) AS "2017",
    SUM(CASE WHEN tahun = 2018 THEN jumlah_penggunaan ELSE 0 END) AS "2018"
FROM YearlyPayments
GROUP BY tipe_pembayaran
ORDER BY tipe_pembayaran;